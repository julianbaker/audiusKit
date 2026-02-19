import Foundation

public extension AudiusHTTPResponse where Body == Data {
  func decodeJSON() throws -> JSONValue {
    if body.isEmpty {
      return .null
    }
    return try AudiusJSONCoding.decode(JSONValue.self, from: body)
  }

  func decode<T: Decodable>(_ type: T.Type) throws -> T {
    try AudiusJSONCoding.decode(T.self, from: body)
  }
}
