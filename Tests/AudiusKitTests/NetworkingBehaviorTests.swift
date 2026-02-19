import AudiusKit
import Foundation
import XCTest

final class NetworkingBehaviorTests: XCTestCase {
  override func tearDown() {
    StubURLProtocol.reset()
    super.tearDown()
  }

  func testInjectsBearerAndAppName() async throws {
    let capturedRequest = RequestBox<URLRequest>()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      capturedRequest.set(request)
      return (Self.response(url: url, status: 200), Data())
    }

    let client = makeClient(authMode: .staticBearer("token-123"))
    _ = try await client.tracks.createTrack(queryItems: [URLQueryItem(name: "ids[]", value: "1"), URLQueryItem(name: "ids[]", value: "2")])

    guard let request = capturedRequest.get(), let requestURL = request.url else {
      XCTFail("Expected API request to be captured")
      return
    }

    XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Bearer token-123")
    XCTAssertEqual(request.httpMethod, "POST")

    let queryItems = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)?.queryItems ?? []
    XCTAssertTrue(queryItems.contains(URLQueryItem(name: "app_name", value: "AudiusKitTests")))
    XCTAssertEqual(queryItems.filter { $0.name == "ids[]" }.count, 2)
  }

  func testInjectsBasicAuthForBasicOperation() async throws {
    let capturedRequest = RequestBox<URLRequest>()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      capturedRequest.set(request)
      return (Self.response(url: url, status: 200), Data())
    }

    let client = makeClient(authMode: .basic(username: "alice", privateKey: "secret"))
    _ = try await client.users.updateUser(pathParameters: ["id": "7"])

    guard let request = capturedRequest.get() else {
      XCTFail("Expected API request to be captured")
      return
    }

    XCTAssertEqual(request.httpMethod, "PUT")
    XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Basic YWxpY2U6c2VjcmV0")
  }

  func testMissingPathParameterThrowsBeforeRequest() async throws {
    let requestCount = CounterBox()
    StubURLProtocol.setHandler { request in
      requestCount.increment()
      guard let url = request.url else { throw URLError(.badURL) }
      return (Self.response(url: url, status: 200), Data())
    }

    let client = makeClient(authMode: .none)

    do {
      _ = try await client.tracks.getTrack()
      XCTFail("Expected missingPathParameter")
    } catch let error as AudiusError {
      guard case .missingPathParameter(let name) = error else {
        XCTFail("Unexpected AudiusError: \(error)")
        return
      }
      XCTAssertEqual(name, "track_id")
    }

    XCTAssertEqual(requestCount.get(), 0)
  }

  func testUsesProxyFallbackOnWriteAuthFailure() async throws {
    let proxy = RecordingProxy()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      return (Self.response(url: url, status: 401), #"{"message":"unauthorized"}"#.data(using: .utf8) ?? Data())
    }

    let client = makeClient(authMode: .staticBearer("token-123"), writeProxy: proxy)
    let response = try await client.comments.createComment(body: .object(["text": .string("hello")]))

    XCTAssertEqual(response.statusCode, 200)
    let captured = await proxy.capturedRequest()
    XCTAssertEqual(captured?.operation, .createComment)
    XCTAssertEqual(captured?.headers["Authorization"], "Bearer token-123")
  }

  func testDoesNotProxyFallbackOnPlain400ValidationError() async throws {
    let proxy = RecordingProxy()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      return (Self.response(url: url, status: 400), #"{"message":"invalid field value"}"#.data(using: .utf8) ?? Data())
    }

    let client = makeClient(authMode: .staticBearer("token-123"), writeProxy: proxy)
    do {
      _ = try await client.comments.createComment(body: .object(["text": .string("hello")]))
      XCTFail("Expected validation error")
    } catch let error as AudiusError {
      guard case .validationError = error else {
        XCTFail("Expected validationError but got \(error)")
        return
      }
    }

    let captured = await proxy.capturedRequest()
    XCTAssertNil(captured, "Proxy should NOT be invoked for plain 400 without auth signal")
  }

  func testProxiesFallbackOn400WithAuthSignalInBody() async throws {
    let proxy = RecordingProxy()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      return (Self.response(url: url, status: 400), #"{"message":"bearer token expired"}"#.data(using: .utf8) ?? Data())
    }

    let client = makeClient(authMode: .staticBearer("token-123"), writeProxy: proxy)
    let response = try await client.comments.createComment(body: .object(["text": .string("hello")]))

    XCTAssertEqual(response.statusCode, 200)
    let captured = await proxy.capturedRequest()
    XCTAssertNotNil(captured, "Proxy SHOULD be invoked for 400 with auth keyword in body")
    XCTAssertEqual(captured?.operation, .createComment)
  }

  func testPathParametersArePercentEncoded() async throws {
    let capturedRequest = RequestBox<URLRequest>()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      capturedRequest.set(request)
      return (Self.response(url: url, status: 200), Data())
    }

    let client = makeClient(authMode: .none)
    _ = try await client.tracks.getTrack(pathParameters: ["track_id": "abc/def?q=1&x=2"])

    guard let request = capturedRequest.get(), let url = request.url else {
      XCTFail("Expected API request to be captured")
      return
    }

    let urlString = url.absoluteString
    // The path portion is between the host and the query string
    // Verify that special characters in the path parameter value are percent-encoded
    XCTAssertTrue(urlString.contains("%3F"), "Question mark in path param should be percent-encoded as %3F")
    XCTAssertTrue(urlString.contains("%26"), "Ampersand in path param should be percent-encoded as %26")
    XCTAssertTrue(urlString.contains("%2F"), "Forward slash in path param should be percent-encoded as %2F")
  }
}

private actor RecordingProxy: WriteProxyExecutor {
  private var request: AudiusProxyRequest?

  func execute(_ request: AudiusProxyRequest) async throws -> AudiusHTTPResponse<Data> {
    self.request = request
    return AudiusHTTPResponse(
      statusCode: 200,
      headers: ["X-Proxy": "true"],
      body: #"{"ok":true}"#.data(using: .utf8) ?? Data()
    )
  }

  func capturedRequest() -> AudiusProxyRequest? {
    request
  }
}

private extension NetworkingBehaviorTests {
  static func response(url: URL, status: Int) -> HTTPURLResponse {
    HTTPURLResponse(url: url, statusCode: status, httpVersion: "HTTP/1.1", headerFields: nil)!
  }

  func makeClient(authMode: AudiusAuthMode, writeProxy: (any WriteProxyExecutor)? = nil) -> AudiusClient {
    let sessionConfiguration = URLSessionConfiguration.ephemeral
    sessionConfiguration.protocolClasses = [StubURLProtocol.self]

    let configuration = AudiusClientConfiguration(
      appName: "AudiusKitTests",
      discoveryURL: URL(string: "https://discovery.test")!,
      sessionConfiguration: sessionConfiguration,
      auth: AudiusAuthConfiguration(mode: authMode),
      sessionStore: InMemorySessionStore(),
      writeProxy: writeProxy
    )
    return AudiusClient(configuration: configuration)
  }
}

private final class RequestBox<T>: @unchecked Sendable {
  private let lock = NSLock()
  private var value: T?

  func set(_ value: T) {
    lock.lock()
    self.value = value
    lock.unlock()
  }

  func get() -> T? {
    lock.lock()
    defer { lock.unlock() }
    return value
  }
}

private final class CounterBox: @unchecked Sendable {
  private let lock = NSLock()
  private var value: Int = 0

  func increment() {
    lock.lock()
    value += 1
    lock.unlock()
  }

  func get() -> Int {
    lock.lock()
    defer { lock.unlock() }
    return value
  }
}
