import Foundation

public extension AudiusHTTPResponse where Body == Data {
  func decodeTyped<T: Decodable>(_ type: T.Type, operation: AudiusOperation) throws -> T {
    try AudiusJSONCoding.decode(T.self, from: body, operation: operation)
  }
}
