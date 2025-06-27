# AudiusKitIntents App Intents Source Archive

---

## Sources/AudiusKitIntents/AudiusKitIntents.swift
```swift
import AppIntents
import AudiusKit
import Foundation

/// AudiusKit AppIntents Integration
///
/// This module provides complete AppIntents integration for AudiusKit, enabling:
/// - System-wide voice commands through Siri
/// - Shortcuts app integration
/// - Spotlight search integration
/// - Apple Watch shortcuts
/// - Widget configuration support
///
/// ## Quick Start
/// 1. Add AudiusKitIntents to your app dependencies
/// 2. Register the AppIntents package in your app
/// 3. Configure dependency injection for AudiusAPIClient
/// 4. Use provided shortcuts or create custom ones
///
/// ## Voice Commands Available
/// - "Get trending electronic music with MyApp"
/// - "Get trending tracks this week with MyApp"
/// - "Show me trending hip-hop music with MyApp"
///
/// For complete integration guide, see README-AppIntents.md
public enum AudiusKitIntents {
  /// Version of the AppIntents integration
  public static let version = "1.0.0"

  /// Supported iOS version
  public static let minimumIOSVersion = "16.0"

  /// Whether advanced features are available
  public static let supportsAdvancedQueries = true

  /// Available voice commands count
  public static let availableVoiceCommands = 3
}
```

---

## Sources/AudiusKitIntents/AudiusKitIntentsPackage.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Queries/TrackQuery.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Queries/UserQuery.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Intents/GetTrendingTracksIntent.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Entities/TrackEntity.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Entities/UserEntity.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Entities/MusicGenreEntity.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Entities/TimeRangeEntity.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Errors/AudiusIntentError.swift
```swift
// ... existing code ...
```

---

## Sources/AudiusKitIntents/Dependencies/AudiusAPIClientProtocol.swift
```swift
// ... existing code ...
```

</rewritten_file> 