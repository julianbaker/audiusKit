import Foundation

public struct AudiusEnvelope<T: Codable & Sendable>: Sendable, Codable {
  public let data: T

  public init(data: T) {
    self.data = data
  }
}

extension AudiusEnvelope: Equatable where T: Equatable {}

public struct AudiusListEnvelope<T: Codable & Sendable>: Sendable, Codable {
  public let data: [T]

  public init(data: [T]) {
    self.data = data
  }
}

extension AudiusListEnvelope: Equatable where T: Equatable {}

public struct AudiusOptionalEnvelope<T: Codable & Sendable>: Sendable, Codable {
  public let data: T?

  public init(data: T?) {
    self.data = data
  }
}

extension AudiusOptionalEnvelope: Equatable where T: Equatable {}

public struct AudiusWriteEnvelope<T: Codable & Sendable>: Sendable, Codable {
  public let success: Bool?
  public let transactionHash: String?
  public let data: T?

  public init(success: Bool?, transactionHash: String?, data: T?) {
    self.success = success
    self.transactionHash = transactionHash
    self.data = data
  }

  enum CodingKeys: String, CodingKey {
    case success
    case transactionHash = "transaction_hash"
    case data
  }
}

extension AudiusWriteEnvelope: Equatable where T: Equatable {}

public enum AudiusTypedValueCoder {
  private static let encoder = JSONEncoder()
  private static let decoder = JSONDecoder()
  private static let iso8601Formatter = ISO8601DateFormatter()

  public static func pathString<T: Encodable>(_ value: T) -> String {
    if let value = value as? String {
      return value
    }
    if let value = value as? Int {
      return String(value)
    }
    if let value = value as? Double {
      return String(value)
    }
    if let value = value as? Bool {
      return value ? "true" : "false"
    }
    if let value = value as? Date {
      return iso8601Formatter.string(from: value)
    }
    return String(describing: value)
  }

  public static func queryString<T: Encodable>(_ value: T) throws -> String {
    if let value = value as? String {
      return value
    }
    if let value = value as? Int {
      return String(value)
    }
    if let value = value as? Double {
      return String(value)
    }
    if let value = value as? Bool {
      return value ? "true" : "false"
    }
    if let value = value as? Date {
      return iso8601Formatter.string(from: value)
    }

    let jsonValue = try jsonValue(from: value)
    switch jsonValue {
    case .string(let stringValue):
      return stringValue
    case .number(let numberValue):
      return String(numberValue)
    case .bool(let boolValue):
      return boolValue ? "true" : "false"
    default:
      throw AudiusError.requestEncoding("Unable to encode query string from \(T.self)")
    }
  }

  public static func jsonValue<T: Encodable>(from value: T) throws -> JSONValue {
    do {
      let data = try encoder.encode(value)
      return try decoder.decode(JSONValue.self, from: data)
    } catch {
      throw AudiusError.requestEncoding(error.localizedDescription)
    }
  }
}
