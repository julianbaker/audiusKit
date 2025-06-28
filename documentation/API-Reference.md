# AudiusKit API Reference

## Documentation Index
- [Getting Started](Getting-Started.md)
- [API Reference (this file)](API-Reference.md)
- [Usage Guide](Usage-Guide.md)
- [Troubleshooting](Troubleshooting.md)
- [Architecture](Architecture.md)

---

## Overview
AudiusKit is a Swift package for integrating Audius music content into your iOS, macOS, tvOS, or watchOS app. It provides a type-safe, async/await-based API for accessing tracks, user profiles, and streaming music from the Audius platform. The library is designed for performance, thread safety, and ease of use.

---

## Initialization & Setup

```swift
// Initialize the client (call once at app startup)
await AudiusAPIClient.initialize()

// Access the shared instance
let client = AudiusAPIClient.shared
```

---

## AudiusAPIClient Methods

### Track Operations

```swift
// Fetch trending tracks (paginated)
func fetchTrendingTracks(
    genre: String? = nil,
    timeRange: TimeRange = .week,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
) async throws -> [Track]

// Fetch a specific track
func fetchTrack(id: String, forceRefresh: Bool = false) async throws -> Track

// Fetch multiple tracks by IDs
func fetchTracks(ids: [String], forceRefresh: Bool = false) async throws -> [Track]

// Fetch multiple tracks by permalinks
func fetchTracksByPermalinks(permalinks: [String], forceRefresh: Bool = false) async throws -> [Track]

// Search for tracks
func searchTracks(query: String, limit: Int = 20) async throws -> [Track]

// Get track stream URL
func fetchStreamUrl(trackId: String) async throws -> String
```

### User Operations

```swift
// Fetch user profile
func fetchUserProfile(userId: String, forceRefresh: Bool = false) async throws -> Track.User

// Fetch user's tracks (paginated)
func fetchUserTracks(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track]

// Search for users
func searchUsers(query: String, limit: Int = 20) async throws -> [Track.User]

// Fetch user's tracks (legacy, all at once)
func fetchUserTracks(userId: String, forceRefresh: Bool = false) async throws -> [Track] // Legacy

// Fetch followers (paginated)
func fetchFollowers(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track.User]

// Fetch following (paginated)
func fetchFollowing(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track.User]

// Fetch supporters (paginated)
func fetchSupporters(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track.User]

// Fetch supporting (paginated)
func fetchSupporting(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track.User]

// Fetch mutual followers (paginated)
func fetchMutuals(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track.User]

// Fetch playlists by user (paginated)
func fetchUserPlaylists(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track]

// Fetch reposts by user (paginated)
func fetchUserReposts(userId: String, offset: Int = 0, limit: Int = 20, forceRefresh: Bool = false) async throws -> [Track]

// Get follower count (quick stat)
func fetchFollowerCount(userId: String) async throws -> Int

// Get following count (quick stat)
func fetchFollowingCount(userId: String) async throws -> Int
```

### Cache Management

```swift
// Protect track from cache purging
func markTrackAsQueued(_ trackId: String)

// Allow track to be purged
func unmarkTrackAsQueued(_ trackId: String)
```

### Playlist Operations

```swift
// Fetch multiple playlists by IDs
func fetchPlaylists(ids: [String], forceRefresh: Bool = false) async throws -> [Playlist]

// Fetch a playlist by handle and slug (permalink)
func fetchPlaylistByPermalink(handle: String, slug: String, forceRefresh: Bool = false) async throws -> Playlist?
```

---

## Data Models

### Track
```swift
public struct Track: Codable, Identifiable {
    public let id: String
    public let title: String
    public let description: String?
    public let genre: String?
    public let mood: String?
    public let tags: [String]?
    public let duration: Int?
    public let playCount: Int?
    public let favoriteCount: Int?
    public let repostCount: Int?
    public let isStreamable: Bool?
    public let isDownloadable: Bool?
    public let isPublic: Bool?
    public let createdAt: String?
    public let updatedAt: String?
    public let artwork: Artwork?
    public let user: User?
    public let streamUrl: String?
}
```

