import XCTest
@testable import AudiusKit

final class OperationRegistryTests: XCTestCase {
  func testOperationCountMatchesSourceSwagger() {
    XCTAssertEqual(AudiusOperationRegistry.all.count, 157)
    XCTAssertEqual(Set(AudiusOperation.allCases).count, 157)
  }

  func testHasExpectedCoreOperations() throws {
    let verifySpec = try AudiusOperationRegistry.spec(for: .verifyIdToken)
    XCTAssertEqual(verifySpec.path, "users/verify_token")
    XCTAssertEqual(verifySpec.method, .get)

    let createTrackSpec = try AudiusOperationRegistry.spec(for: .createTrack)
    XCTAssertEqual(createTrackSpec.method, .post)
    XCTAssertEqual(createTrackSpec.auth, .basicOrBearer)
  }
}
