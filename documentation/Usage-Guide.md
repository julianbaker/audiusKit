# Usage Guide (v2)

## Typed-First Calls

```swift
let response = try await client.typed.tracks.getTrack(.init(trackId: "42"))
let track = response.data
```

## Request Params

Each operation has a generated `Params` type that handles:

- path interpolation
- query serialization (including array `explode` true/false)
- header serialization
- body encoding to JSON

## Raw Escape Hatch

Use raw APIs for custom behavior or temporary schema drift handling:

```swift
let raw = try await client.tracks.getTrack(pathParameters: ["track_id": "42"])
let json = try raw.decodeJSON()
```

## Auth Flow in Host App

1. Generate OAuth `state`.
2. Build Audius OAuth URL with `client.auth.buildOAuthURL(...)`.
3. Launch `ASWebAuthenticationSession`.
4. Parse callback and validate state.
5. Verify token via `/v1/users/verify_token`.
6. Persist session via `client.auth.createSession(...)`.

## Write Modes

- Default: direct bearer (`Authorization: Bearer <token>`).
- Fallback: `WriteProxyExecutor` for endpoints requiring server-side signing behavior.

```swift
struct MyProxy: WriteProxyExecutor {
  func execute(_ request: AudiusProxyRequest) async throws -> AudiusHTTPResponse<Data> {
    // forward to backend
  }
}
```

Attach using `AudiusClientConfiguration(writeProxy: ...)`.
