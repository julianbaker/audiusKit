import AudiusKit
import Foundation
import XCTest

final class SwaggerManifestTests: XCTestCase {
  func testRegistryMatchesSwaggerManifest() throws {
    let manifest = try loadManifest()

    XCTAssertEqual(manifest.operationCount, 157)
    XCTAssertEqual(manifest.operationCount, AudiusOperationRegistry.all.count)

    let manifestOperations = Set(manifest.operations)
    let registryOperations = Set(
      AudiusOperationRegistry.all.map {
        ManifestOperation(
          method: $0.method.rawValue,
          path: $0.path,
          tag: $0.tag.rawValue,
          auth: $0.auth.rawValue
        )
      }
    )

    XCTAssertEqual(manifestOperations, registryOperations)
  }

  private func loadManifest() throws -> ManifestDocument {
    guard let manifestURL = Bundle.module.url(forResource: "operation_manifest", withExtension: "json") else {
      XCTFail("Missing operation_manifest.json resource")
      throw AudiusError.notFound("operation_manifest.json")
    }
    let data = try Data(contentsOf: manifestURL)
    return try JSONDecoder().decode(ManifestDocument.self, from: data)
  }
}

private struct ManifestDocument: Decodable {
  let operationCount: Int
  let operations: [ManifestOperation]

  enum CodingKeys: String, CodingKey {
    case operationCount = "operation_count"
    case operations
  }
}

private struct ManifestOperation: Decodable, Hashable {
  let method: String
  let path: String
  let tag: String
  let auth: String
}
