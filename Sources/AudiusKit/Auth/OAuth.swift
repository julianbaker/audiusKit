import Foundation

public enum AudiusOAuthResponseMode: String, Sendable, Codable {
  case fragment
  case query
}

public enum AudiusOAuthDisplay: String, Sendable, Codable {
  case popup
  case fullScreen
}

public struct AudiusOAuthRequest: Sendable {
  public let scope: AudiusOAuthScope
  public let apiKey: String
  public let redirectURI: String
  public let origin: String?
  public let state: String
  public let responseMode: AudiusOAuthResponseMode
  public let display: AudiusOAuthDisplay

  public init(
    scope: AudiusOAuthScope,
    apiKey: String,
    redirectURI: String,
    origin: String? = nil,
    state: String,
    responseMode: AudiusOAuthResponseMode = .query,
    display: AudiusOAuthDisplay = .fullScreen
  ) {
    self.scope = scope
    self.apiKey = apiKey
    self.redirectURI = redirectURI
    self.origin = origin
    self.state = state
    self.responseMode = responseMode
    self.display = display
  }
}

public struct AudiusOAuthCallback: Sendable, Equatable {
  public let token: String
  public let state: String?

  public init(token: String, state: String?) {
    self.token = token
    self.state = state
  }
}

public enum AudiusOAuthURLBuilder {
  public static func buildURL(request: AudiusOAuthRequest) throws -> URL {
    var components = URLComponents(string: "https://audius.co/oauth/auth")
    var queryItems = [
      URLQueryItem(name: "scope", value: request.scope.rawValue),
      URLQueryItem(name: "api_key", value: request.apiKey),
      URLQueryItem(name: "redirect_uri", value: request.redirectURI),
      URLQueryItem(name: "state", value: request.state),
      URLQueryItem(name: "response_mode", value: request.responseMode.rawValue),
      URLQueryItem(name: "display", value: request.display.rawValue),
    ]
    if let origin = request.origin {
      queryItems.append(URLQueryItem(name: "origin", value: origin))
    }
    components?.queryItems = queryItems

    guard let url = components?.url else {
      throw AudiusError.invalidURL
    }
    return url
  }

  public static func generateState(length: Int = 32) -> String {
    let chars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    var result = ""
    result.reserveCapacity(length)
    for _ in 0..<length {
      result.append(chars[Int.random(in: 0..<chars.count)])
    }
    return result
  }
}

public enum AudiusOAuthCallbackParser {
  public static func parse(url: URL) -> AudiusOAuthCallback? {
    if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
      let queryItems = components.queryItems
    {
      let token = queryItems.first(where: { $0.name == "token" })?.value
      let state = queryItems.first(where: { $0.name == "state" })?.value
      if let token {
        return AudiusOAuthCallback(token: token, state: state)
      }
    }

    if let fragment = URLComponents(url: url, resolvingAgainstBaseURL: false)?.fragment {
      let fragmentItems = fragment
        .split(separator: "&")
        .compactMap { item -> (String, String)? in
          let parts = item.split(separator: "=", maxSplits: 1).map(String.init)
          guard parts.count == 2 else { return nil }
          return (parts[0], parts[1].removingPercentEncoding ?? parts[1])
        }
      let token = fragmentItems.first(where: { $0.0 == "token" })?.1
      let state = fragmentItems.first(where: { $0.0 == "state" })?.1
      if let token {
        return AudiusOAuthCallback(token: token, state: state)
      }
    }

    return nil
  }

  public static func parseAndValidate(url: URL, expectedState: String) throws -> AudiusOAuthCallback {
    guard let callback = parse(url: url) else {
      throw AudiusError.tokenVerificationFailed("Missing OAuth token in callback URL")
    }
    if callback.state != expectedState {
      throw AudiusError.oauthStateMismatch
    }
    return callback
  }
}
