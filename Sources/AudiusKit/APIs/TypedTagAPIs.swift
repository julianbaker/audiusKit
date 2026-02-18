import Foundation

public protocol _AudiusTypedTagAPI: Sendable {
  var core: AudiusCore { get }
  static var tag: AudiusOperationTag { get }
}

extension _AudiusTypedTagAPI {
  @discardableResult
  public func perform(
    _ operation: AudiusOperation,
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    let spec = try AudiusOperationRegistry.spec(for: operation)
    guard spec.tag == Self.tag else {
      throw AudiusError.unsupportedOperation("Operation \(operation.rawValue) is not part of tag \(Self.tag.rawValue)")
    }
    return try await core.perform(
      operation: operation,
      pathParameters: pathParameters,
      queryItems: queryItems,
      headers: headers,
      body: body
    )
  }
}

public struct AudiusTypedClient: Sendable {
  public let users: TypedUsersAPI
  public let tracks: TypedTracksAPI
  public let playlists: TypedPlaylistsAPI
  public let comments: TypedCommentsAPI
  public let developerApps: TypedDeveloperAppsAPI
  public let events: TypedEventsAPI
  public let explore: TypedExploreAPI
  public let challenges: TypedChallengesAPI
  public let tips: TypedTipsAPI
  public let coins: TypedCoinsAPI
  public let rewards: TypedRewardsAPI
  public let prizes: TypedPrizesAPI
  public let resolve: TypedResolveAPI
  public let wallet: TypedWalletAPI
  public let dashboardWalletUsers: TypedDashboardWalletUsersAPI

  init(core: AudiusCore) {
    self.users = TypedUsersAPI(core: core)
    self.tracks = TypedTracksAPI(core: core)
    self.playlists = TypedPlaylistsAPI(core: core)
    self.comments = TypedCommentsAPI(core: core)
    self.developerApps = TypedDeveloperAppsAPI(core: core)
    self.events = TypedEventsAPI(core: core)
    self.explore = TypedExploreAPI(core: core)
    self.challenges = TypedChallengesAPI(core: core)
    self.tips = TypedTipsAPI(core: core)
    self.coins = TypedCoinsAPI(core: core)
    self.rewards = TypedRewardsAPI(core: core)
    self.prizes = TypedPrizesAPI(core: core)
    self.resolve = TypedResolveAPI(core: core)
    self.wallet = TypedWalletAPI(core: core)
    self.dashboardWalletUsers = TypedDashboardWalletUsersAPI(core: core)
  }
}

public struct TypedUsersAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .users
  public let core: AudiusCore
}

public struct TypedTracksAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .tracks
  public let core: AudiusCore
}

public struct TypedPlaylistsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .playlists
  public let core: AudiusCore
}

public struct TypedCommentsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .comments
  public let core: AudiusCore
}

public struct TypedDeveloperAppsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .developerApps
  public let core: AudiusCore
}

public struct TypedEventsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .events
  public let core: AudiusCore
}

public struct TypedExploreAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .explore
  public let core: AudiusCore
}

public struct TypedChallengesAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .challenges
  public let core: AudiusCore
}

public struct TypedTipsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .tips
  public let core: AudiusCore
}

public struct TypedCoinsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .coins
  public let core: AudiusCore
}

public struct TypedRewardsAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .rewards
  public let core: AudiusCore
}

public struct TypedPrizesAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .prizes
  public let core: AudiusCore
}

public struct TypedResolveAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .resolve
  public let core: AudiusCore
}

public struct TypedWalletAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .wallet
  public let core: AudiusCore
}

public struct TypedDashboardWalletUsersAPI: _AudiusTypedTagAPI {
  public static let tag: AudiusOperationTag = .dashboardWalletUsers
  public let core: AudiusCore
}
