# AudiusKit Usage Guide

## Documentation Index
- [Getting Started](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Getting-Started.md)
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [Usage Guide (this file)](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md)
- [Troubleshooting](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Troubleshooting.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md)

---

## Basic Usage

### SwiftUI Integration
```swift
struct MusicListView: View {
    @StateObject private var musicService = MusicService()
    var body: some View {
        NavigationView {
            Group {
                if musicService.isLoading {
                    ProgressView("Loading tracks...")
                } else if let error = musicService.error {
                    ErrorView(error: error) {
                        Task { await musicService.loadTrendingTracks() }
                    }
                } else {
                    List(musicService.tracks) { track in
                        TrackRowView(track: track)
                    }
                }
            }
            .navigationTitle("Trending Music")
        }
        .task {
            await musicService.loadTrendingTracks()
        }
    }
}
```

### Loading Tracks
```swift
class MusicService: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var error: Error?
    private let client = AudiusAPIClient.shared
    func loadTrendingTracks() async {
        await MainActor.run { isLoading = true }
        do {
            let fetchedTracks = try await client.fetchTrendingTracks(limit: 20)
            await MainActor.run {
                self.tracks = fetchedTracks
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.error = error
                self.isLoading = false
            }
        }
    }
}
```

### Displaying Users
```swift
struct UserProfileView: View {
    let userId: String
    @State private var user: Track.User?
    @State private var userTracks: [Track] = []
    @State private var isLoading = false
    @State private var error: Error?
    var body: some View {
        Group {
            if isLoading {
                ProgressView("Loading profile...")
            } else if let error = error {
                ErrorView(error: error) {}
            } else if let user = user {
                ScrollView {
                    UserHeader(user: user)
                    Text("Tracks").font(.title2).padding()
                    LazyVStack {
                        ForEach(userTracks) { track in
                            TrackRow(track: track)
                        }
                    }
                }
            }
        }
        .task { await loadProfile() }
    }
    private func loadProfile() async {
        isLoading = true; defer { isLoading = false }
        do {
            async let userTask = AudiusAPIClient.shared.fetchUserProfile(userId: userId)
            async let tracksTask = AudiusAPIClient.shared.fetchUserTracks(userId: userId)
            (user, userTracks) = try await (userTask, tracksTask)
        } catch { self.error = error }
    }
}
```

### Playback
```swift
class AudioPlayer: ObservableObject {
    @Published var currentTrack: Track?
    @Published var isPlaying = false
    @Published var error: Error?
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    func play(track: Track) async {
        do {
            AudiusAPIClient.shared.markTrackAsQueued(track.id)
            let streamUrl = try await AudiusAPIClient.shared.fetchStreamUrl(trackId: track.id)
            let playerItem = AVPlayerItem(url: streamUrl)
            await MainActor.run {
                self.playerItem = playerItem
                self.player = AVPlayer(playerItem: playerItem)
                self.currentTrack = track
                self.player?.play()
                self.isPlaying = true
            }
        } catch { await MainActor.run { self.error = error } }
    }
    func stop() {
        player?.pause(); isPlaying = false
        if let trackId = currentTrack?.id {
            AudiusAPIClient.shared.unmarkTrackAsQueued(trackId)
        }
        currentTrack = nil
    }
}
```

---

## Advanced Usage

### Debounced Search
```swift
import Combine
class DebouncedSearchManager: ObservableObject {
    @Published var searchText = ""
    @Published var results: [Track] = []
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private let client = AudiusAPIClient.shared
    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                Task { await self?.performSearch(query: searchText) }
            }
            .store(in: &cancellables)
    }
    private func performSearch(query: String) async {
        guard !query.isEmpty else {
            await MainActor.run { self.results = []; self.isLoading = false }
            return
        }
        await MainActor.run { isLoading = true }
        do {
            let searchResults = try await client.searchTracks(query: query)
            await MainActor.run { self.results = searchResults; self.isLoading = false }
        } catch {
            await MainActor.run { self.results = []; self.isLoading = false }
        }
    }
}
```

