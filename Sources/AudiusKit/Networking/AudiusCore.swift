import Foundation

private struct DiscoveryResponse: Decodable {
  let data: [String]
}

public actor AudiusCore {
  private let configuration: AudiusClientConfiguration
  private let session: URLSession
  private let jsonEncoder = JSONEncoder()
  private let jsonDecoder = JSONDecoder()

  private var currentHost: String?
  private var lastRefresh: Date?

  public init(configuration: AudiusClientConfiguration) {
    self.configuration = configuration
    self.session = URLSession(configuration: configuration.sessionConfiguration)
  }

  public func verifyToken(_ token: String) async throws -> AudiusVerifiedUserToken {
    let response = try await perform(
      operation: .verifyIdToken,
      queryItems: [URLQueryItem(name: "token", value: token)]
    )

    do {
      let root = try jsonDecoder.decode(JSONValue.self, from: response.body)
      guard let payload = root.objectValue?["data"]?.objectValue else {
        throw AudiusError.tokenVerificationFailed("Missing data payload")
      }

      let userId = payload["userId"]?.stringCoerced ?? payload["sub"]?.stringCoerced
      guard let userId else {
        throw AudiusError.tokenVerificationFailed("Missing userId")
      }

      return AudiusVerifiedUserToken(
        userId: userId,
        email: payload["email"]?.stringCoerced,
        name: payload["name"]?.stringCoerced,
        handle: payload["handle"]?.stringCoerced,
        verified: payload["verified"]?.boolValue,
        profilePicture: payload["profilePicture"],
        apiKey: payload["apiKey"]?.stringCoerced,
        sub: payload["sub"]?.stringCoerced,
        iat: payload["iat"]?.stringCoerced
      )
    } catch let error as AudiusError {
      throw error
    } catch {
      throw AudiusError.tokenVerificationFailed(error.localizedDescription)
    }
  }

  public func perform(
    operation: AudiusOperation,
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    let spec = try AudiusOperationRegistry.spec(for: operation)
    let resolvedPath = try resolvePath(spec.path, with: pathParameters)

    let authHeader = try await resolveAuthHeader(for: spec.auth)

    var mergedHeaders = headers
    if let authHeader {
      mergedHeaders["Authorization"] = authHeader
    }

    let url = try await buildURL(path: resolvedPath, queryItems: queryItems)
    var request = URLRequest(url: url)
    request.httpMethod = spec.method.rawValue

    for (key, value) in mergedHeaders {
      request.setValue(value, forHTTPHeaderField: key)
    }

    if let body {
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpBody = try encode(body: body)
    }

    do {
      let (data, response) = try await session.data(for: request)
      guard let httpResponse = response as? HTTPURLResponse else {
        throw AudiusError.network("Invalid HTTP response")
      }

      if (200...299).contains(httpResponse.statusCode) {
        return AudiusHTTPResponse(
          statusCode: httpResponse.statusCode,
          headers: headerMap(httpResponse),
          body: data
        )
      }

      if shouldUseProxyFallback(spec: spec, statusCode: httpResponse.statusCode),
        let proxy = configuration.writeProxy
      {
        let proxyRequest = AudiusProxyRequest(
          operation: operation,
          path: resolvedPath,
          method: spec.method,
          queryItems: queryItems,
          headers: mergedHeaders,
          body: body
        )
        return try await proxy.execute(proxyRequest)
      }

      throw mapHTTPError(statusCode: httpResponse.statusCode, data: data)
    } catch let error as AudiusError {
      throw error
    } catch {
      throw AudiusError.network(error.localizedDescription)
    }
  }

  private func shouldUseProxyFallback(spec: AudiusOperationSpec, statusCode: Int) -> Bool {
    guard spec.method != .get else { return false }
    guard spec.auth != .none else { return false }
    return [400, 401, 403].contains(statusCode)
  }

  private func encode(body: JSONValue) throws -> Data {
    do {
      return try jsonEncoder.encode(body)
    } catch {
      throw AudiusError.requestEncoding(error.localizedDescription)
    }
  }

  private func resolvePath(_ template: String, with values: [String: String]) throws -> String {
    var path = template
    let regex = try NSRegularExpression(pattern: #"\{([^\}]+)\}"#)
    let matches = regex.matches(in: template, range: NSRange(template.startIndex..., in: template))

    for match in matches.reversed() {
      guard match.numberOfRanges > 1,
        let keyRange = Range(match.range(at: 1), in: template),
        let fullRange = Range(match.range(at: 0), in: template)
      else {
        continue
      }
      let key = String(template[keyRange])
      guard let value = values[key] else {
        throw AudiusError.missingPathParameter(key)
      }
      path.replaceSubrange(fullRange, with: value)
    }

    return path
  }

  private func mapHTTPError(statusCode: Int, data: Data) -> AudiusError {
    let message = String(data: data, encoding: .utf8) ?? ""

    switch statusCode {
    case 400:
      return .validationError(message)
    case 401:
      return .unauthorized(message)
    case 403:
      return .forbidden(message)
    case 404:
      return .notFound(message)
    case 409, 422:
      return .validationError(message)
    case 429:
      return .rateLimited(message)
    default:
      return .serverError(status: statusCode, message: message)
    }
  }

  private func headerMap(_ response: HTTPURLResponse) -> [String: String] {
    var output: [String: String] = [:]
    for (key, value) in response.allHeaderFields {
      output[String(describing: key)] = String(describing: value)
    }
    return output
  }

  private func buildURL(path: String, queryItems: [URLQueryItem]) async throws -> URL {
    let host = try await hostBase()
    var components = URLComponents(string: host + "/v1/" + path)
    var merged = queryItems
    merged.append(URLQueryItem(name: "app_name", value: configuration.appName))
    components?.queryItems = merged

    guard let url = components?.url else {
      throw AudiusError.invalidURL
    }
    return url
  }

  private func resolveAuthHeader(for requirement: AudiusAuthRequirement) async throws -> String? {
    switch requirement {
    case .none:
      return nil
    case .basic:
      return try await basicHeaderOrThrow()
    case .bearer:
      return try await bearerHeaderOrThrow()
    case .basicOrBearer:
      if let bearer = try await bearerHeader() {
        return bearer
      }
      if let basic = try await basicHeader() {
        return basic
      }
      throw AudiusError.unauthorized("Operation requires bearer or basic auth")
    }
  }

  private func bearerHeader() async throws -> String? {
    switch configuration.auth.mode {
    case .none:
      return nil
    case .sessionBearer:
      if let token = try await configuration.sessionStore.load()?.token {
        return "Bearer \(token)"
      }
      return nil
    case .staticBearer(let token):
      return "Bearer \(token)"
    case .basic:
      return nil
    }
  }

  private func bearerHeaderOrThrow() async throws -> String {
    if let header = try await bearerHeader() {
      return header
    }
    throw AudiusError.unauthorized("Operation requires bearer auth")
  }

  private func basicHeader() async throws -> String? {
    switch configuration.auth.mode {
    case .basic(let username, let privateKey):
      let credential = "\(username):\(privateKey)"
      guard let data = credential.data(using: .utf8) else {
        throw AudiusError.requestEncoding("Unable to encode basic auth credential")
      }
      return "Basic \(data.base64EncodedString())"
    default:
      return nil
    }
  }

  private func basicHeaderOrThrow() async throws -> String {
    if let header = try await basicHeader() {
      return header
    }
    throw AudiusError.unauthorized("Operation requires basic auth")
  }

  private func hostBase() async throws -> String {
    if let host = currentHost,
      let lastRefresh,
      Date().timeIntervalSince(lastRefresh) < configuration.hostRefreshInterval
    {
      return host
    }

    do {
      let (data, response) = try await session.data(from: configuration.discoveryURL)
      guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
        throw AudiusError.hostUnavailable
      }
      let discovery = try jsonDecoder.decode(DiscoveryResponse.self, from: data)
      guard let discovered = discovery.data.first else {
        throw AudiusError.hostUnavailable
      }
      currentHost = discovered.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
      lastRefresh = Date()
      return currentHost!
    } catch {
      if let host = currentHost {
        return host
      }
      if configuration.discoveryURL.absoluteString.contains("api.audius.co") {
        return "https://api.audius.co"
      }
      throw AudiusError.hostUnavailable
    }
  }
}

private extension JSONValue {
  var objectValue: [String: JSONValue]? {
    if case .object(let value) = self { return value }
    return nil
  }

  var boolValue: Bool? {
    if case .bool(let value) = self { return value }
    return nil
  }

  var stringCoerced: String? {
    switch self {
    case .string(let value): return value
    case .number(let value): return String(value)
    case .bool(let value): return value ? "true" : "false"
    default: return nil
    }
  }
}
