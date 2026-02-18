import Foundation

public struct AudiusAuthAPI: Sendable {
  private let core: AudiusCore
  private let sessionStore: any AudiusSessionStore

  init(core: AudiusCore, sessionStore: any AudiusSessionStore) {
    self.core = core
    self.sessionStore = sessionStore
  }

  public func buildOAuthURL(request: AudiusOAuthRequest) throws -> URL {
    try AudiusOAuthURLBuilder.buildURL(request: request)
  }

  public func generateState(length: Int = 32) -> String {
    AudiusOAuthURLBuilder.generateState(length: length)
  }

  public func parseOAuthCallback(url: URL, expectedState: String) throws -> AudiusOAuthCallback {
    try AudiusOAuthCallbackParser.parseAndValidate(url: url, expectedState: expectedState)
  }

  public func verifyToken(_ token: String) async throws -> AudiusVerifiedUserToken {
    try await core.verifyToken(token)
  }

  @discardableResult
  public func createSession(token: String, scope: AudiusOAuthScope) async throws -> AudiusSession {
    let verified = try await verifyToken(token)
    let session = AudiusSession(token: token, scope: scope, verifiedUser: verified)
    try await sessionStore.save(session)
    return session
  }

  public func loadSession() async throws -> AudiusSession? {
    try await sessionStore.load()
  }

  public func clearSession() async throws {
    try await sessionStore.clear()
  }
}

public final class AudiusClient: @unchecked Sendable {
  public let users: UsersAPI
  public let tracks: TracksAPI
  public let playlists: PlaylistsAPI
  public let comments: CommentsAPI
  public let developerApps: DeveloperAppsAPI
  public let events: EventsAPI
  public let explore: ExploreAPI
  public let challenges: ChallengesAPI
  public let tips: TipsAPI
  public let coins: CoinsAPI
  public let rewards: RewardsAPI
  public let prizes: PrizesAPI
  public let resolve: ResolveAPI
  public let wallet: WalletAPI
  public let dashboardWalletUsers: DashboardWalletUsersAPI
  public let auth: AudiusAuthAPI

  private let core: AudiusCore

  public init(configuration: AudiusClientConfiguration) {
    let core = AudiusCore(configuration: configuration)
    self.core = core

    self.users = UsersAPI(core: core)
    self.tracks = TracksAPI(core: core)
    self.playlists = PlaylistsAPI(core: core)
    self.comments = CommentsAPI(core: core)
    self.developerApps = DeveloperAppsAPI(core: core)
    self.events = EventsAPI(core: core)
    self.explore = ExploreAPI(core: core)
    self.challenges = ChallengesAPI(core: core)
    self.tips = TipsAPI(core: core)
    self.coins = CoinsAPI(core: core)
    self.rewards = RewardsAPI(core: core)
    self.prizes = PrizesAPI(core: core)
    self.resolve = ResolveAPI(core: core)
    self.wallet = WalletAPI(core: core)
    self.dashboardWalletUsers = DashboardWalletUsersAPI(core: core)
    self.auth = AudiusAuthAPI(core: core, sessionStore: configuration.sessionStore)
  }

  public func raw(
    operation: AudiusOperation,
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await core.perform(
      operation: operation,
      pathParameters: pathParameters,
      queryItems: queryItems,
      headers: headers,
      body: body
    )
  }
}
