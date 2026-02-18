import AudiusKit
import Foundation
import XCTest

final class TypedEnvelopeAndModelTests: XCTestCase {
  func testDecodesEnvelopeVariants() throws {
    let objectResponse = makeResponse(body: #"{"data":42}"#)
    let decodedObject: AudiusEnvelope<Int> = try objectResponse.decodeTyped(AudiusEnvelope<Int>.self, operation: .getTrackCommentCount)
    XCTAssertEqual(decodedObject.data, 42)

    let listResponse = makeResponse(body: #"{"data":["one","two"]}"#)
    let decodedList: AudiusListEnvelope<String> = try listResponse.decodeTyped(AudiusListEnvelope<String>.self, operation: .searchUsers)
    XCTAssertEqual(decodedList.data, ["one", "two"])

    let optionalResponse = makeResponse(body: #"{"data":null}"#)
    let decodedOptional: AudiusOptionalEnvelope<String> = try optionalResponse.decodeTyped(AudiusOptionalEnvelope<String>.self, operation: .getCoin)
    XCTAssertNil(decodedOptional.data)
  }

  func testDecodesRepresentativeTypedModels() throws {
    let userIdAddress = try JSONDecoder().decode(UserIdAddress.self, from: Data(#"{"address":"0xabc","user_id":"12"}"#.utf8))
    XCTAssertEqual(userIdAddress.address, "0xabc")
    XCTAssertEqual(userIdAddress.userId, "12")

    let trackId = try JSONDecoder().decode(TrackId.self, from: Data(#"{"id":"99"}"#.utf8))
    XCTAssertEqual(trackId.id, "99")

    let playlistTimestamp = try JSONDecoder().decode(PlaylistAddedTimestamp.self, from: Data(#"{"track_id":"99","timestamp":100}"#.utf8))
    XCTAssertEqual(playlistTimestamp.trackId, "99")
    XCTAssertEqual(playlistTimestamp.timestamp, 100)

    let mention = try JSONDecoder().decode(CommentMention.self, from: Data(#"{"handle":"julian","user_id":7}"#.utf8))
    XCTAssertEqual(mention.handle, "julian")
    XCTAssertEqual(mention.userId, 7)

    let coinMember = try JSONDecoder().decode(CoinMember.self, from: Data(#"{"balance":123,"user_id":"3"}"#.utf8))
    XCTAssertEqual(coinMember.balance, 123)
    XCTAssertEqual(coinMember.userId, "3")
  }

  private func makeResponse(body: String) -> AudiusHTTPResponse<Data> {
    AudiusHTTPResponse(statusCode: 200, headers: [:], body: Data(body.utf8))
  }
}
