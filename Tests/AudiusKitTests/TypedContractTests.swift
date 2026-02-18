import AudiusKit
import XCTest

final class TypedContractTests: XCTestCase {
  func testTypedRegistryMatchesRawRegistry() {
    XCTAssertEqual(AudiusTypedOperationRegistry.all.count, 157)
    XCTAssertEqual(AudiusTypedOperationRegistry.all.count, AudiusOperationRegistry.all.count)

    let rawByOperation = Dictionary(uniqueKeysWithValues: AudiusOperationRegistry.all.map { ($0.operation, $0) })

    for typedSpec in AudiusTypedOperationRegistry.all {
      guard let rawSpec = rawByOperation[typedSpec.operation] else {
        XCTFail("Missing raw spec for \(typedSpec.operation.rawValue)")
        continue
      }

      XCTAssertEqual(typedSpec.method, rawSpec.method, "Method mismatch for \(typedSpec.operation.rawValue)")
      XCTAssertEqual(typedSpec.path, rawSpec.path, "Path mismatch for \(typedSpec.operation.rawValue)")
      XCTAssertEqual(typedSpec.tag, rawSpec.tag, "Tag mismatch for \(typedSpec.operation.rawValue)")
      XCTAssertEqual(typedSpec.auth, rawSpec.auth, "Auth mismatch for \(typedSpec.operation.rawValue)")
    }
  }
}
