# Troubleshooting (v2)

## `oauthStateMismatch`

Cause: callback `state` does not match request `state`.

Fix:

- generate cryptographically random state per auth attempt
- store it in-memory for the auth transaction
- validate exact equality before token usage

## `tokenVerificationFailed`

Cause: `/v1/users/verify_token` failed or returned an unexpected payload.

Fix:

- verify discovery host availability
- confirm token was received from Audius callback
- inspect response payload shape and status

## `hostUnavailable`

Cause: discovery host lookup failed and no cached host was available.

Fix:

- check network availability
- verify `discoveryURL` is reachable
- retry request after transient failures

## `unauthorized` on write endpoints

Cause: endpoint rejects current auth mode.

Fix:

- ensure session bearer token exists and is valid
- verify operation auth requirement in `AudiusOperationRegistry`
- provide a `WriteProxyExecutor` for endpoints requiring proxy behavior

## Decode failures

Cause: response body does not match expected decoder.

Fix:

- use `decodeJSON()` to inspect raw payload
- update model decoder for schema changes in source swagger
- regenerate operation/model layers when swagger changes
