import AudiusKit
import Foundation
import XCTest

final class TypedNetworkingTests: XCTestCase {
  override func tearDown() {
    StubURLProtocol.reset()
    super.tearDown()
  }

  func testTypedWriteDecodesResponseAndInjectsAuth() async throws {
    let capturedRequest = RequestBox<URLRequest>()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      capturedRequest.set(request)
      let body = #"{"success":true}"#.data(using: .utf8) ?? Data()
      return (Self.response(url: url, status: 200), body)
    }

    let client = makeClient(authMode: .staticBearer("typed-token"))
    let response = try await client.typed.tracks.favoriteTrack(.init(trackId: "7", userId: "22"))

    XCTAssertEqual(response.success, true)

    guard let request = capturedRequest.get(), let requestURL = request.url else {
      XCTFail("Expected API request")
      return
    }

    XCTAssertEqual(request.httpMethod, "POST")
    XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Bearer typed-token")
    XCTAssertTrue(requestURL.absoluteString.contains("/v1/tracks/7/favorites"))
  }

  func testTypedWriteUsesProxyFallback() async throws {
    let proxy = TypedRecordingProxy()

    StubURLProtocol.setHandler { request in
      guard let url = request.url else { throw URLError(.badURL) }
      if url.host == "discovery.test" {
        let body = #"{"data":["https://api-unit.test"]}"#.data(using: .utf8) ?? Data()
        return (Self.response(url: url, status: 200), body)
      }

      return (Self.response(url: url, status: 401), #"{"message":"unauthorized"}"#.data(using: .utf8) ?? Data())
    }

    let client = makeClient(authMode: .staticBearer("typed-token"), writeProxy: proxy)
    let result = try await client.typed.comments.createComment(
      .init(
        userId: "22",
        body: CreateCommentRequestBody(body: "hello", entityId: 12, entityType: .string("Track"))
      )
    )

    XCTAssertNotNil(result.success)
    let captured = await proxy.capturedRequest()
    XCTAssertEqual(captured?.operation, .createComment)
    XCTAssertEqual(captured?.headers["Authorization"], "Bearer typed-token")
  }
}

private actor TypedRecordingProxy: WriteProxyExecutor {
  private var request: AudiusProxyRequest?

  func execute(_ request: AudiusProxyRequest) async throws -> AudiusHTTPResponse<Data> {
    self.request = request
    return AudiusHTTPResponse(
      statusCode: 200,
      headers: ["X-Proxy": "typed"],
      body: #"{"success":true,"comment_id":"44"}"#.data(using: .utf8) ?? Data()
    )
  }

  func capturedRequest() -> AudiusProxyRequest? {
    request
  }
}

private extension TypedNetworkingTests {
  static func response(url: URL, status: Int) -> HTTPURLResponse {
    HTTPURLResponse(url: url, statusCode: status, httpVersion: "HTTP/1.1", headerFields: nil)!
  }

  func makeClient(authMode: AudiusAuthMode, writeProxy: (any WriteProxyExecutor)? = nil) -> AudiusClient {
    let sessionConfiguration = URLSessionConfiguration.ephemeral
    sessionConfiguration.protocolClasses = [StubURLProtocol.self]

    let configuration = AudiusClientConfiguration(
      appName: "AudiusKitTypedTests",
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
