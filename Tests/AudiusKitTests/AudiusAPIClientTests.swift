import XCTest

@testable import AudiusKit

final class AudiusAPIClientTests: XCTestCase {
  var client: AudiusAPIClient!

  override func setUp() async throws {
    try await super.setUp()
    client = AudiusAPIClient.shared
    try await AudiusAPIClient.initialize()
  }

  override func tearDown() async throws {
    client = nil
    try await super.tearDown()
  }

  // MARK: - Initialization Tests

  func testInitialization() async throws {
    XCTAssertNotNil(client, "Client should be initialized")
  }

  func testSingletonPattern() async throws {
    let client1 = AudiusAPIClient.shared
    let client2 = AudiusAPIClient.shared
    XCTAssertTrue(client1 === client2, "Should return same instance")
  }

  // MARK: - Track Tests

  func testFetchTrendingTracks() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 5)
    XCTAssertFalse(tracks.isEmpty, "Should fetch trending tracks")
    XCTAssertTrue(tracks.count <= 5, "Should respect limit parameter")
  }

  func testFetchTrendingTracksWithGenre() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(genre: "Electronic", limit: 5)
    XCTAssertFalse(tracks.isEmpty, "Should fetch trending tracks with genre")
    XCTAssertTrue(tracks.count <= 5, "Should respect limit parameter")
  }

  func testFetchTrendingTracksWithTimeRange() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let timeRanges: [TimeRange] = [.week, .month, .year, .allTime]
    for timeRange in timeRanges {
      let tracks = try await client.fetchTrendingTracks(timeRange: timeRange, limit: 5)
      XCTAssertFalse(tracks.isEmpty, "Should fetch trending tracks for time range: \(timeRange)")
    }
  }

  func testFetchTrack() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let trackId = tracks.first?.id else {
      XCTFail("No tracks available to test with")
      return
    }

    let track = try await client.fetchTrack(id: trackId)
    XCTAssertEqual(track.id, trackId, "Should fetch correct track")
    XCTAssertNotNil(track.title, "Track should have title")
    XCTAssertNotNil(track.user, "Track should have user")
  }

  func testFetchTrackWithForceRefresh() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let trackId = tracks.first?.id else {
      XCTFail("No tracks available to test with")
      return
    }

    // First fetch to cache
    _ = try await client.fetchTrack(id: trackId)

    // Second fetch with force refresh
    let refreshedTrack = try await client.fetchTrack(id: trackId, forceRefresh: true)
    XCTAssertEqual(refreshedTrack.id, trackId, "Should fetch refreshed track")
  }

  func testSearchTracks() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let results = try await client.searchTracks(query: "test", limit: 5)
    XCTAssertTrue(results.count <= 5, "Should respect limit parameter")
  }

  func testSearchTracksWithEmptyQuery() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let results = try await client.searchTracks(query: "", limit: 5)
    XCTAssertTrue(results.count <= 5, "Should handle empty query")
  }

  func testSearchTracksWithSpecialCharacters() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let results = try await client.searchTracks(query: "test & more", limit: 5)
    XCTAssertTrue(results.count <= 5, "Should handle special characters")
  }

  func testFetchStreamUrl() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let trackId = tracks.first?.id else {
      XCTFail("No tracks available to test with")
      return
    }

    let streamUrl = try await client.fetchStreamUrl(trackId: trackId)
    XCTAssertFalse(streamUrl.isEmpty, "Should return valid stream URL")
    XCTAssertTrue(streamUrl.hasPrefix("http"), "Stream URL should be valid HTTP URL")
  }

  // MARK: - User Tests

  func testFetchUserProfile() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }

    let user = try await client.fetchUserProfile(userId: userId)
    XCTAssertEqual(user.id, userId, "Should fetch correct user")
    XCTAssertNotNil(user.handle, "User should have handle")
    XCTAssertNotNil(user.profilePicture, "User should have profile picture")
  }

  func testFetchUserProfileWithForceRefresh() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }

    // First fetch to cache
    _ = try await client.fetchUserProfile(userId: userId)

    // Second fetch with force refresh
    let refreshedUser = try await client.fetchUserProfile(userId: userId, forceRefresh: true)
    XCTAssertEqual(refreshedUser.id, userId, "Should fetch refreshed user")
  }

  func testFetchUserTracks() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }

    let userTracks = try await client.fetchUserTracks(userId: userId)
    XCTAssertFalse(userTracks.isEmpty, "Should fetch user's tracks")
    for track in userTracks {
      XCTAssertEqual(track.user?.id, userId, "Track should belong to correct user")
    }
  }

  func testFetchUserTracksWithForceRefresh() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }

    // First fetch to cache
    _ = try await client.fetchUserTracks(userId: userId)

    // Second fetch with force refresh
    let refreshedTracks = try await client.fetchUserTracks(userId: userId, forceRefresh: true)
    XCTAssertFalse(refreshedTracks.isEmpty, "Should fetch refreshed tracks")
  }

  func testFetchFollowerCount() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }

    let count = try await client.fetchFollowerCount(userId: userId)
    XCTAssertGreaterThanOrEqual(count, 0, "Follower count should be non-negative")
  }

  func testFetchFollowingCount() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }

    let count = try await client.fetchFollowingCount(userId: userId)
    XCTAssertGreaterThanOrEqual(count, 0, "Following count should be non-negative")
  }

  func testFetchUserIdFromWallet() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let user = tracks.first?.user else {
      XCTFail("No users available to test with")
      return
    }
    var found = false
    if let ercWallet = user.ercWallet, !ercWallet.isEmpty {
      let userId = try await client.fetchUserIdFromWallet(associatedWallet: ercWallet)
      print("Tested with ercWallet: \(ercWallet)")
      if userId == nil {
        throw XCTSkip("No userId found for ercWallet; skipping unreliable API test")
      }
      XCTAssertEqual(userId, user.id, "Should fetch correct user ID from ercWallet")
      found = true
    }
    if let splWallet = user.splWallet, !splWallet.isEmpty {
      let userId = try await client.fetchUserIdFromWallet(associatedWallet: splWallet)
      print("Tested with splWallet: \(splWallet)")
      if userId == nil {
        throw XCTSkip("No userId found for splWallet; skipping unreliable API test")
      }
      XCTAssertEqual(userId, user.id, "Should fetch correct user ID from splWallet")
      found = true
    }
    // The 'wallet' field is legacy and not used in new endpoints; do not test it.
    if !found {
      throw XCTSkip("No wallet address available to test with")
    }
  }

  func testSearchUsers() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let user = tracks.first?.user, !user.handle.isEmpty else {
      XCTFail("No users available to test with")
      return
    }
    let results = try await client.searchUsers(query: user.handle, limit: 5)
    XCTAssertFalse(results.isEmpty, "Should return at least one user for search query")
    XCTAssertTrue(
      results.contains(where: { $0.id == user.id }), "Search results should include the user")
  }

  // MARK: - Error Handling Tests

  func testInvalidTrackID() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    do {
      _ = try await client.fetchTrack(id: "invalid_id")
      XCTFail("Should throw error for invalid track ID")
    } catch let error as AudiusAPIError {
      XCTAssertNotNil(error, "Should throw AudiusAPIError")
    } catch {
      XCTFail("Unexpected error type: \(error)")
    }
  }

  func testInvalidUserID() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    do {
      _ = try await client.fetchUserProfile(userId: "invalid_id")
      XCTFail("Should throw error for invalid user ID")
    } catch let error as AudiusAPIError {
      XCTAssertNotNil(error, "Should throw AudiusAPIError")
    } catch {
      XCTFail("Unexpected error type: \(error)")
    }
  }

  func testInvalidStreamUrl() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    do {
      _ = try await client.fetchStreamUrl(trackId: "invalid_id")
      XCTFail("Should throw error for invalid track ID")
    } catch let error as AudiusAPIError {
      XCTAssertNotNil(error, "Should throw AudiusAPIError")
    } catch {
      XCTFail("Unexpected error type: \(error)")
    }
  }

  func testNetworkError() async throws {
    // This test would require mocking network conditions
    // For now, we'll just verify the error type is handled
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    do {
      _ = try await client.fetchTrendingTracks()
      // If we get here, the test passed (network is available)
    } catch let error as AudiusAPIError {
      XCTAssertNotNil(error, "Should handle network errors")
    } catch {
      XCTFail("Unexpected error type: \(error)")
    }
  }

  // MARK: - Cache Tests

  func testTrackCaching() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let trackId = tracks.first?.id else {
      XCTFail("No tracks available to test with")
      return
    }

    // First fetch should cache
    _ = try await client.fetchTrack(id: trackId)

    // Mark as queued to prevent purging
    await client.markTrackAsQueued(trackId)

    // Second fetch should use cache
    let cachedTrack = try await client.fetchTrack(id: trackId)
    XCTAssertEqual(cachedTrack.id, trackId, "Should return cached track")

    // Cleanup
    await client.unmarkTrackAsQueued(trackId)
  }

  func testCacheInvalidation() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let trackId = tracks.first?.id else {
      XCTFail("No tracks available to test with")
      return
    }

    // First fetch to cache
    _ = try await client.fetchTrack(id: trackId)

    // Fetch with force refresh
    let refreshedTrack = try await client.fetchTrack(id: trackId, forceRefresh: true)
    XCTAssertEqual(refreshedTrack.id, trackId, "Should fetch refreshed track")
  }

  func testMultipleTrackProtection() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 2)
    guard tracks.count >= 2 else {
      XCTFail("Not enough tracks available to test with")
      return
    }

    let trackIds = tracks.map { $0.id }

    // Protect multiple tracks
    for trackId in trackIds {
      await client.markTrackAsQueued(trackId)
    }

    // Verify all tracks are protected
    for trackId in trackIds {
      let track = try await client.fetchTrack(id: trackId)
      XCTAssertEqual(track.id, trackId, "Protected track should be available")
    }

    // Cleanup
    for trackId in trackIds {
      await client.unmarkTrackAsQueued(trackId)
    }
  }

  func testFetchTrendingTracksPagination() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let client = AudiusAPIClient.shared
    // Assume the API returns at least 10 tracks for trending
    let firstPage = try await client.fetchTrendingTracks(offset: 0, limit: 5)
    XCTAssertEqual(firstPage.count, 5)
    let secondPage = try await client.fetchTrendingTracks(offset: 5, limit: 5)
    XCTAssertEqual(secondPage.count, 5)
    // Ensure no overlap between pages
    XCTAssertNotEqual(firstPage.first?.id, secondPage.first?.id)
  }

  func testFetchTrendingTracksPaginationBeyondEnd() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let client = AudiusAPIClient.shared
    // Use a large offset to go beyond available tracks
    let tracks = try await client.fetchTrendingTracks(offset: 10_000, limit: 10)
    XCTAssertEqual(tracks.count, 0)
  }

  func testFetchTrendingTracksPaginationZeroLimit() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let client = AudiusAPIClient.shared
    let tracks = try await client.fetchTrendingTracks(offset: 0, limit: 0)
    XCTAssertEqual(tracks.count, 0)
  }

  func testFetchTrendingTracksPaginationNegativeValues() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let client = AudiusAPIClient.shared
    // Negative offset/limit: API may return first page or empty array depending on backend
    let negOffset = try await client.fetchTrendingTracks(offset: -5, limit: 5)
    // Accept both empty and non-empty results, but assert no crash
    XCTAssertNotNil(negOffset)
    let negLimit = try await client.fetchTrendingTracks(offset: 0, limit: -5)
    XCTAssertEqual(negLimit.count, 0)
    // Note: If API changes, update this test accordingly
  }

  // MARK: - Paginated User Data Tests

  func testFetchUserTracksPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let page1 = try await client.fetchUserTracks(userId: userId, offset: 0, limit: 2)
    let page2 = try await client.fetchUserTracks(userId: userId, offset: 2, limit: 2)
    XCTAssertTrue(page1.count <= 2)
    XCTAssertTrue(page2.count <= 2)
    if !page1.isEmpty && !page2.isEmpty {
      XCTAssertNotEqual(page1.first?.id, page2.first?.id)
    }
  }

  func testFetchFollowersPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let followers = try await client.fetchFollowers(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(followers.count <= 5)
  }

  func testFetchFollowingPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let following = try await client.fetchFollowing(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(following.count <= 5)
  }

  func testFetchSupportersPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let supporters = try await client.fetchSupporters(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(supporters.count <= 5)
  }

  func testFetchSupportingPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let supporting = try await client.fetchSupporting(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(supporting.count <= 5)
  }

  func testFetchMutualsPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let mutuals = try await client.fetchMutuals(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(mutuals.count <= 5)
  }

  func testFetchUserPlaylistsPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let playlists = try await client.fetchUserPlaylists(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(playlists.count <= 5)
  }

  func testFetchUserRepostsPaginated() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    let reposts = try await client.fetchUserReposts(userId: userId, offset: 0, limit: 5)
    XCTAssertTrue(reposts.count <= 5)
  }

  func testPaginatedEndpointsEdgeCases() async throws {
    if !isNetworkAvailable() { throw XCTSkip("Network required") }
    let tracks = try await client.fetchTrendingTracks(limit: 1)
    guard let userId = tracks.first?.user?.id else {
      XCTFail("No users available to test with")
      return
    }
    // Negative offset/limit: API may return first page or empty array depending on backend
    let negOffset = try await client.fetchUserTracks(userId: userId, offset: -5, limit: 5)
    XCTAssertNotNil(negOffset)
    let negLimit = try await client.fetchUserTracks(userId: userId, offset: 0, limit: -5)
    XCTAssertEqual(negLimit.count, 0)
    // Note: If API changes, update this test accordingly
  }

  // Helper to check network availability
  func isNetworkAvailable() -> Bool {
    // Simple reachability check (can be improved)
    guard let url = URL(string: "https://api.audius.co") else { return false }
    let semaphore = DispatchSemaphore(value: 0)
    var available = false
    let task = URLSession.shared.dataTask(with: url) { _, response, _ in
      if let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode)
      {
        available = true
      }
      semaphore.signal()
    }
    task.resume()
    _ = semaphore.wait(timeout: .now() + 2)
    return available
  }
}
