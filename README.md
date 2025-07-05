# AudiusKit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A modern Swift package for integrating Audius music content into your iOS, macOS, tvOS, or watchOS app. 

**AudiusKit is a 3rd party, community-maintained library.** It provides a type-safe, async/await-based read-only API for accessing and streaming public Audius tracks, user profiles, and playlists.

---

## Features
- Fetch trending tracks, user profiles, playlists, and more
- Stream music directly from Audius
- Async/await API for modern Swift concurrency
- Built-in pagination and infinite scroll support
- Robust error handling and caching
- Designed for performance and thread safety
- Supports iOS, macOS, tvOS, and watchOS
- **Search for users and tracks by name or handle**

---

## Why AudiusKit?
AudiusKit makes it easy to build music discovery, playback, and analytics features into your Apple platform apps using the open Audius API. Whether you're building a music player, social app, or analytics dashboard, AudiusKit gives you the tools to get started quickly.

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
3. Select the latest version and add `AudiusKit` to your target.

Or add to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/julianbaker/AudiusKit.git", from: "1.0.0")
]
```

---

## Quick Start

See [Getting Started](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Getting-Started.md) for a full guide.

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
                // (Optional) Set your app's name for API attribution. Fallback is 'AudiusKit'.
                AudiusAPIClient.configure(appName: "MyCoolApp")
                try await AudiusAPIClient.initialize()
                await MainActor.run { self?.isInitialized = true }
            } catch {
                await MainActor.run { self?.initializationError = error }
            }
        }
    }
}
```

> **Note:** If you do not call `AudiusAPIClient.configure(appName:)`, the default app name sent to the API will be `"AudiusKit"`.

---

## Documentation
- [Getting Started](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Getting-Started.md)
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md)
- [Troubleshooting](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Troubleshooting.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md)


---

## License
MIT License — see [LICENSE](LICENSE) for details. 
