import AudiusKit
import XCTest

final class CompatibilityShimTests: XCTestCase {
  func testSharedShimExposesClient() {
    let shared = AudiusAPIClient.shared
    XCTAssertNotNil(shared.client)
  }

  func testConfigureReplacesUnderlyingClient() {
    let shim = AudiusAPIClient(configuration: AudiusClientConfiguration(appName: "shim-a"))
    let initial = shim.client

    shim.configure(AudiusClientConfiguration(appName: "shim-b"))
    let updated = shim.client

    XCTAssertFalse(initial === updated)
  }
}
