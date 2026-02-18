import Foundation

public struct AudiusClientConfiguration: Sendable {
  public var appName: String
  public var discoveryURL: URL
  public var hostRefreshInterval: TimeInterval
  public var sessionConfiguration: URLSessionConfiguration
  public var auth: AudiusAuthConfiguration
  public var sessionStore: any AudiusSessionStore
  public var writeProxy: (any WriteProxyExecutor)?

  public init(
    appName: String,
    discoveryURL: URL = URL(string: "https://api.audius.co")!,
    hostRefreshInterval: TimeInterval = 300,
    sessionConfiguration: URLSessionConfiguration = .default,
    auth: AudiusAuthConfiguration = .init(),
    sessionStore: any AudiusSessionStore = InMemorySessionStore(),
    writeProxy: (any WriteProxyExecutor)? = nil
  ) {
    self.appName = appName
    self.discoveryURL = discoveryURL
    self.hostRefreshInterval = hostRefreshInterval
    self.sessionConfiguration = sessionConfiguration
    self.auth = auth
    self.sessionStore = sessionStore
    self.writeProxy = writeProxy
  }
}
