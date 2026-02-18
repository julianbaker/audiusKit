import Foundation

public extension AudiusHTTPResponse where Body == Data {
  func decodeJSON() throws -> JSONValue {
    if body.isEmpty {
      return .null
    }
    do {
      return try JSONDecoder().decode(JSONValue.self, from: body)
    } catch {
      throw AudiusError.decoding(error.localizedDescription)
    }
  }

  func decode<T: Decodable>(_ type: T.Type) throws -> T {
    do {
      return try JSONDecoder().decode(T.self, from: body)
    } catch {
      throw AudiusError.decoding(error.localizedDescription)
    }
  }
}
