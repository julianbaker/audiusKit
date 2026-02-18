import Foundation

public extension AudiusHTTPResponse where Body == Data {
  func decodeTyped<T: Decodable>(_ type: T.Type, operation: AudiusOperation) throws -> T {
    do {
      return try JSONDecoder().decode(T.self, from: body)
    } catch {
      throw AudiusError.decoding("Operation \(operation.rawValue): \(error.localizedDescription)")
    }
  }
}
