# Architecture (v2)

## Core Types

- `AudiusClient`: top-level configured entrypoint.
- `AudiusClientConfiguration`: app name, discovery host, auth mode, session store, proxy.
- `AudiusCore`: actor responsible for host discovery, request building, auth injection, retries/fallback.
- `AudiusOperationRegistry`: generated method/path/tag/auth mapping from swagger.

## API Partitioning

`AudiusClient` exposes tag-scoped clients:

- `users`, `tracks`, `playlists`, `comments`, `developerApps`
- `events`, `explore`, `challenges`, `tips`
- `coins`, `rewards`, `prizes`, `resolve`, `wallet`, `dashboardWalletUsers`

## Authentication Model

- OAuth URL/callback helpers in `Auth/OAuth.swift`.
- Token verification through `/v1/users/verify_token`.
- Session persistence through `AudiusSessionStore` (`InMemorySessionStore` or `KeychainSessionStore`).

## Write Strategy

- Bearer-first for write operations requiring `basic`, `bearer`, or `basicOrBearer`.
- Optional proxy fallback (`WriteProxyExecutor`) when direct write returns auth mismatch/unsupported behavior.

## Error Model

`AudiusError` maps transport and contract failures:

- URL/request: `invalidURL`, `missingPathParameter`, `requestEncoding`
- HTTP/auth: `unauthorized`, `forbidden`, `notFound`, `validationError`, `rateLimited`, `serverError`
- runtime: `decoding`, `network`, `hostUnavailable`
- OAuth/session: `oauthStateMismatch`, `tokenVerificationFailed`
