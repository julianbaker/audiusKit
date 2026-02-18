import Foundation

public enum JSONValue: Sendable, Codable, Equatable {
  case null
  case bool(Bool)
  case number(Double)
  case string(String)
  case array([JSONValue])
  case object([String: JSONValue])

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if container.decodeNil() {
      self = .null
    } else if let value = try? container.decode(Bool.self) {
      self = .bool(value)
    } else if let value = try? container.decode(Double.self) {
      self = .number(value)
    } else if let value = try? container.decode(String.self) {
      self = .string(value)
    } else if let value = try? container.decode([JSONValue].self) {
      self = .array(value)
    } else if let value = try? container.decode([String: JSONValue].self) {
      self = .object(value)
    } else {
      throw AudiusError.decoding("Unable to decode JSONValue")
    }
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .null:
      try container.encodeNil()
    case .bool(let value):
      try container.encode(value)
    case .number(let value):
      try container.encode(value)
    case .string(let value):
      try container.encode(value)
    case .array(let values):
      try container.encode(values)
    case .object(let values):
      try container.encode(values)
    }
  }
}

public struct AnyJSONResponse: Sendable, Codable {
  public let value: JSONValue

  public init(value: JSONValue) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    let value = try JSONValue(from: decoder)
    self.init(value: value)
  }
}
