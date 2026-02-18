import Foundation

public protocol _AudiusTagAPI: Sendable {
  var core: AudiusCore { get }
  static var tag: AudiusOperationTag { get }
}

extension _AudiusTagAPI {
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

public struct UsersAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .users
  public let core: AudiusCore
}

public struct TracksAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .tracks
  public let core: AudiusCore
}

public struct PlaylistsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .playlists
  public let core: AudiusCore
}

public struct CommentsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .comments
  public let core: AudiusCore
}

public struct DeveloperAppsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .developerApps
  public let core: AudiusCore
}

public struct EventsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .events
  public let core: AudiusCore
}

public struct ExploreAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .explore
  public let core: AudiusCore
}

public struct ChallengesAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .challenges
  public let core: AudiusCore
}

public struct TipsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .tips
  public let core: AudiusCore
}

public struct CoinsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .coins
  public let core: AudiusCore
}

public struct RewardsAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .rewards
  public let core: AudiusCore
}

public struct PrizesAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .prizes
  public let core: AudiusCore
}

public struct ResolveAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .resolve
  public let core: AudiusCore
}

public struct WalletAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .wallet
  public let core: AudiusCore
}

public struct DashboardWalletUsersAPI: _AudiusTagAPI {
  public static let tag: AudiusOperationTag = .dashboardWalletUsers
  public let core: AudiusCore
}
