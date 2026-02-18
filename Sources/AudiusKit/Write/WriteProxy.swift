import Foundation

public struct AudiusProxyRequest: Sendable {
  public let operation: AudiusOperation
  public let path: String
  public let method: AudiusHTTPMethod
  public let queryItems: [URLQueryItem]
  public let headers: [String: String]
  public let body: JSONValue?

  public init(
    operation: AudiusOperation,
    path: String,
    method: AudiusHTTPMethod,
    queryItems: [URLQueryItem],
    headers: [String: String],
    body: JSONValue?
  ) {
    self.operation = operation
    self.path = path
    self.method = method
    self.queryItems = queryItems
    self.headers = headers
    self.body = body
  }
}

public protocol WriteProxyExecutor: Sendable {
  func execute(_ request: AudiusProxyRequest) async throws -> AudiusHTTPResponse<Data>
}
