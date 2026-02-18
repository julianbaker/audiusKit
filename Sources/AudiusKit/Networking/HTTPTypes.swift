import Foundation

public enum AudiusHTTPMethod: String, Sendable, Codable {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}

public enum AudiusAuthRequirement: String, Sendable, Codable {
  case none
  case basic
  case bearer
  case basicOrBearer
}

public struct AudiusHTTPResponse<Body: Sendable>: Sendable {
  public let statusCode: Int
  public let headers: [String: String]
  public let body: Body

  public init(statusCode: Int, headers: [String: String], body: Body) {
    self.statusCode = statusCode
    self.headers = headers
    self.body = body
  }
}
