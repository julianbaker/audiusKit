@testable import AudiusKit
import XCTest

final class TypedQuerySerializationTests: XCTestCase {
  func testArrayQueryExplodeFalseSerializesAsCommaSeparated() throws {
    let params = BulkGetDashboardWalletUsersParams(wallets: ["wallet-a", "wallet-b"])
    let items = try params.queryItems()

    XCTAssertEqual(items.count, 1)
    XCTAssertEqual(items.first?.name, "wallets")
    XCTAssertEqual(items.first?.value, "wallet-a,wallet-b")
  }

  func testArrayQueryExplodeTrueSerializesAsRepeatedKeys() throws {
    let params = GetBulkTracksParams(id: ["1", "2"])
    let items = try params.queryItems()

    let idItems = items.filter { $0.name == "id" }
    XCTAssertEqual(idItems.count, 2)
    XCTAssertEqual(idItems.compactMap { $0.value }, ["1", "2"])
  }

  func testMixedScalarAndArrayQuerySerialization() throws {
    let params = GetCoinsParams(limit: 25, mint: ["m1", "m2"], query: "coin")
    let items = try params.queryItems()

    XCTAssertTrue(items.contains(URLQueryItem(name: "limit", value: "25")))
    XCTAssertTrue(items.contains(URLQueryItem(name: "query", value: "coin")))

    let mintValues = items.filter { $0.name == "mint" }.compactMap(\ .value)
    XCTAssertEqual(mintValues, ["m1", "m2"])
  }
}
