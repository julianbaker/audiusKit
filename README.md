# AudiusKit v2

AudiusKit v2 is a clean-break Swift package for the Audius/Open Audio Protocol API, aligned to the OpenAPI source of truth at:

`/Users/julianbaker/Downloads/swagger.yaml`

## What v2 Includes

- 157 operation wrappers generated from the source swagger.
- Tag-scoped API clients (`users`, `tracks`, `playlists`, `comments`, etc.).
- Bearer-first write execution with optional proxy fallback interface.
- iOS-ready OAuth helpers for Audius hosted login UI.
- Session verification (`/v1/users/verify_token`) and session store abstractions.

## Installation

```swift
.package(url: "https://github.com/your-org/AudiusKit.git", from: "2.0.0")
```

## Quick Start

```swift
import AudiusKit

let client = AudiusClient(
  configuration: AudiusClientConfiguration(
    appName: "MyiOSApp",
    auth: AudiusAuthConfiguration(mode: .sessionBearer),
    sessionStore: KeychainSessionStore()
  )
)

let response = try await client.users.getUser(pathParameters: ["id": "123"])
let payload = try response.decodeJSON()
```

## iOS Authentication (System Auth)

AudiusKit does not render login UI. The host app launches Audius hosted auth in `ASWebAuthenticationSession`.

```swift
import AuthenticationServices
import AudiusKit

let state = client.auth.generateState()
let oauthURL = try client.auth.buildOAuthURL(
  request: AudiusOAuthRequest(
    scope: .write,
    apiKey: "YOUR_API_KEY",
    redirectURI: "https://auth.myapp.com/audius/callback",
    state: state,
    responseMode: .query,
    display: .fullScreen
  )
)

let session = ASWebAuthenticationSession(
  url: oauthURL,
  callbackURLScheme: nil
) { callbackURL, error in
  guard let callbackURL else { return }
  Task {
    let callback = try client.auth.parseOAuthCallback(url: callbackURL, expectedState: state)
    _ = try await client.auth.createSession(token: callback.token, scope: .write)
  }
}
session.start()
```

## Write Auth Strategy

- Default: direct bearer (`Authorization: Bearer <token>`).
- Fallback: optional `WriteProxyExecutor` for operations that reject bearer in production.
- No private keys are stored in the app when using proxy fallback mode.

## API Surface

- Generated operation registry:
  - `Sources/AudiusKit/Generated/AudiusOperations.generated.swift`
- Tag API entrypoints:
  - `Sources/AudiusKit/APIs/TagAPIs.swift`

## Docs

- `documentation/Getting-Started.md`
- `documentation/Architecture.md`
- `documentation/Usage-Guide.md`
- `documentation/API-Reference.md`
- `documentation/Troubleshooting.md`
- `documentation/Migration-v1-to-v2.md`
