# AudiusKit Troubleshooting Guide

## Documentation Index
- [Getting Started](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Getting-Started.md)
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [AppIntents Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/AppIntents.md)
- [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md)
- [Troubleshooting (this file)](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Troubleshooting.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md)

---

## Core API Issues

### Network Errors
- **Symptom:** Requests fail, time out, or return no data.
- **Solution:**
  - Check your internet connection.
  - Ensure the Audius API is reachable.
  - Retry with a different network.
  - Use `forceRefresh: true` if cached data is stale.

### Decoding Errors
- **Symptom:** "Failed to decode response" or similar error.
- **Solution:**
  - The Audius API may have changed; update AudiusKit to the latest version.
  - Report the issue with the failing endpoint and payload.

### Host/Service Unavailable
- **Symptom:** "No available hosts" or "Host unavailable" errors.
- **Solution:**
  - Wait and retry; Audius hosts may be temporarily down.
  - Check for service status updates from Audius.

### Cache Issues
- **Symptom:** Data appears outdated or missing.
- **Solution:**
  - Use `forceRefresh: true` to bypass cache.
  - Use cache management methods to clear or protect cache entries.

### Error Handling
- **Symptom:** Unhandled errors in UI.
- **Solution:**
  - Always handle errors in your UI and provide retry options.
  - Use the provided `ErrorView` pattern for user-friendly error messages.

---

## AppIntents Issues

### Intents Not Appearing in Shortcuts
- **Symptom:** AudiusKit intents do not show up in the Shortcuts app.
- **Solution:**
  - Ensure `AudiusKitIntentsPackage` is registered in your app's `AppIntentsPackage.includedPackages`.
  - Rebuild and reinstall your app.
  - Wait a few minutes for system indexing.
  - Check your deployment target (iOS 16+, macOS 13+).

### Voice Commands Not Working
- **Symptom:** Siri does not recognize or execute AudiusKit voice commands.
- **Solution:**
  - Grant "Siri & Search" permission in device settings.
  - Use the exact app name in your command.
  - Try alternative supported phrases.
  - Test on a physical device (not just Simulator).

### Shortcuts Not Syncing to Apple Watch
- **Symptom:** Shortcuts work on iPhone but not on Watch.
- **Solution:**
  - Ensure Shortcuts app is installed and synced on Watch.
  - Wait for automatic sync or force sync by opening Shortcuts on Watch.

### Parameter/Genre Issues
- **Symptom:** Voice command or shortcut fails for a specific genre or parameter.
- **Solution:**
  - Use only supported genre names (see API Reference).
  - Try a different time range or limit.

### Testing Issues
- **Symptom:** Unit tests fail or cannot mock API.
- **Solution:**
  - Use the provided mock API client for tests.
  - Register dependencies using `AppDependencyManager`.
  - Ensure test environment matches platform requirements.

---

## Platform Requirements
- **iOS:** 16.0+
- **macOS:** 13.0+
- **tvOS:** 16.0+
- **watchOS:** 9.0+
- **Swift:** 5.9+
- **Xcode:** 15.0+

---

## Debugging Tips
- Use logs and breakpoints to inspect API responses and errors.
- Use the provided validation methods:
  ```swift
  try AudiusKitIntentsPackage.validateConfiguration()
  let status = AudiusKitIntentsPackage.getIntegrationStatus()
  ```
- Check for common error messages:
  - "No available hosts"
  - "Failed to decode response"
  - "Intents not appearing"
  - "Network connection required"
- If you encounter persistent issues, update AudiusKit to the latest version and consult the [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md) or [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md).

---

## See Also
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [AppIntents Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/AppIntents.md)
- [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md) 