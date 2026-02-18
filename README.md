# AudiusKit v2

AudiusKit v2 is a typed Swift SDK for the Audius/Open Audio Protocol API, generated from:

`swagger.yaml` (or a path you provide at generation time)

## Highlights

- Full operation coverage (`157`) with typed wrappers.
- Typed domain models (`Track`, `User`, `Playlist`, `Comment`, `Coin`, etc.).
- Generic response envelopes (`AudiusEnvelope`, `AudiusListEnvelope`, `AudiusOptionalEnvelope`).
- Raw API escape hatch preserved.
- Bearer-first write execution with optional proxy fallback.
- OAuth/session helpers for iOS system auth.

## Quick Start (Typed)

```swift
import AudiusKit

let client = AudiusClient(
  configuration: AudiusClientConfiguration(
    appName: "MyiOSApp",
    auth: AudiusAuthConfiguration(mode: .sessionBearer),
    sessionStore: KeychainSessionStore()
  )
)

let user = try await client.typed.users.getUser(.init(id: "123"))
print(user.data.name)
```

## Raw Escape Hatch

```swift
let raw = try await client.users.getUser(pathParameters: ["id": "123"])
let json = try raw.decodeJSON()
```

## iOS Auth

AudiusKit does not render login UI. Host apps launch Audius auth via `ASWebAuthenticationSession`, parse callback state/token with `client.auth`, then materialize a verified session using `client.auth.createSession(...)`.

## Optional Legacy Shim

`AudiusAPIClient.shared` exists as a deprecated migration bridge.

```swift
let shared = AudiusAPIClient.shared
let client = shared.client
```

Use `AudiusClient(configuration:)` for all new code.

## Codegen

Regenerate typed surface:

```bash
ruby Scripts/generate_typed_surface.rb ./swagger.yaml
```

Regenerate operation manifest fixture:

```bash
ruby Scripts/generate_operation_manifest.rb ./swagger.yaml Tests/AudiusKitTests/Fixtures/operation_manifest.json
```

Run codegen parity check:

```bash
Scripts/check_codegen.sh ./swagger.yaml
```

## Documentation

- `documentation/Getting-Started.md`
- `documentation/Architecture.md`
- `documentation/Usage-Guide.md`
- `documentation/API-Reference.md`
- `documentation/Troubleshooting.md`
- `documentation/Migration-v1-to-v2.md`
