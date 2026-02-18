# Getting Started (v2)

## 1. Create Configuration

```swift
import AudiusKit

let configuration = AudiusClientConfiguration(
  appName: "MyApp",
  auth: AudiusAuthConfiguration(mode: .none),
  sessionStore: InMemorySessionStore()
)
let client = AudiusClient(configuration: configuration)
```

## 2. Perform a Read Request

```swift
let response = try await client.tracks.getTrack(pathParameters: ["track_id": "123"])
let json = try response.decodeJSON()
```

## 3. Add OAuth + Session

For authenticated flows:

```swift
let token = "<token from Audius OAuth callback>"
_ = try await client.auth.createSession(token: token, scope: .write)
```

Then use `auth.mode = .sessionBearer` in configuration to inject bearer auth from the session store.

## 4. Enable Proxy Fallback (Optional)

Provide a `WriteProxyExecutor` implementation in configuration to handle write operations that cannot complete in bearer mode for production behavior.
