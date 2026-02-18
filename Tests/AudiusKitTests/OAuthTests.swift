import XCTest
@testable import AudiusKit

final class OAuthTests: XCTestCase {
  func testOAuthURLBuilderIncludesRequiredParams() throws {
    let request = AudiusOAuthRequest(
      scope: .write,
      apiKey: "my_api_key",
      redirectURI: "https://example.com/callback",
      state: "state-123"
    )

    let url = try AudiusOAuthURLBuilder.buildURL(request: request)
    let absolute = url.absoluteString
    XCTAssertTrue(absolute.contains("scope=write"))
    XCTAssertTrue(absolute.contains("api_key=my_api_key"))
    XCTAssertTrue(absolute.contains("state=state-123"))
  }

  func testParsesQueryCallback() throws {
    let url = URL(string: "myapp://oauth/callback?token=abc123&state=s1")!
    let parsed = try XCTUnwrap(AudiusOAuthCallbackParser.parse(url: url))
    XCTAssertEqual(parsed.token, "abc123")
    XCTAssertEqual(parsed.state, "s1")
  }

  func testParsesFragmentCallback() throws {
    let url = URL(string: "myapp://oauth/callback#token=abc123&state=s1")!
    let parsed = try XCTUnwrap(AudiusOAuthCallbackParser.parse(url: url))
    XCTAssertEqual(parsed.token, "abc123")
    XCTAssertEqual(parsed.state, "s1")
  }

  func testStateMismatchThrows() {
    let url = URL(string: "myapp://oauth/callback?token=abc123&state=wrong")!
    XCTAssertThrowsError(try AudiusOAuthCallbackParser.parseAndValidate(url: url, expectedState: "expected")) { error in
      guard case AudiusError.oauthStateMismatch = error else {
        return XCTFail("Expected oauthStateMismatch, got \(error)")
      }
    }
  }
}
