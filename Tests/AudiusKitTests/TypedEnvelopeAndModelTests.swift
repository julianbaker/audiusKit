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

  func testDecodeTypedParsesISO8601DatesIncludingFractionalSeconds() throws {
    let wholeSecondsResponse = makeResponse(body: #"{"data":{"created_at":"2026-02-11T17:53:15Z"}}"#)
    let wholeSecondsDecoded: AudiusEnvelope<DateCarrier> = try wholeSecondsResponse.decodeTyped(
      AudiusEnvelope<DateCarrier>.self,
      operation: .getTrack
    )
    XCTAssertEqual(wholeSecondsDecoded.data.createdAt.timeIntervalSince1970, 1_770_832_395, accuracy: 0.001)

    let fractionalResponse = makeResponse(body: #"{"data":{"created_at":"2026-02-11T17:53:15.123Z"}}"#)
    let fractionalDecoded: AudiusEnvelope<DateCarrier> = try fractionalResponse.decodeTyped(
      AudiusEnvelope<DateCarrier>.self,
      operation: .getTrack
    )
    XCTAssertEqual(fractionalDecoded.data.createdAt.timeIntervalSince1970, 1_770_832_395.123, accuracy: 0.001)
  }

  func testDecodeTypedParsesUnixTimestampDates() throws {
    let secondsResponse = makeResponse(body: #"{"data":{"created_at":1770832395}}"#)
    let secondsDecoded: AudiusEnvelope<DateCarrier> = try secondsResponse.decodeTyped(
      AudiusEnvelope<DateCarrier>.self,
      operation: .getTrack
    )
    XCTAssertEqual(secondsDecoded.data.createdAt.timeIntervalSince1970, 1_770_832_395, accuracy: 0.001)

    let millisecondsResponse = makeResponse(body: #"{"data":{"created_at":1770832395123}}"#)
    let millisecondsDecoded: AudiusEnvelope<DateCarrier> = try millisecondsResponse.decodeTyped(
      AudiusEnvelope<DateCarrier>.self,
      operation: .getTrack
    )
    XCTAssertEqual(millisecondsDecoded.data.createdAt.timeIntervalSince1970, 1_770_832_395.123, accuracy: 0.001)
  }

  func testDecodeTypedIncludesDecodingPathInError() throws {
    let response = makeResponse(body: #"{"data":{"id":"1"}}"#)

    XCTAssertThrowsError(
      try response.decodeTyped(AudiusEnvelope<RequiredValue>.self, operation: .getTrack)
    ) { error in
      guard case let AudiusError.decoding(message) = error else {
        XCTFail("Expected decoding error but got \(error)")
        return
      }
      XCTAssertTrue(message.contains("Operation getTrack"))
      XCTAssertTrue(message.contains("keyNotFound"))
      XCTAssertTrue(message.contains("required_value"))
      XCTAssertTrue(message.contains("at data"))
    }
  }

  func testListEnvelopeDecodingFailsWhenElementIsInvalid() throws {
    let response = makeResponse(
      body: #"{"data":[{"id":"1","name":"first"},{"id":"2"},{"id":"3","name":"third"}]}"#
    )

    XCTAssertThrowsError(
      try response.decodeTyped(AudiusListEnvelope<LossyElement>.self, operation: .getTrendingTracks)
    ) { error in
      guard case let AudiusError.decoding(message) = error else {
        XCTFail("Expected decoding error but got \(error)")
        return
      }
      XCTAssertTrue(message.contains("Operation getTrendingTracks"))
    }
  }

  func testTrackDecodesSimpleAccessShapeFromTrendingPayload() throws {
    let response = makeResponse(
      body: #"""
      {
        "data": [
          {
            "access": { "stream": true, "download": true },
            "artwork": {},
            "comment_count": 8,
            "duration": 3971,
            "favorite_count": 83,
            "genre": "Electronic",
            "id": "Vrp03Q",
            "is_downloadable": false,
            "is_original_available": false,
            "permalink": "/migueldbj/clubkultur",
            "play_count": 1875,
            "repost_count": 62,
            "title": "clubkultur — Session 04",
            "user": {
              "album_count": 0,
              "erc_wallet": "0xabc",
              "followee_count": 0,
              "follower_count": 0,
              "handle": "migueldbj",
              "id": "naA9w",
              "is_available": true,
              "is_deactivated": false,
              "is_verified": false,
              "name": "Miguel",
              "playlist_count": 0,
              "repost_count": 0,
              "spl_usdc_wallet": null,
              "spl_wallet": null,
              "supporter_count": 0,
              "supporting_count": 0,
              "total_audio_balance": 0,
              "track_count": 1,
              "verified_with_instagram": false,
              "verified_with_tiktok": false,
              "verified_with_twitter": false,
              "wallet": "0xdef"
            }
          }
        ]
      }
      """#
    )

    let decoded: AudiusListEnvelope<Track> = try response.decodeTyped(
      AudiusListEnvelope<Track>.self,
      operation: .getTrendingTracks
    )

    XCTAssertEqual(decoded.data.count, 1)
    XCTAssertEqual(decoded.data.first?.access?.stream, true)
    XCTAssertEqual(decoded.data.first?.access?.download, true)
    XCTAssertNil(decoded.data.first?.user.splUsdcWallet)
    XCTAssertNil(decoded.data.first?.user.splWallet)
  }

  func testTopListenersDecodeLiveShape() throws {
    let response = makeResponse(
      body: #"""
      {
        "data": [
          {
            "count": 26,
            "user": {
              "album_count": 0,
              "erc_wallet": "0xabc",
              "followee_count": 44,
              "follower_count": 2,
              "handle": "patis01",
              "id": "q7zWYXY",
              "is_available": true,
              "is_deactivated": false,
              "is_verified": false,
              "name": "Patis@",
              "playlist_count": 1,
              "repost_count": 9,
              "spl_usdc_wallet": null,
              "spl_wallet": null,
              "supporter_count": 0,
              "supporting_count": 3,
              "total_audio_balance": 4,
              "track_count": 0,
              "verified_with_instagram": false,
              "verified_with_tiktok": false,
              "verified_with_twitter": false,
              "wallet": "0xdef"
            }
          }
        ]
      }
      """#
    )

    let decoded: AudiusListEnvelope<TopListener> = try response.decodeTyped(
      AudiusListEnvelope<TopListener>.self,
      operation: .getTrackTopListeners
    )

    XCTAssertEqual(decoded.data.count, 1)
    XCTAssertEqual(decoded.data.first?.count, 26)
    XCTAssertEqual(decoded.data.first?.user?.handle, "patis01")
  }

  private func makeResponse(body: String) -> AudiusHTTPResponse<Data> {
    AudiusHTTPResponse(statusCode: 200, headers: [:], body: Data(body.utf8))
  }
}

private struct DateCarrier: Codable, Sendable {
  let createdAt: Date

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
  }
}

private struct RequiredValue: Codable, Sendable {
  let id: String
  let requiredValue: String

  enum CodingKeys: String, CodingKey {
    case id
    case requiredValue = "required_value"
  }
}

private struct LossyElement: Codable, Sendable {
  let id: String
  let name: String
}
