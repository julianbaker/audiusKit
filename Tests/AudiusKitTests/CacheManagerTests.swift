import XCTest

@testable import AudiusKit

final class CacheManagerTests: XCTestCase {
  var cacheManager: CacheManager!

  override func setUp() async throws {
    try await super.setUp()
    cacheManager = CacheManager.shared
    await CacheManager.initialize(cacheTimeout: 1)  // 1 second timeout for testing
  }

  override func tearDown() async throws {
    await cacheManager.clearAllCaches()
    cacheManager = nil
    try await super.tearDown()
  }

  // MARK: - Initialization Tests

  func testInitialization() async throws {
    XCTAssertNotNil(cacheManager, "Cache manager should be initialized")
  }

  func testSingletonPattern() async throws {
    let manager1 = CacheManager.shared
    let manager2 = CacheManager.shared
    XCTAssertTrue(manager1 === manager2, "Should return same instance")
  }

  // MARK: - Metadata Caching Tests

  func testMetadataCaching() async throws {
    let testData = Track(
      id: "test_id",
      title: "Test Track",
      description: "Test Description"
    )

    let key = "test_metadata"
    await cacheManager.cacheMetadata(testData, forKey: key)

    let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: key)
    XCTAssertNotNil(cachedData, "Should retrieve cached metadata")
    XCTAssertEqual(cachedData?.id, testData.id, "Cached data should match original")
  }

  func testMetadataCachingWithDifferentTypes() async throws {
    // Test caching different types
    let track = Track(id: "track_id", title: "Track")
    let user = Track.User(
      id: "user_id",
      handle: "test_user",
      name: "Test User",
      profilePicture: nil,
      coverPhoto: nil,
      bio: nil,
      twitterHandle: nil,
      instagramHandle: nil,
      website: nil,
      followerCount: nil,
      followingCount: nil,
      trackCount: nil
    )

    await cacheManager.cacheMetadata(track, forKey: "track")
    await cacheManager.cacheMetadata(user, forKey: "user")

    let cachedTrack: Track? = await cacheManager.getCachedMetadata(forKey: "track")
    let cachedUser: Track.User? = await cacheManager.getCachedMetadata(forKey: "user")

    XCTAssertNotNil(cachedTrack, "Should cache Track type")
    XCTAssertNotNil(cachedUser, "Should cache User type")
  }

  func testMetadataExpiration() async throws {
    let testData = Track(
      id: "test_id",
      title: "Test Track"
    )

    let key = "test_metadata"
    await cacheManager.cacheMetadata(testData, forKey: key)

    // Simulate cache expiration by waiting slightly longer than the timeout
    try await Task.sleep(nanoseconds: 1_100_000_000)  // 1.1 seconds to ensure we exceed the timeout

    // Explicitly clear expired cache
    await cacheManager.clearExpiredCache()

    // Try multiple times to account for any timing issues
    var cachedData: Track?
    for _ in 0..<3 {
      cachedData = await cacheManager.getCachedMetadata(forKey: key)
      if cachedData == nil {
        break
      }
      try await Task.sleep(nanoseconds: 100_000_000)  // 0.1 second delay between attempts
    }

    XCTAssertNil(cachedData, "Expired metadata should be removed")
  }

  func testMetadataOverwrite() async throws {
    let initialData = Track(id: "test_id", title: "Initial Title")
    let updatedData = Track(id: "test_id", title: "Updated Title")

    let key = "test_metadata"
    await cacheManager.cacheMetadata(initialData, forKey: key)
    await cacheManager.cacheMetadata(updatedData, forKey: key)

    let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: key)
    XCTAssertEqual(cachedData?.title, "Updated Title", "Should overwrite existing cache")
  }

  // MARK: - Track Protection Tests

  func testTrackProtection() async throws {
    let testData = Track(
      id: "protected_track",
      title: "Protected Track"
    )

    let key = "track_protected_track"
    await cacheManager.cacheMetadata(testData, forKey: key)

    // Protect the track
    await cacheManager.protectTrack("protected_track")

    // Try to clear cache
    await cacheManager.clearExpiredCache()

    let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: key)
    XCTAssertNotNil(cachedData, "Protected track should not be purged")

    // Cleanup
    await cacheManager.unprotectTrack("protected_track")
  }

  func testTrackUnprotection() async throws {
    let testData = Track(
      id: "unprotected_track",
      title: "Unprotected Track"
    )

    let key = "track_unprotected_track"
    await cacheManager.cacheMetadata(testData, forKey: key)

    // Protect and then unprotect
    await cacheManager.protectTrack("unprotected_track")
    await cacheManager.unprotectTrack("unprotected_track")

    // Try to clear cache
    await cacheManager.clearExpiredCache()

    let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: key)
    XCTAssertNil(cachedData, "Unprotected track should be purged")
  }

  func testMultipleTrackProtection() async throws {
    let trackIds = ["track1", "track2", "track3"]

    // Cache and protect multiple tracks
    for trackId in trackIds {
      let testData = Track(id: trackId, title: "Track \(trackId)")
      await cacheManager.cacheMetadata(testData, forKey: "track_\(trackId)")
      await cacheManager.protectTrack(trackId)
    }

    // Verify all tracks are protected
    for trackId in trackIds {
      let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: "track_\(trackId)")
      XCTAssertNotNil(cachedData, "Protected track should not be purged: \(trackId)")
    }

    // Cleanup
    for trackId in trackIds {
      await cacheManager.unprotectTrack(trackId)
    }
  }

  // MARK: - Cache Management Tests

  func testClearAllCaches() async throws {
    // Add some test data
    let testData = Track(
      id: "test_id",
      title: "Test Track"
    )

    let key = "test_metadata"
    await cacheManager.cacheMetadata(testData, forKey: key)

    // Clear all caches
    await cacheManager.clearAllCaches()

    let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: key)
    XCTAssertNil(cachedData, "All caches should be cleared")
  }

  func testCacheSizeLimit() async throws {
    // Add more items than the cache limit
    let maxEntries = 100
    for i in 0..<(maxEntries + 10) {
      let testData = Track(
        id: "track_\(i)",
        title: "Track \(i)"
      )
      await cacheManager.cacheMetadata(testData, forKey: "track_\(i)")
    }

    // The oldest entries should be purged
    let oldestEntry: Track? = await cacheManager.getCachedMetadata(forKey: "track_0")
    XCTAssertNil(oldestEntry, "Oldest entries should be purged when over limit")

    // Newer entries should still be available
    let newerEntry: Track? = await cacheManager.getCachedMetadata(forKey: "track_\(maxEntries + 5)")
    XCTAssertNotNil(newerEntry, "Newer entries should still be cached")
  }

  func testCacheRemoval() async throws {
    let testData = Track(id: "test_id", title: "Test Track")
    let key = "test_metadata"

    await cacheManager.cacheMetadata(testData, forKey: key)
    await cacheManager.removeMetadata(forKey: key)

    let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: key)
    XCTAssertNil(cachedData, "Removed metadata should not be available")
  }

  func testConcurrentCacheAccess() async throws {
    // Test concurrent access to cache
    let trackIds = (0..<10).map { "track_\($0)" }

    // Concurrently add items to cache
    try await withThrowingTaskGroup(of: Void.self) { group in
      for trackId in trackIds {
        group.addTask {
          let testData = Track(id: trackId, title: "Track \(trackId)")
          await self.cacheManager.cacheMetadata(testData, forKey: "track_\(trackId)")
        }
      }
      try await group.waitForAll()
    }

    // Verify all items were cached
    for trackId in trackIds {
      let cachedData: Track? = await cacheManager.getCachedMetadata(forKey: "track_\(trackId)")
      XCTAssertNotNil(cachedData, "Should handle concurrent cache access: \(trackId)")
    }
  }
}
