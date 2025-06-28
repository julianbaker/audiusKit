# Getting Started with AudiusKit

## Documentation Index
- [Getting Started (this file)](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Getting-Started.md)
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md)
- [Troubleshooting](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Troubleshooting.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md)

---

## What is AudiusKit?
AudiusKit is a Swift package for integrating Audius music content into your iOS, macOS, tvOS, or watchOS app. It provides a type-safe, async/await-based API for accessing tracks, user profiles, and streaming music from the Audius platform.

---

## Supported Platforms & Requirements
- **iOS:** 16.0+
- **macOS:** 13.0+
- **tvOS:** 16.0+
- **watchOS:** 9.0+
- **Swift:** 5.9+
- **Xcode:** 15.0+

---

## Installation

### Swift Package Manager (Recommended)
1. In Xcode, go to **File > Add Packages...**
2. Enter the repository URL:
   ```
   https://github.com/julianbaker/AudiusKit.git
   ```
3. Select the latest version and add the `AudiusKit` (and `AudiusKitIntents` if needed) products to your target.

### Package.swift Example
```swift
dependencies: [
    .package(url: "https://github.com/julianbaker/AudiusKit.git", from: "1.0.0")
]
```

---

## Minimal Initialization Example

Initialize AudiusKit early in your app's lifecycle (e.g., in your App struct or AppDelegate):

```swift
import AudiusKit

@main
struct MyApp: App {
    @StateObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}

class AppState: ObservableObject {
    @Published var isInitialized = false
    @Published var initializationError: Error?
    init() {
        Task.detached(priority: .userInitiated) { [weak self] in
            do {
                try await AudiusAPIClient.initialize()
                await MainActor.run { self?.isInitialized = true }
            } catch {
                await MainActor.run { self?.initializationError = error }
            }
        }
    }
}
```

---

## First API Call: Fetch Trending Tracks

```swift
import AudiusKit

func loadTrendingTracks() async {
    do {
        let tracks = try await AudiusAPIClient.shared.fetchTrendingTracks()
        print("Loaded \(tracks.count) trending tracks")
    } catch {
        print("Error loading tracks: \(error)")
    }
}
```

---

## Pagination Example: Infinite Scroll

To implement infinite scroll, use the paginated fetchTrendingTracks method:

```swift
import AudiusKit

@MainActor
class PaginatedTracksViewModel: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var error: Error?
    private var offset = 0
    private let limit = 20
    private let client = AudiusAPIClient.shared
    func loadMoreTracks() async {
        guard !isLoading else { return }
        isLoading = true
        do {
            let newTracks = try await client.fetchTrendingTracks(offset: offset, limit: limit)
            tracks.append(contentsOf: newTracks)
            offset += newTracks.count
            isLoading = false
        } catch {
            self.error = error
            isLoading = false
        }
    }
}
```

Use this in your SwiftUI view to load more tracks as the user scrolls.

---

## Next Steps
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md): Full API details and models
- [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md): Real-world usage and UI patterns
- [Troubleshooting](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Troubleshooting.md): Common issues and solutions
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md): Internal design and extensibility 