### Track.User
```swift
public struct User: Codable, Identifiable {
    public let id: String
    public let handle: String
    public let name: String?
    public let profilePicture: ProfilePicture?
    public let coverPhoto: CoverPhoto?
    public let bio: String?
    public let twitterHandle: String?
    public let instagramHandle: String?
    public let website: String?
    public let followerCount: Int?
    public let followingCount: Int?
    public let trackCount: Int?
}
```

### Artwork
```swift
public struct Artwork: Codable {
    public let url: String?
    public let width: Int?
    public let height: Int?
    public let small: String?
    public let medium: String?
    public let large: String?
    public var gatewayURL: URL? // Computed property for best available URL
}
```

### ProfilePicture
```swift
public struct ProfilePicture: Codable {
    public let small: String?
    public let medium: String?
    public let large: String?
    public var gatewayURL: URL? // Computed property for best available URL
}
```

### CoverPhoto
```swift
public struct CoverPhoto: Codable {
    public let small: String?
    public let large: String?
    public var gatewayURL: URL? // Computed property for best available URL
}
```

---

## Enums

### TimeRange
```swift
public enum TimeRange: String, Codable {
    case week = "week"
    case month = "month"
    case year = "year"
    case allTime = "allTime"
}
```

---

## Error Types

### AudiusAPIError
```swift
public enum AudiusAPIError: LocalizedError {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case invalidResponse
    case apiError(String)
    case noHostsAvailable
    case hostUnavailable(String)
}
```

---

## Extensions

### Track.fetchPlayableStreamURL
Convenience method on Track for getting a playable stream URL.
```swift
extension Track {
    public func fetchPlayableStreamURL(
        using client: AudiusAPIClient = .shared
    ) async throws -> URL
}
```

**Example:**
```swift
let streamUrl = try await track.fetchPlayableStreamURL()
```

---

## Common Genres

Popular genre strings for filtering:
- "Electronic"
- "Hip-Hop"
- "Alternative"
- "Pop"
- "Ambient"
- "Dancehall"
- "Deep House"
- "Disco"
- "Dubstep"
- "Folk"
- "Funk"
- "House"
- "Jazz"
- "Latin"
- "Moombahton"
- "Piano"
- "R&B"
- "Reggae"
- "Rock"
- "Techno"
- "Trap"

---

## Usage Patterns

### Concurrent Data Loading
```swift
// Load multiple data sources concurrently
async let trending = client.fetchTrendingTracks()
async let electronic = client.fetchTrendingTracks(genre: "Electronic")
async let userProfile = client.fetchUserProfile(userId: "user_id")
let (trendingTracks, electronicTracks, user) = try await (trending, electronic, userProfile)
```

### Error Handling Pattern
```swift
do {
    let tracks = try await client.fetchTrendingTracks()
    // Handle success
} catch let error as AudiusAPIError {
    switch error {
    case .networkError:
        // Handle network issues
    case .noHostsAvailable:
        // Handle service unavailability
    default:
        // Handle other API errors
    }
} catch {
    // Handle unexpected errors
}
```

### Cache Management Pattern
```swift
// For media players - protect currently playing tracks
func startPlaying(_ track: Track) {
    client.markTrackAsQueued(track.id)
    // Start playback...
}

func stopPlaying(_ track: Track) {
    client.unmarkTrackAsQueued(track.id)
    // Stop playback...
}
```

---

## See Also
- [Usage Guide](Usage-Guide.md)
- [Troubleshooting](Troubleshooting.md)
- [Architecture](Architecture.md)

---

## ⚠️ Network Requirements

Most methods in AudiusAPIClient require an active internet connection to communicate with the Audius API. If the network is unavailable, these methods will throw a networkError. For offline/local development, use the mock implementations provided in AudiusAPIClientProtocol.

#### searchUsers
Search for users by display name, handle, or other metadata.

```swift
func searchUsers(query: String, limit: Int = 20) async throws -> [Track.User]
```
- `query`: The search string (name, handle, etc.)
- `limit`: Maximum number of results to return (default: 20)
- **Returns:** An array of `Track.User` objects matching the query.