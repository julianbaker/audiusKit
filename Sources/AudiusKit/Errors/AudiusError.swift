import Foundation

public enum AudiusError: Error, LocalizedError, Sendable {
  case invalidURL
  case missingPathParameter(String)
  case requestEncoding(String)
  case unauthorized(String)
  case forbidden(String)
  case notFound(String)
  case validationError(String)
  case rateLimited(String)
  case serverError(status: Int, message: String)
  case decoding(String)
  case network(String)
  case hostUnavailable
  case oauthStateMismatch
  case tokenVerificationFailed(String)
  case proxyFallbackUnavailable
  case unsupportedOperation(String)

  public var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "Invalid URL"
    case .missingPathParameter(let name):
      return "Missing path parameter: \(name)"
    case .requestEncoding(let message):
      return "Request encoding error: \(message)"
    case .unauthorized(let message):
      return "Unauthorized: \(message)"
    case .forbidden(let message):
      return "Forbidden: \(message)"
    case .notFound(let message):
      return "Not found: \(message)"
    case .validationError(let message):
      return "Validation error: \(message)"
    case .rateLimited(let message):
      return "Rate limited: \(message)"
    case .serverError(let status, let message):
      return "Server error (\(status)): \(message)"
    case .decoding(let message):
      return "Decoding error: \(message)"
    case .network(let message):
      return "Network error: \(message)"
    case .hostUnavailable:
      return "No Audius host available"
    case .oauthStateMismatch:
      return "OAuth state mismatch"
    case .tokenVerificationFailed(let message):
      return "Token verification failed: \(message)"
    case .proxyFallbackUnavailable:
      return "Proxy fallback unavailable"
    case .unsupportedOperation(let name):
      return "Unsupported operation: \(name)"
    }
  }
}
