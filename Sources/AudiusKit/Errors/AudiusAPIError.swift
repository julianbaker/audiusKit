import Foundation

/// Represents errors that can occur during API interactions
public enum AudiusAPIError: LocalizedError {
  /// The URL is invalid or could not be constructed
  case invalidURL
  /// A network error occurred during the request
  case networkError(Error)
  /// The response could not be decoded into the expected type
  case decodingError(Error)
  /// The response from the server was invalid
  case invalidResponse
  /// The API returned an error message
  case apiError(String)
  /// No Audius hosts are available
  case noHostsAvailable
  /// The host is no longer responding
  case hostUnavailable(String)

  public var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "Invalid URL"
    case .networkError(let error):
      return "Network error: \(error.localizedDescription)"
    case .decodingError(let error):
      return "Failed to decode response: \(error.localizedDescription)"
    case .invalidResponse:
      return "Invalid response from server"
    case .apiError(let message):
      return "API error: \(message)"
    case .noHostsAvailable:
      return "No Audius hosts available"
    case .hostUnavailable(let host):
      return "Host is no longer available: \(host)"
    }
  }
}
