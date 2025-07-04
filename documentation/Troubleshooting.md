# AudiusKit Troubleshooting Guide

## Documentation Index
- [Getting Started](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Getting-Started.md)
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
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
- Check for common error messages:
  - "No available hosts"
  - "Failed to decode response"
  - "Network connection required"
- If you encounter persistent issues, update AudiusKit to the latest version and consult the [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md) or [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md).

---

## See Also
- [API Reference](https://github.com/julianbaker/AudiusKit/blob/main/documentation/API-Reference.md)
- [Usage Guide](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Usage-Guide.md)
- [Architecture](https://github.com/julianbaker/AudiusKit/blob/main/documentation/Architecture.md) 