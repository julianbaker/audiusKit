# API Reference (v2)

## Coverage

- Source swagger: `swagger.yaml` (or your supplied OpenAPI path)
- Raw operation registry: `Sources/AudiusKit/Generated/AudiusOperations.generated.swift`
- Typed operation registry: `Sources/AudiusKit/Generated/AudiusTypedAPIs.generated.swift`
- Coverage target: `157/157` operations

## Primary Entry Points

- `AudiusClient(configuration:)`
- `client.typed.<tag>.<operation>(Params)` (typed-first)
- `client.<tag>.<operation>(pathParameters/queryItems/headers/body)` (raw)

## Typed Method Shape

```swift
func getTrack(_ params: GetTrackParams) async throws -> AudiusEnvelope<Track>
```

## Raw Method Shape

```swift
func getTrack(
  pathParameters: [String: String] = [:],
  queryItems: [URLQueryItem] = [],
  headers: [String: String] = [:],
  body: JSONValue? = nil
) async throws -> AudiusHTTPResponse<Data>
```

## Typed Envelopes

- `AudiusEnvelope<T>`
- `AudiusListEnvelope<T>`
- `AudiusOptionalEnvelope<T>`
- `AudiusWriteEnvelope<T>`

## Auth Requirement Mapping

Auth requirements are declared per operation and mirrored in both registries:

- `.none`
- `.basic`
- `.bearer`
- `.basicOrBearer`

## Typed Coverage by Tag

- `users`: 56
- `tracks`: 40
- `playlists`: 15
- `coins`: 13
- `comments`: 11
- `developerApps`: 6
- `events`: 4
- `prizes`: 3
- `challenges`: 2
- `rewards`: 2
- `wallet`: 1
- `dashboardWalletUsers`: 1
- `resolve`: 1
- `explore`: 1
- `tips`: 1
