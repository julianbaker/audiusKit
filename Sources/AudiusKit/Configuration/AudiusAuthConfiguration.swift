import Foundation

public enum AudiusOAuthScope: String, Sendable, Codable {
  case read
  case write
}

public enum AudiusAuthMode: Sendable {
  case none
  case sessionBearer
  case staticBearer(String)
  case basic(username: String, privateKey: String)
}

public struct AudiusAuthConfiguration: Sendable {
  public var mode: AudiusAuthMode

  public init(mode: AudiusAuthMode = .none) {
    self.mode = mode
  }
}
