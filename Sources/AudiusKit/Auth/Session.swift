import Foundation

public struct AudiusVerifiedUserToken: Sendable, Codable, Equatable {
  public let userId: String
  public let email: String?
  public let name: String?
  public let handle: String?
  public let verified: Bool?
  public let profilePicture: JSONValue?
  public let apiKey: String?
  public let sub: String?
  public let iat: String?

  public init(
    userId: String,
    email: String?,
    name: String?,
    handle: String?,
    verified: Bool?,
    profilePicture: JSONValue?,
    apiKey: String?,
    sub: String?,
    iat: String?
  ) {
    self.userId = userId
    self.email = email
    self.name = name
    self.handle = handle
    self.verified = verified
    self.profilePicture = profilePicture
    self.apiKey = apiKey
    self.sub = sub
    self.iat = iat
  }
}

public struct AudiusSession: Sendable, Codable, Equatable {
  public let token: String
  public let scope: AudiusOAuthScope
  public let issuedAt: Date
  public let verifiedUser: AudiusVerifiedUserToken

  public init(token: String, scope: AudiusOAuthScope, issuedAt: Date = Date(), verifiedUser: AudiusVerifiedUserToken) {
    self.token = token
    self.scope = scope
    self.issuedAt = issuedAt
    self.verifiedUser = verifiedUser
  }
}
