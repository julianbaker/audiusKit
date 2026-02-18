# Migration Guide: v1 -> v2

## Breaking Changes

- v1 singleton-style client surface is removed.
- v2 requires explicit `AudiusClient(configuration:)`.
- responses are no longer silently swallowed on decode errors.
- endpoint wrappers are organized by tag clients and generated from swagger.

## New Entry Point

```swift
let client = AudiusClient(configuration: AudiusClientConfiguration(appName: "MyApp"))
```

## Method Mapping Pattern

- old direct methods -> tag clients, e.g. `client.users.getUser(...)`
- operation naming aligns to swagger `operationId`

## Auth Migration

- use system web auth (`ASWebAuthenticationSession`) in the host app
- parse callback + validate state using `client.auth`
- verify token with `client.auth.verifyToken(...)`
- create/persist session via `client.auth.createSession(...)`

## Write Migration

- default to bearer-first execution
- add optional proxy executor for endpoints that cannot complete with direct bearer behavior

## Recommended Rollout

1. Replace v1 client construction with `AudiusClient` configuration.
2. Migrate read flows tag-by-tag.
3. Migrate write flows with bearer token session.
4. Add proxy fallback only for operations that fail bearer mode in production.
5. Re-run tests against source swagger coverage.
