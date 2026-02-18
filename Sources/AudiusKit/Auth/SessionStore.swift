import Foundation

public protocol AudiusSessionStore: Sendable {
  func save(_ session: AudiusSession) async throws
  func load() async throws -> AudiusSession?
  func clear() async throws
}

public actor InMemorySessionStore: AudiusSessionStore {
  private var session: AudiusSession?

  public init() {}

  public func save(_ session: AudiusSession) async throws {
    self.session = session
  }

  public func load() async throws -> AudiusSession? {
    session
  }

  public func clear() async throws {
    session = nil
  }
}

#if canImport(Security)
  import Security

  public actor KeychainSessionStore: AudiusSessionStore {
    private let service: String
    private let account: String
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public init(service: String = "com.audiuskit.session", account: String = "default") {
      self.service = service
      self.account = account
    }

    public func save(_ session: AudiusSession) async throws {
      let data = try encoder.encode(session)
      try await clear()

      let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
        kSecValueData as String: data,
      ]

      let status = SecItemAdd(query as CFDictionary, nil)
      guard status == errSecSuccess else {
        throw AudiusError.requestEncoding("Failed to save session in keychain (status \(status))")
      }
    }

    public func load() async throws -> AudiusSession? {
      let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
        kSecReturnData as String: true,
        kSecMatchLimit as String: kSecMatchLimitOne,
      ]

      var result: AnyObject?
      let status = SecItemCopyMatching(query as CFDictionary, &result)

      if status == errSecItemNotFound {
        return nil
      }
      guard status == errSecSuccess, let data = result as? Data else {
        throw AudiusError.network("Failed to read session from keychain (status \(status))")
      }

      do {
        return try decoder.decode(AudiusSession.self, from: data)
      } catch {
        throw AudiusError.decoding(error.localizedDescription)
      }
    }

    public func clear() async throws {
      let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
      ]

      let status = SecItemDelete(query as CFDictionary)
      guard status == errSecSuccess || status == errSecItemNotFound else {
        throw AudiusError.network("Failed to clear session from keychain (status \(status))")
      }
    }
  }
#endif