### Analytics & Dashboards
```swift
struct ArtistAnalytics {
    let user: Track.User
    let tracks: [Track]
    let totalPlays: Int
    let averagePlayCount: Double
    let topGenres: [String]
    let followerToTrackRatio: Double
}
class ArtistAnalyticsService {
    private let client = AudiusAPIClient.shared
    func getArtistAnalytics(userId: String) async throws -> ArtistAnalytics {
        async let userProfile = client.fetchUserProfile(userId: userId)
        async let userTracks = client.fetchUserTracks(userId: userId)
        async let followerCount = client.fetchFollowerCount(userId: userId)
        let (user, tracks, followers) = try await (userProfile, userTracks, followerCount)
        let totalPlays = tracks.compactMap { $0.playCount }.reduce(0, +)
        let averagePlayCount = Double(totalPlays) / Double(max(tracks.count, 1))
        let genres = tracks.compactMap { $0.genre }
        let topGenres = Dictionary(grouping: genres, by: { $0 })
            .sorted { $0.value.count > $1.value.count }
            .prefix(5)
            .map { $0.key }
        let followerToTrackRatio = Double(followers) / Double(max(tracks.count, 1))
        return ArtistAnalytics(
            user: user,
            tracks: tracks,
            totalPlays: totalPlays,
            averagePlayCount: averagePlayCount,
            topGenres: topGenres,
            followerToTrackRatio: followerToTrackRatio
        )
    }
}
```

### Custom Cache Strategies
```swift
class CustomCacheStrategy {
    private let client = AudiusAPIClient.shared
    private var playQueue: [String] = []
    func addToQueue(_ trackId: String) {
        playQueue.append(trackId)
        client.markTrackAsQueued(trackId)
    }
    func removeFromQueue(_ trackId: String) {
        playQueue.removeAll { $0 == trackId }
        client.unmarkTrackAsQueued(trackId)
    }
    func clearQueue() {
        for trackId in playQueue {
            client.unmarkTrackAsQueued(trackId)
        }
        playQueue.removeAll()
    }
}
```

---

## UI Patterns & Error Handling

### Error Handling in UI
```swift
struct ErrorView: View {
    let error: Error
    var retryAction: (() -> Void)?
    var body: some View {
        VStack(spacing: 16) {
            if let apiError = error as? AudiusAPIError {
                switch apiError {
                case .networkError:
                    VStack {
                        Image(systemName: "wifi.exclamationmark").font(.largeTitle)
                        Text("No internet connection").font(.headline)
                        Text("Please check your connection and try again")
                    }
                case .apiError(let message):
                    VStack {
                        Image(systemName: "exclamationmark.triangle").font(.largeTitle)
                        Text("API Error").font(.headline)
                        Text(message)
                    }
                case .decodingError:
                    Text("Failed to decode response")
                case .invalidResponse:
                    Text("Invalid server response")
                case .invalidURL:
                    Text("Invalid URL")
                case .noHostsAvailable:
                    Text("No available hosts")
                case .hostUnavailable(let host):
                    Text("Host unavailable: \(host)")
                }
            } else {
                Text("An unexpected error occurred")
            }
            if let retryAction = retryAction {
                Button("Retry", action: retryAction)
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}
```

---

## Real-World Workflows
- **Music Discovery Dashboards**: Combine trending, genre, and artist data for a rich UI.
- **Artist Analysis**: Use analytics service to show top genres, play counts, and ratios.
- **Playlist Building**: Use search and trending APIs to build and manage playlists.
- **Social Sharing**: Share track lists or analytics with friends or on social media.

---

## Tips & Best Practices
- Use async/await for all API calls for best performance.
- Use `Task.detached(priority: .userInitiated)` for initialization to avoid blocking the main thread.
- Always handle errors in your UI and provide retry mechanisms.
- Use cache management methods to optimize memory and performance.
- Use debounced search for responsive UIs.
- Prefetch likely next actions for a smoother user experience.
- Test on all supported platforms and devices.

---

## Infinite Scroll with Pagination

To support infinite scroll, use the paginated fetchTrendingTracks method:

```swift
class InfiniteScrollMusicService: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var error: Error?
    private var offset = 0
    private let limit = 20
    private let client = AudiusAPIClient.shared
    func loadMoreTrendingTracks() async {
        guard !isLoading else { return }
        isLoading = true
        do {
            let newTracks = try await client.fetchTrendingTracks(offset: offset, limit: limit)
            await MainActor.run {
                self.tracks.append(contentsOf: newTracks)
                self.offset += newTracks.count
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.error = error
                self.isLoading = false
            }
        }
    }
}
```

Trigger `loadMoreTrendingTracks()` as the user scrolls to the bottom of your list.

---

## Testing & Network Requirements

- Most tests in AudiusKitTests require a live network connection and access to the Audius API.
- Tests in AudiusKitIntentsTests using MockAudiusAPIClient can be run offline and are suitable for verifying logic and pagination without network access.
- For CI or local development without network, focus on mock-based tests.

---

## See Also
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [Troubleshooting](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Troubleshooting.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md)

---

## Paginated User Data

### Fetching a User's Tracks (Paginated)
```