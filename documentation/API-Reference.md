# API Reference (v2)

## Operation Coverage

AudiusKit v2 includes wrappers for all operations currently in the source swagger (`157`).

Source of truth:

- `/Users/julianbaker/Downloads/swagger.yaml`

Generated registry:

- `Sources/AudiusKit/Generated/AudiusOperations.generated.swift`

## Coverage by Tag

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

## Operation Method Shape

Every generated endpoint wrapper follows:

```swift
func operationName(
  pathParameters: [String: String] = [:],
  queryItems: [URLQueryItem] = [],
  headers: [String: String] = [:],
  body: JSONValue? = nil
) async throws -> AudiusHTTPResponse<Data>
```

## Auth Requirement Mapping

Auth requirements are tracked per operation in `AudiusOperationSpec.auth`:

- `.none`
- `.basic`
- `.bearer`
- `.basicOrBearer`

Transport auth header resolution is handled by `AudiusCore`.
