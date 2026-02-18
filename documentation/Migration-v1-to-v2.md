# Migration Guide: v1 -> v2

## Key Changes

- New primary client: `AudiusClient(configuration:)`
- New typed facade: `client.typed`
- Legacy singleton retained only as deprecated bridge: `AudiusAPIClient.shared`
- Raw fallback surface still available

## Recommended Migration Path

1. Replace singleton usage with explicit `AudiusClient` construction.
2. Migrate API calls from raw dictionary signatures to typed params:
   - from: `client.users.getUser(pathParameters: ["id": ...])`
   - to: `client.typed.users.getUser(.init(id: ...))`
3. Move response parsing from ad-hoc JSON to typed models/envelopes.
4. Keep raw APIs only for exceptional cases.
5. Remove `AudiusAPIClient.shared` usage after migration.

## Legacy Shim Scope

`AudiusAPIClient` in v2 provides only:

- `AudiusAPIClient.shared`
- `init(configuration:)`
- `configure(_:)`
- `client` (wrapped `AudiusClient`)

No legacy endpoint aliases are reintroduced.

## Auth Migration

- Use system web auth (`ASWebAuthenticationSession`).
- Parse and validate callback with `client.auth`.
- Verify token, then persist session.
- Use `.sessionBearer` auth mode for bearer-first writes.
