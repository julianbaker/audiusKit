import XCTest
@testable import AudiusKit

final class SessionStoreTests: XCTestCase {
  func testInMemoryStoreRoundTrip() async throws {
    let store = InMemorySessionStore()
    let verified = AudiusVerifiedUserToken(
      userId: "123",
      email: "user@example.com",
      name: "User",
      handle: "user",
      verified: true,
      profilePicture: nil,
      apiKey: nil,
      sub: "123",
      iat: "1700000000"
    )
    let session = AudiusSession(token: "jwt-token", scope: .read, verifiedUser: verified)

    try await store.save(session)
    let loaded = try await store.load()
    XCTAssertEqual(loaded, session)

    try await store.clear()
    let cleared = try await store.load()
    XCTAssertNil(cleared)
  }
}
