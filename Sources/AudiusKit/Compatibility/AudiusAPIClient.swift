import Foundation

@available(*, deprecated, message: "Use AudiusClient(configuration:) directly.")
public final class AudiusAPIClient: @unchecked Sendable {
  public static let shared = AudiusAPIClient(
    configuration: AudiusClientConfiguration(appName: "AudiusKit")
  )

  private let lock = NSLock()
  private var wrappedClient: AudiusClient

  public init(configuration: AudiusClientConfiguration) {
    self.wrappedClient = AudiusClient(configuration: configuration)
  }

  public var client: AudiusClient {
    lock.lock()
    defer { lock.unlock() }
    return wrappedClient
  }

  public func configure(_ configuration: AudiusClientConfiguration) {
    lock.lock()
    defer { lock.unlock() }
    wrappedClient = AudiusClient(configuration: configuration)
  }
}
