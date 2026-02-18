# Usage Guide (v2)

## Auth Flow in Host App

1. Generate OAuth `state`.
2. Build Audius OAuth URL via `AudiusOAuthURLBuilder`.
3. Open URL using `ASWebAuthenticationSession`.
4. Parse callback token and validate `state`.
5. Verify token via `/v1/users/verify_token`.
6. Persist `AudiusSession` in keychain.

## Performing Operations

All generated operations are available on tag clients and return `AudiusHTTPResponse<Data>`.

```swift
let response = try await client.playlists.getPlaylist(pathParameters: ["playlist_id": "42"])
let model = try response.decodeJSON()
```

## Headers and Query

- `app_name` is automatically appended on every request.
- Custom headers and query items can be passed per operation.
- Path parameters are required for templated endpoints.

## Proxy Fallback

To support operations that require server-side signing behavior, inject a proxy executor:

```swift
struct MyProxy: WriteProxyExecutor {
  func execute(_ request: AudiusProxyRequest) async throws -> AudiusHTTPResponse<Data> {
    // Forward to your trusted backend proxy
  }
}
```

Attach via `AudiusClientConfiguration(writeProxy: MyProxy())`.
