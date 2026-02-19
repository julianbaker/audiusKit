import Foundation

enum AudiusJSONCoding {
  static func makeDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .custom { decoder in
      let container = try decoder.singleValueContainer()

      if let seconds = try? container.decode(Double.self) {
        return dateFromUnixTimestamp(seconds)
      }

      if let seconds = try? container.decode(Int64.self) {
        return dateFromUnixTimestamp(Double(seconds))
      }

      let value = try container.decode(String.self)
      if let date = parseISO8601Date(value) {
        return date
      }
      if let numeric = Double(value) {
        return dateFromUnixTimestamp(numeric)
      }

      throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unsupported date value '\(value)'")
    }
    return decoder
  }

  static func decode<T: Decodable>(
    _ type: T.Type,
    from data: Data,
    operation: AudiusOperation? = nil
  ) throws -> T {
    do {
      return try makeDecoder().decode(T.self, from: data)
    } catch let error as DecodingError {
      let prefix = operation.map { "Operation \($0.rawValue): " } ?? ""
      throw AudiusError.decoding(prefix + describe(error))
    } catch {
      let prefix = operation.map { "Operation \($0.rawValue): " } ?? ""
      throw AudiusError.decoding(prefix + error.localizedDescription)
    }
  }

  private static func parseISO8601Date(_ value: String) -> Date? {
    let withFractional = ISO8601DateFormatter()
    withFractional.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    if let date = withFractional.date(from: value) {
      return date
    }

    let standard = ISO8601DateFormatter()
    standard.formatOptions = [.withInternetDateTime]
    return standard.date(from: value)
  }

  private static func dateFromUnixTimestamp(_ rawValue: Double) -> Date {
    let seconds = abs(rawValue) > 9_999_999_999 ? rawValue / 1_000 : rawValue
    return Date(timeIntervalSince1970: seconds)
  }

  private static func describe(_ error: DecodingError) -> String {
    switch error {
    case .keyNotFound(let key, let context):
      return "keyNotFound '\(key.stringValue)' at \(codingPathString(context.codingPath)): \(context.debugDescription)"
    case .typeMismatch(let type, let context):
      return "typeMismatch \(type) at \(codingPathString(context.codingPath)): \(context.debugDescription)"
    case .valueNotFound(let type, let context):
      return "valueNotFound \(type) at \(codingPathString(context.codingPath)): \(context.debugDescription)"
    case .dataCorrupted(let context):
      return "dataCorrupted at \(codingPathString(context.codingPath)): \(context.debugDescription)"
    @unknown default:
      return error.localizedDescription
    }
  }

  private static func codingPathString(_ path: [any CodingKey]) -> String {
    if path.isEmpty {
      return "<root>"
    }
    return path.map { key in
      if let intValue = key.intValue {
        return "[\(intValue)]"
      }
      return key.stringValue
    }.joined(separator: ".")
  }
}
