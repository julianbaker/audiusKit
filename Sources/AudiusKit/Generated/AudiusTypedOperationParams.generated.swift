import Foundation

public struct GetUndisbursedChallengesParams: Sendable {
  public var challengeId: String?
  public var completedBlocknumber: Int?
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(challengeId: String? = nil, completedBlocknumber: Int? = nil, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.challengeId = challengeId
    self.completedBlocknumber = completedBlocknumber
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = challengeId {
      items.append(URLQueryItem(name: "challenge_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = completedBlocknumber {
      items.append(URLQueryItem(name: "completed_blocknumber", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUndisbursedChallengesForUserParams: Sendable {
  public var userId: String
  public var challengeId: String?
  public var completedBlocknumber: Int?
  public var limit: Int?
  public var offset: Int?

  public init(userId: String, challengeId: String? = nil, completedBlocknumber: Int? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.userId = userId
    self.challengeId = challengeId
    self.completedBlocknumber = completedBlocknumber
    self.limit = limit
    self.offset = offset
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["user_id"] = AudiusTypedValueCoder.pathString(userId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = challengeId {
      items.append(URLQueryItem(name: "challenge_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = completedBlocknumber {
      items.append(URLQueryItem(name: "completed_blocknumber", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct ClaimCoinRewardParams: Sendable {
  public var mint: String
  public var userId: String

  public init(mint: String, userId: String) {
    self.mint = mint
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct ClaimCoinRewardCodeParams: Sendable {
  public var code: String
  public var mint: String
  public var userId: String

  public init(code: String, mint: String, userId: String) {
    self.code = code
    self.mint = mint
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["code"] = AudiusTypedValueCoder.pathString(code)
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct CreateCoinParams: Sendable {
  public var userId: String
  public var body: CreateCoinRequestBody

  public init(userId: String, body: CreateCoinRequestBody) {
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct GetCoinParams: Sendable {
  public var mint: String

  public init(mint: String) {
    self.mint = mint
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCoinByTickerParams: Sendable {
  public var ticker: String

  public init(ticker: String) {
    self.ticker = ticker
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["ticker"] = AudiusTypedValueCoder.pathString(ticker)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCoinInsightsParams: Sendable {
  public var mint: String

  public init(mint: String) {
    self.mint = mint
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCoinMembersParams: Sendable {
  public var mint: String
  public var limit: Int?
  public var offset: Int?
  public var sortDirection: String?

  public init(mint: String, limit: Int? = nil, offset: Int? = nil, sortDirection: String? = nil) {
    self.mint = mint
    self.limit = limit
    self.offset = offset
    self.sortDirection = sortDirection
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortDirection {
      items.append(URLQueryItem(name: "sort_direction", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCoinMembersCountParams: Sendable {
  public var mint: String

  public init(mint: String) {
    self.mint = mint
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCoinRedeemAmountParams: Sendable {
  public var mint: String

  public init(mint: String) {
    self.mint = mint
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCoinsParams: Sendable {
  public var limit: Int?
  public var mint: [String]?
  public var offset: Int?
  public var ownerId: [String]?
  public var query: String?
  public var sortDirection: String?
  public var sortMethod: String?
  public var ticker: [String]?

  public init(limit: Int? = nil, mint: [String]? = nil, offset: Int? = nil, ownerId: [String]? = nil, query: String? = nil, sortDirection: String? = nil, sortMethod: String? = nil, ticker: [String]? = nil) {
    self.limit = limit
    self.mint = mint
    self.offset = offset
    self.ownerId = ownerId
    self.query = query
    self.sortDirection = sortDirection
    self.sortMethod = sortMethod
    self.ticker = ticker
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = mint {
      for value in values {
        items.append(URLQueryItem(name: "mint", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = ownerId {
      for value in values {
        items.append(URLQueryItem(name: "owner_id", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortDirection {
      items.append(URLQueryItem(name: "sort_direction", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = ticker {
      for value in values {
        items.append(URLQueryItem(name: "ticker", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRewardCodeParams: Sendable {
  public var code: String
  public var mint: String

  public init(code: String, mint: String) {
    self.code = code
    self.mint = mint
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["code"] = AudiusTypedValueCoder.pathString(code)
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetVolumeLeadersParams: Sendable {
  public var from: String?
  public var limit: Int?
  public var offset: Int?
  public var to: String?

  public init(from: String? = nil, limit: Int? = nil, offset: Int? = nil, to: String? = nil) {
    self.from = from
    self.limit = limit
    self.offset = offset
    self.to = to
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = from {
      items.append(URLQueryItem(name: "from", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = to {
      items.append(URLQueryItem(name: "to", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UpdateCoinParams: Sendable {
  public var mint: String
  public var userId: String
  public var body: UpdateCoinRequestBody

  public init(mint: String, userId: String, body: UpdateCoinRequestBody) {
    self.mint = mint
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct CreateCommentParams: Sendable {
  public var userId: String
  public var body: CreateCommentRequestBody

  public init(userId: String, body: CreateCommentRequestBody) {
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct DeleteCommentParams: Sendable {
  public var commentId: String
  public var userId: String

  public init(commentId: String, userId: String) {
    self.commentId = commentId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCommentParams: Sendable {
  public var commentId: String

  public init(commentId: String) {
    self.commentId = commentId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetCommentRepliesParams: Sendable {
  public var commentId: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(commentId: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.commentId = commentId
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUnclaimedCommentIdParams: Sendable {

  public init() {
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct PinCommentParams: Sendable {
  public var commentId: String
  public var userId: String
  public var body: PinCommentRequestBody

  public init(commentId: String, userId: String, body: PinCommentRequestBody) {
    self.commentId = commentId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct ReactToCommentParams: Sendable {
  public var commentId: String
  public var userId: String
  public var body: ReactCommentRequestBody

  public init(commentId: String, userId: String, body: ReactCommentRequestBody) {
    self.commentId = commentId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct ReportCommentParams: Sendable {
  public var commentId: String
  public var userId: String

  public init(commentId: String, userId: String) {
    self.commentId = commentId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnpinCommentParams: Sendable {
  public var commentId: String
  public var userId: String
  public var body: PinCommentRequestBody

  public init(commentId: String, userId: String, body: PinCommentRequestBody) {
    self.commentId = commentId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct UnreactToCommentParams: Sendable {
  public var commentId: String
  public var userId: String
  public var body: ReactCommentRequestBody

  public init(commentId: String, userId: String, body: ReactCommentRequestBody) {
    self.commentId = commentId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct UpdateCommentParams: Sendable {
  public var commentId: String
  public var userId: String
  public var body: UpdateCommentRequestBody

  public init(commentId: String, userId: String, body: UpdateCommentRequestBody) {
    self.commentId = commentId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["comment_id"] = AudiusTypedValueCoder.pathString(commentId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct BulkGetDashboardWalletUsersParams: Sendable {
  public var wallets: [String]

  public init(wallets: [String]) {
    self.wallets = wallets
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    let joined = try wallets.map { try AudiusTypedValueCoder.queryString($0) }.joined(separator: ",")
    items.append(URLQueryItem(name: "wallets", value: joined))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct CreateDeveloperAppParams: Sendable {
  public var userId: String
  public var body: CreateDeveloperAppRequestBody

  public init(userId: String, body: CreateDeveloperAppRequestBody) {
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct CreateDeveloperAppAccessKeyParams: Sendable {
  public var address: String
  public var userId: String

  public init(address: String, userId: String) {
    self.address = address
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["address"] = AudiusTypedValueCoder.pathString(address)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct DeactivateDeveloperAppAccessKeyParams: Sendable {
  public var address: String
  public var userId: String
  public var body: DeactivateAccessKeyRequestBody

  public init(address: String, userId: String, body: DeactivateAccessKeyRequestBody) {
    self.address = address
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["address"] = AudiusTypedValueCoder.pathString(address)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct DeleteDeveloperAppParams: Sendable {
  public var address: String
  public var userId: String

  public init(address: String, userId: String) {
    self.address = address
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["address"] = AudiusTypedValueCoder.pathString(address)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetDeveloperAppParams: Sendable {
  public var address: String

  public init(address: String) {
    self.address = address
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["address"] = AudiusTypedValueCoder.pathString(address)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetDeveloperAppsParams: Sendable {
  public var id: String
  public var include: String?

  public init(id: String, include: String? = nil) {
    self.id = id
    self.include = include
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = include {
      items.append(URLQueryItem(name: "include", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetAllEventsParams: Sendable {
  public var eventType: String?
  public var limit: Int?
  public var offset: Int?
  public var sortMethod: String?
  public var userId: String?

  public init(eventType: String? = nil, limit: Int? = nil, offset: Int? = nil, sortMethod: String? = nil, userId: String? = nil) {
    self.eventType = eventType
    self.limit = limit
    self.offset = offset
    self.sortMethod = sortMethod
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = eventType {
      items.append(URLQueryItem(name: "event_type", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetBulkEventsParams: Sendable {
  public var eventType: String?
  public var id: [String]?
  public var userId: String?

  public init(eventType: String? = nil, id: [String]? = nil, userId: String? = nil) {
    self.eventType = eventType
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = eventType {
      items.append(URLQueryItem(name: "event_type", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = id {
      for value in values {
        items.append(URLQueryItem(name: "id", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetEntityEventsParams: Sendable {
  public var entityId: [String]
  public var entityType: String?
  public var filterDeleted: Bool?
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(entityId: [String], entityType: String? = nil, filterDeleted: Bool? = nil, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.entityId = entityId
    self.entityType = entityType
    self.filterDeleted = filterDeleted
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    for value in entityId {
      items.append(URLQueryItem(name: "entity_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = entityType {
      items.append(URLQueryItem(name: "entity_type", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = filterDeleted {
      items.append(URLQueryItem(name: "filter_deleted", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUnclaimedEventIdParams: Sendable {

  public init() {
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetBestSellingParams: Sendable {
  public var limit: Int?
  public var offset: Int?
  public var type: String?
  public var userId: String?

  public init(limit: Int? = nil, offset: Int? = nil, type: String? = nil, userId: String? = nil) {
    self.limit = limit
    self.offset = offset
    self.type = type
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = type {
      items.append(URLQueryItem(name: "type", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct CreatePlaylistParams: Sendable {
  public var userId: String
  public var body: CreatePlaylistRequestBody

  public init(userId: String, body: CreatePlaylistRequestBody) {
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct DeletePlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String

  public init(playlistId: String, userId: String) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct FavoritePlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String

  public init(playlistId: String, userId: String) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetBulkPlaylistsParams: Sendable {
  public var id: [String]?
  public var upc: [String]?
  public var userId: String?

  public init(id: [String]? = nil, upc: [String]? = nil, userId: String? = nil) {
    self.id = id
    self.upc = upc
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = id {
      for value in values {
        items.append(URLQueryItem(name: "id", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let values = upc {
      for value in values {
        items.append(URLQueryItem(name: "upc", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetPlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String?

  public init(playlistId: String, userId: String? = nil) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetPlaylistAccessInfoParams: Sendable {
  public var playlistId: String
  public var userId: String?

  public init(playlistId: String, userId: String? = nil) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetPlaylistByHandleAndSlugParams: Sendable {
  public var handle: String
  public var slug: String
  public var userId: String?

  public init(handle: String, slug: String, userId: String? = nil) {
    self.handle = handle
    self.slug = slug
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["handle"] = AudiusTypedValueCoder.pathString(handle)
    values["slug"] = AudiusTypedValueCoder.pathString(slug)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetPlaylistTracksParams: Sendable {
  public var playlistId: String

  public init(playlistId: String) {
    self.playlistId = playlistId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingPlaylistsParams: Sendable {
  public var limit: Int?
  public var offset: Int?
  public var omitTracks: Bool?
  public var time: String?
  public var type: String?
  public var userId: String?

  public init(limit: Int? = nil, offset: Int? = nil, omitTracks: Bool? = nil, time: String? = nil, type: String? = nil, userId: String? = nil) {
    self.limit = limit
    self.offset = offset
    self.omitTracks = omitTracks
    self.time = time
    self.type = type
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = omitTracks {
      items.append(URLQueryItem(name: "omit_tracks", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = type {
      items.append(URLQueryItem(name: "type", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct RepostPlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String

  public init(playlistId: String, userId: String) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct SearchPlaylistsParams: Sendable {
  public var genre: [String]?
  public var hasDownloads: String?
  public var includePurchaseable: String?
  public var limit: Int?
  public var mood: [String]?
  public var offset: Int?
  public var query: String?
  public var sortMethod: String?

  public init(genre: [String]? = nil, hasDownloads: String? = nil, includePurchaseable: String? = nil, limit: Int? = nil, mood: [String]? = nil, offset: Int? = nil, query: String? = nil, sortMethod: String? = nil) {
    self.genre = genre
    self.hasDownloads = hasDownloads
    self.includePurchaseable = includePurchaseable
    self.limit = limit
    self.mood = mood
    self.offset = offset
    self.query = query
    self.sortMethod = sortMethod
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = genre {
      for value in values {
        items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = hasDownloads {
      items.append(URLQueryItem(name: "has_downloads", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = includePurchaseable {
      items.append(URLQueryItem(name: "includePurchaseable", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = mood {
      for value in values {
        items.append(URLQueryItem(name: "mood", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct SharePlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String

  public init(playlistId: String, userId: String) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnfavoritePlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String

  public init(playlistId: String, userId: String) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnrepostPlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String

  public init(playlistId: String, userId: String) {
    self.playlistId = playlistId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UpdatePlaylistParams: Sendable {
  public var playlistId: String
  public var userId: String
  public var body: UpdatePlaylistRequestBody

  public init(playlistId: String, userId: String, body: UpdatePlaylistRequestBody) {
    self.playlistId = playlistId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["playlist_id"] = AudiusTypedValueCoder.pathString(playlistId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct ClaimPrizeParams: Sendable {
  public var body: PrizeClaimRequestBody

  public init(body: PrizeClaimRequestBody) {
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct GetPrizesParams: Sendable {

  public init() {
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetWalletPrizesParams: Sendable {
  public var wallet: String

  public init(wallet: String) {
    self.wallet = wallet
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["wallet"] = AudiusTypedValueCoder.pathString(wallet)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct ResolveParams: Sendable {
  public var url: String

  public init(url: String) {
    self.url = url
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "url", value: try AudiusTypedValueCoder.queryString(url)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct ClaimRewardsParams: Sendable {
  public var body: ClaimRewardsRequestBody

  public init(body: ClaimRewardsRequestBody) {
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct CreateRewardCodeParams: Sendable {
  public var body: CreateRewardCodeRequestBody?

  public init(body: CreateRewardCodeRequestBody? = nil) {
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    guard let body = body else { return nil }
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct GetTipsParams: Sendable {
  public var currentUserFollows: String?
  public var limit: Int?
  public var maxSlot: Int?
  public var minSlot: Int?
  public var offset: Int?
  public var receiverIsVerified: Bool?
  public var receiverMinFollowers: Int?
  public var txSignatures: [String]?
  public var uniqueBy: String?
  public var userId: String?

  public init(currentUserFollows: String? = nil, limit: Int? = nil, maxSlot: Int? = nil, minSlot: Int? = nil, offset: Int? = nil, receiverIsVerified: Bool? = nil, receiverMinFollowers: Int? = nil, txSignatures: [String]? = nil, uniqueBy: String? = nil, userId: String? = nil) {
    self.currentUserFollows = currentUserFollows
    self.limit = limit
    self.maxSlot = maxSlot
    self.minSlot = minSlot
    self.offset = offset
    self.receiverIsVerified = receiverIsVerified
    self.receiverMinFollowers = receiverMinFollowers
    self.txSignatures = txSignatures
    self.uniqueBy = uniqueBy
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = currentUserFollows {
      items.append(URLQueryItem(name: "current_user_follows", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = maxSlot {
      items.append(URLQueryItem(name: "max_slot", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = minSlot {
      items.append(URLQueryItem(name: "min_slot", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = receiverIsVerified {
      items.append(URLQueryItem(name: "receiver_is_verified", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = receiverMinFollowers {
      items.append(URLQueryItem(name: "receiver_min_followers", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = txSignatures {
      let joined = try values.map { try AudiusTypedValueCoder.queryString($0) }.joined(separator: ",")
      items.append(URLQueryItem(name: "tx_signatures", value: joined))
    }
    if let value = uniqueBy {
      items.append(URLQueryItem(name: "unique_by", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct CreateTrackParams: Sendable {
  public var userId: String
  public var body: CreateTrackRequestBody

  public init(userId: String, body: CreateTrackRequestBody) {
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct DeleteTrackParams: Sendable {
  public var trackId: String
  public var userId: String

  public init(trackId: String, userId: String) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct DownloadTrackParams: Sendable {
  public var trackId: String
  public var filename: String?
  public var nftAccessSignature: String?
  public var userData: String?
  public var userId: String?
  public var userSignature: String?

  public init(trackId: String, filename: String? = nil, nftAccessSignature: String? = nil, userData: String? = nil, userId: String? = nil, userSignature: String? = nil) {
    self.trackId = trackId
    self.filename = filename
    self.nftAccessSignature = nftAccessSignature
    self.userData = userData
    self.userId = userId
    self.userSignature = userSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = filename {
      items.append(URLQueryItem(name: "filename", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = nftAccessSignature {
      items.append(URLQueryItem(name: "nft_access_signature", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userData {
      items.append(URLQueryItem(name: "user_data", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userSignature {
      items.append(URLQueryItem(name: "user_signature", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct FavoriteTrackParams: Sendable {
  public var trackId: String
  public var userId: String

  public init(trackId: String, userId: String) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetBulkTracksParams: Sendable {
  public var id: [String]?
  public var isrc: [String]?
  public var permalink: [String]?
  public var userId: String?

  public init(id: [String]? = nil, isrc: [String]? = nil, permalink: [String]? = nil, userId: String? = nil) {
    self.id = id
    self.isrc = isrc
    self.permalink = permalink
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = id {
      for value in values {
        items.append(URLQueryItem(name: "id", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let values = isrc {
      for value in values {
        items.append(URLQueryItem(name: "isrc", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let values = permalink {
      for value in values {
        items.append(URLQueryItem(name: "permalink", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetFeelingLuckyTracksParams: Sendable {
  public var limit: Int?
  public var minFollowers: Int?
  public var userId: String?
  public var withUsers: Bool?

  public init(limit: Int? = nil, minFollowers: Int? = nil, userId: String? = nil, withUsers: Bool? = nil) {
    self.limit = limit
    self.minFollowers = minFollowers
    self.userId = userId
    self.withUsers = withUsers
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = minFollowers {
      items.append(URLQueryItem(name: "min_followers", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = withUsers {
      items.append(URLQueryItem(name: "with_users", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetMostSharedTracksParams: Sendable {
  public var limit: Int?
  public var offset: Int?
  public var timeRange: String?
  public var userId: String?

  public init(limit: Int? = nil, offset: Int? = nil, timeRange: String? = nil, userId: String? = nil) {
    self.limit = limit
    self.offset = offset
    self.timeRange = timeRange
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = timeRange {
      items.append(URLQueryItem(name: "time_range", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRecentPremiumTracksParams: Sendable {
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRecommendedTracksParams: Sendable {
  public var exclusionList: [Int]?
  public var genre: String?
  public var limit: Int?
  public var time: String?
  public var userId: String?

  public init(exclusionList: [Int]? = nil, genre: String? = nil, limit: Int? = nil, time: String? = nil, userId: String? = nil) {
    self.exclusionList = exclusionList
    self.genre = genre
    self.limit = limit
    self.time = time
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = exclusionList {
      for value in values {
        items.append(URLQueryItem(name: "exclusion_list", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRecommendedTracksWithVersionParams: Sendable {
  public var version: String
  public var exclusionList: [Int]?
  public var genre: String?
  public var limit: Int?
  public var time: String?
  public var userId: String?

  public init(version: String, exclusionList: [Int]? = nil, genre: String? = nil, limit: Int? = nil, time: String? = nil, userId: String? = nil) {
    self.version = version
    self.exclusionList = exclusionList
    self.genre = genre
    self.limit = limit
    self.time = time
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["version"] = AudiusTypedValueCoder.pathString(version)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = exclusionList {
      for value in values {
        items.append(URLQueryItem(name: "exclusion_list", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackParams: Sendable {
  public var trackId: String
  public var userId: String?

  public init(trackId: String, userId: String? = nil) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackAccessInfoParams: Sendable {
  public var trackId: String
  public var userId: String?

  public init(trackId: String, userId: String? = nil) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackCommentCountParams: Sendable {
  public var trackId: String
  public var userId: String?

  public init(trackId: String, userId: String? = nil) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackCommentNotificationSettingParams: Sendable {
  public var trackId: String
  public var userId: String?

  public init(trackId: String, userId: String? = nil) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackCommentsParams: Sendable {
  public var trackId: String
  public var limit: Int?
  public var offset: Int?
  public var sortMethod: String?
  public var userId: String?

  public init(trackId: String, limit: Int? = nil, offset: Int? = nil, sortMethod: String? = nil, userId: String? = nil) {
    self.trackId = trackId
    self.limit = limit
    self.offset = offset
    self.sortMethod = sortMethod
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackRemixParentsParams: Sendable {
  public var trackId: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(trackId: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.trackId = trackId
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackRemixesParams: Sendable {
  public var trackId: String
  public var limit: Int?
  public var offset: Int?
  public var onlyContestEntries: Bool?
  public var onlyCosigns: Bool?
  public var sortMethod: String?
  public var userId: String?

  public init(trackId: String, limit: Int? = nil, offset: Int? = nil, onlyContestEntries: Bool? = nil, onlyCosigns: Bool? = nil, sortMethod: String? = nil, userId: String? = nil) {
    self.trackId = trackId
    self.limit = limit
    self.offset = offset
    self.onlyContestEntries = onlyContestEntries
    self.onlyCosigns = onlyCosigns
    self.sortMethod = sortMethod
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = onlyContestEntries {
      items.append(URLQueryItem(name: "only_contest_entries", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = onlyCosigns {
      items.append(URLQueryItem(name: "only_cosigns", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackStemsParams: Sendable {
  public var trackId: String

  public init(trackId: String) {
    self.trackId = trackId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrackTopListenersParams: Sendable {
  public var trackId: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(trackId: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.trackId = trackId
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTracksWithRecentCommentsParams: Sendable {
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingTrackIdsParams: Sendable {
  public var genre: String?
  public var limit: Int?
  public var offset: Int?

  public init(genre: String? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.genre = genre
    self.limit = limit
    self.offset = offset
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingTracksParams: Sendable {
  public var genre: String?
  public var limit: Int?
  public var offset: Int?
  public var time: String?
  public var userId: String?

  public init(genre: String? = nil, limit: Int? = nil, offset: Int? = nil, time: String? = nil, userId: String? = nil) {
    self.genre = genre
    self.limit = limit
    self.offset = offset
    self.time = time
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingTracksIdsWithVersionParams: Sendable {
  public var version: String
  public var genre: String?
  public var limit: Int?
  public var offset: Int?

  public init(version: String, genre: String? = nil, limit: Int? = nil, offset: Int? = nil) {
    self.version = version
    self.genre = genre
    self.limit = limit
    self.offset = offset
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["version"] = AudiusTypedValueCoder.pathString(version)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingTracksWithVersionParams: Sendable {
  public var version: String
  public var genre: String?
  public var limit: Int?
  public var offset: Int?
  public var time: String?
  public var userId: String?

  public init(version: String, genre: String? = nil, limit: Int? = nil, offset: Int? = nil, time: String? = nil, userId: String? = nil) {
    self.version = version
    self.genre = genre
    self.limit = limit
    self.offset = offset
    self.time = time
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["version"] = AudiusTypedValueCoder.pathString(version)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingUsdcPurchaseTracksParams: Sendable {
  public var genre: String?
  public var limit: Int?
  public var offset: Int?
  public var time: String?
  public var userId: String?

  public init(genre: String? = nil, limit: Int? = nil, offset: Int? = nil, time: String? = nil, userId: String? = nil) {
    self.genre = genre
    self.limit = limit
    self.offset = offset
    self.time = time
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTrendingUsdcPurchaseTracksWithVersionParams: Sendable {
  public var version: String
  public var genre: String?
  public var limit: Int?
  public var offset: Int?
  public var time: String?
  public var userId: String?

  public init(version: String, genre: String? = nil, limit: Int? = nil, offset: Int? = nil, time: String? = nil, userId: String? = nil) {
    self.version = version
    self.genre = genre
    self.limit = limit
    self.offset = offset
    self.time = time
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["version"] = AudiusTypedValueCoder.pathString(version)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = genre {
      items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = time {
      items.append(URLQueryItem(name: "time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUndergroundTrendingTracksParams: Sendable {
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUndergroundTrendingTracksWithVersionParams: Sendable {
  public var version: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(version: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.version = version
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["version"] = AudiusTypedValueCoder.pathString(version)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUsersFromFavoritesParams: Sendable {
  public var trackId: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(trackId: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.trackId = trackId
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUsersFromRepostsParams: Sendable {
  public var trackId: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(trackId: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.trackId = trackId
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct InspectTrackParams: Sendable {
  public var trackId: String
  public var original: Bool?

  public init(trackId: String, original: Bool? = nil) {
    self.trackId = trackId
    self.original = original
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = original {
      items.append(URLQueryItem(name: "original", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct InspectTracksParams: Sendable {
  public var id: [String]
  public var original: Bool?

  public init(id: [String], original: Bool? = nil) {
    self.id = id
    self.original = original
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    for value in id {
      items.append(URLQueryItem(name: "id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = original {
      items.append(URLQueryItem(name: "original", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct RecordTrackDownloadParams: Sendable {
  public var trackId: String
  public var body: TrackDownloadRequestBody?

  public init(trackId: String, body: TrackDownloadRequestBody? = nil) {
    self.trackId = trackId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    guard let body = body else { return nil }
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct RepostTrackParams: Sendable {
  public var trackId: String
  public var userId: String

  public init(trackId: String, userId: String) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct SearchTracksParams: Sendable {
  public var bpmMax: String?
  public var bpmMin: String?
  public var genre: [String]?
  public var hasDownloads: String?
  public var includePurchaseable: String?
  public var isPurchaseable: String?
  public var key: [String]?
  public var limit: Int?
  public var mood: [String]?
  public var offset: Int?
  public var onlyDownloadable: String?
  public var query: String?
  public var sortMethod: String?

  public init(bpmMax: String? = nil, bpmMin: String? = nil, genre: [String]? = nil, hasDownloads: String? = nil, includePurchaseable: String? = nil, isPurchaseable: String? = nil, key: [String]? = nil, limit: Int? = nil, mood: [String]? = nil, offset: Int? = nil, onlyDownloadable: String? = nil, query: String? = nil, sortMethod: String? = nil) {
    self.bpmMax = bpmMax
    self.bpmMin = bpmMin
    self.genre = genre
    self.hasDownloads = hasDownloads
    self.includePurchaseable = includePurchaseable
    self.isPurchaseable = isPurchaseable
    self.key = key
    self.limit = limit
    self.mood = mood
    self.offset = offset
    self.onlyDownloadable = onlyDownloadable
    self.query = query
    self.sortMethod = sortMethod
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = bpmMax {
      items.append(URLQueryItem(name: "bpm_max", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = bpmMin {
      items.append(URLQueryItem(name: "bpm_min", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = genre {
      for value in values {
        items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = hasDownloads {
      items.append(URLQueryItem(name: "has_downloads", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = includePurchaseable {
      items.append(URLQueryItem(name: "includePurchaseable", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = isPurchaseable {
      items.append(URLQueryItem(name: "is_purchaseable", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = key {
      for value in values {
        items.append(URLQueryItem(name: "key", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = mood {
      for value in values {
        items.append(URLQueryItem(name: "mood", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = onlyDownloadable {
      items.append(URLQueryItem(name: "only_downloadable", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct ShareTrackParams: Sendable {
  public var trackId: String
  public var userId: String

  public init(trackId: String, userId: String) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct StreamTrackParams: Sendable {
  public var trackId: String
  public var apiKey: String?
  public var nftAccessSignature: String?
  public var noRedirect: Bool?
  public var preview: Bool?
  public var skipCheck: Bool?
  public var skipPlayCount: Bool?
  public var userData: String?
  public var userId: String?
  public var userSignature: String?

  public init(trackId: String, apiKey: String? = nil, nftAccessSignature: String? = nil, noRedirect: Bool? = nil, preview: Bool? = nil, skipCheck: Bool? = nil, skipPlayCount: Bool? = nil, userData: String? = nil, userId: String? = nil, userSignature: String? = nil) {
    self.trackId = trackId
    self.apiKey = apiKey
    self.nftAccessSignature = nftAccessSignature
    self.noRedirect = noRedirect
    self.preview = preview
    self.skipCheck = skipCheck
    self.skipPlayCount = skipPlayCount
    self.userData = userData
    self.userId = userId
    self.userSignature = userSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = apiKey {
      items.append(URLQueryItem(name: "api_key", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = nftAccessSignature {
      items.append(URLQueryItem(name: "nft_access_signature", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = noRedirect {
      items.append(URLQueryItem(name: "no_redirect", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = preview {
      items.append(URLQueryItem(name: "preview", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = skipCheck {
      items.append(URLQueryItem(name: "skip_check", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = skipPlayCount {
      items.append(URLQueryItem(name: "skip_play_count", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userData {
      items.append(URLQueryItem(name: "user_data", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userSignature {
      items.append(URLQueryItem(name: "user_signature", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnfavoriteTrackParams: Sendable {
  public var trackId: String
  public var userId: String

  public init(trackId: String, userId: String) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnrepostTrackParams: Sendable {
  public var trackId: String
  public var userId: String

  public init(trackId: String, userId: String) {
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UpdateTrackParams: Sendable {
  public var trackId: String
  public var userId: String
  public var body: UpdateTrackRequestBody

  public init(trackId: String, userId: String, body: UpdateTrackRequestBody) {
    self.trackId = trackId
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["track_id"] = AudiusTypedValueCoder.pathString(trackId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct AddManagerParams: Sendable {
  public var id: String
  public var body: AddManagerRequestBody

  public init(id: String, body: AddManagerRequestBody) {
    self.id = id
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct ApproveGrantParams: Sendable {
  public var id: String
  public var body: ApproveGrantRequestBody

  public init(id: String, body: ApproveGrantRequestBody) {
    self.id = id
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct CreateGrantParams: Sendable {
  public var id: String
  public var body: CreateGrantRequestBody

  public init(id: String, body: CreateGrantRequestBody) {
    self.id = id
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct CreateUserParams: Sendable {
  public var userId: String
  public var body: CreateUserRequestBody

  public init(userId: String, body: CreateUserRequestBody) {
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct DownloadPurchasesAsCsvParams: Sendable {
  public var id: String
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct DownloadSalesAsCsvParams: Sendable {
  public var id: String
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct DownloadSalesAsJsonParams: Sendable {
  public var id: String
  public var granteeUserId: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, granteeUserId: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.granteeUserId = granteeUserId
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = granteeUserId {
      items.append(URLQueryItem(name: "grantee_user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct DownloadUsdcWithdrawalsAsCsvParams: Sendable {
  public var id: String
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct FollowUserParams: Sendable {
  public var id: String
  public var userId: String

  public init(id: String, userId: String) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetAiAttributedTracksByUserHandleParams: Sendable {
  public var handle: String
  public var filterTracks: String?
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sort: String?
  public var sortDirection: String?
  public var sortMethod: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(handle: String, filterTracks: String? = nil, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sort: String? = nil, sortDirection: String? = nil, sortMethod: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.handle = handle
    self.filterTracks = filterTracks
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sort = sort
    self.sortDirection = sortDirection
    self.sortMethod = sortMethod
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["handle"] = AudiusTypedValueCoder.pathString(handle)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = filterTracks {
      items.append(URLQueryItem(name: "filter_tracks", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sort {
      items.append(URLQueryItem(name: "sort", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortDirection {
      items.append(URLQueryItem(name: "sort_direction", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetAlbumsByUserParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sortMethod: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sortMethod: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sortMethod = sortMethod
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetAuthorizedAppsParams: Sendable {
  public var id: String

  public init(id: String) {
    self.id = id
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetBulkUsersParams: Sendable {
  public var id: [String]?
  public var userId: String?

  public init(id: [String]? = nil, userId: String? = nil) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = id {
      for value in values {
        items.append(URLQueryItem(name: "id", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetConnectedWalletsParams: Sendable {
  public var id: String

  public init(id: String) {
    self.id = id
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetFavoritesParams: Sendable {
  public var id: String

  public init(id: String) {
    self.id = id
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetFollowersParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetFollowingParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetMutedUsersParams: Sendable {
  public var id: String
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetMutualFollowersParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetPlaylistsByUserParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sortMethod: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sortMethod: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sortMethod = sortMethod
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetPurchasersParams: Sendable {
  public var id: String
  public var contentId: String?
  public var contentType: String?
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, contentId: String? = nil, contentType: String? = nil, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.contentId = contentId
    self.contentType = contentType
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = contentId {
      items.append(URLQueryItem(name: "content_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = contentType {
      items.append(URLQueryItem(name: "content_type", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRelatedUsersParams: Sendable {
  public var id: String
  public var filterFollowed: Bool?
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, filterFollowed: Bool? = nil, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.filterFollowed = filterFollowed
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = filterFollowed {
      items.append(URLQueryItem(name: "filter_followed", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRemixersParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var trackId: String?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, trackId: String? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.trackId = trackId
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = trackId {
      items.append(URLQueryItem(name: "track_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetRepostsParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetSalesAggregateParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetSubscribersParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetSupportedUsersParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetSupportersParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTopTrackTagsParams: Sendable {
  public var id: String
  public var limit: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTracksByUserParams: Sendable {
  public var id: String
  public var filterTracks: String?
  public var gateCondition: [String]?
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sort: String?
  public var sortDirection: String?
  public var sortMethod: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, filterTracks: String? = nil, gateCondition: [String]? = nil, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sort: String? = nil, sortDirection: String? = nil, sortMethod: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.filterTracks = filterTracks
    self.gateCondition = gateCondition
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sort = sort
    self.sortDirection = sortDirection
    self.sortMethod = sortMethod
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = filterTracks {
      items.append(URLQueryItem(name: "filter_tracks", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = gateCondition {
      for value in values {
        items.append(URLQueryItem(name: "gate_condition", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sort {
      items.append(URLQueryItem(name: "sort", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortDirection {
      items.append(URLQueryItem(name: "sort_direction", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTracksByUserHandleParams: Sendable {
  public var handle: String
  public var filterTracks: String?
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sort: String?
  public var sortDirection: String?
  public var sortMethod: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(handle: String, filterTracks: String? = nil, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sort: String? = nil, sortDirection: String? = nil, sortMethod: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.handle = handle
    self.filterTracks = filterTracks
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sort = sort
    self.sortDirection = sortDirection
    self.sortMethod = sortMethod
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["handle"] = AudiusTypedValueCoder.pathString(handle)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = filterTracks {
      items.append(URLQueryItem(name: "filter_tracks", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sort {
      items.append(URLQueryItem(name: "sort", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortDirection {
      items.append(URLQueryItem(name: "sort_direction", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetTracksCountByUserParams: Sendable {
  public var id: String
  public var filterTracks: String?
  public var gateCondition: [String]?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, filterTracks: String? = nil, gateCondition: [String]? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.filterTracks = filterTracks
    self.gateCondition = gateCondition
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = filterTracks {
      items.append(URLQueryItem(name: "filter_tracks", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let values = gateCondition {
      for value in values {
        items.append(URLQueryItem(name: "gate_condition", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserParams: Sendable {
  public var id: String
  public var userId: String?

  public init(id: String, userId: String? = nil) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserBalanceHistoryParams: Sendable {
  public var id: String
  public var endTime: Date?
  public var granularity: String?
  public var startTime: Date?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, endTime: Date? = nil, granularity: String? = nil, startTime: Date? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.endTime = endTime
    self.granularity = granularity
    self.startTime = startTime
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = endTime {
      items.append(URLQueryItem(name: "end_time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = granularity {
      items.append(URLQueryItem(name: "granularity", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = startTime {
      items.append(URLQueryItem(name: "start_time", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserByHandleParams: Sendable {
  public var handle: String
  public var userId: String?

  public init(handle: String, userId: String? = nil) {
    self.handle = handle
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["handle"] = AudiusTypedValueCoder.pathString(handle)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserChallengesParams: Sendable {
  public var id: String
  public var showHistorical: Bool?

  public init(id: String, showHistorical: Bool? = nil) {
    self.id = id
    self.showHistorical = showHistorical
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = showHistorical {
      items.append(URLQueryItem(name: "show_historical", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserCoinParams: Sendable {
  public var id: String
  public var mint: String

  public init(id: String, mint: String) {
    self.id = id
    self.mint = mint
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    values["mint"] = AudiusTypedValueCoder.pathString(mint)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserCoinsParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?

  public init(id: String, limit: Int? = nil, offset: Int? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserCollectiblesParams: Sendable {
  public var id: String

  public init(id: String) {
    self.id = id
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserCommentsParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserEmailKeyParams: Sendable {
  public var grantorUserId: String
  public var receivingUserId: String

  public init(grantorUserId: String, receivingUserId: String) {
    self.grantorUserId = grantorUserId
    self.receivingUserId = receivingUserId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["grantor_user_id"] = AudiusTypedValueCoder.pathString(grantorUserId)
    values["receiving_user_id"] = AudiusTypedValueCoder.pathString(receivingUserId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserIdsByAddressesParams: Sendable {
  public var address: [String]

  public init(address: [String]) {
    self.address = address
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    for value in address {
      items.append(URLQueryItem(name: "address", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserMonthlyTrackListensParams: Sendable {
  public var id: String
  public var endTime: String
  public var startTime: String

  public init(id: String, endTime: String, startTime: String) {
    self.id = id
    self.endTime = endTime
    self.startTime = startTime
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "end_time", value: try AudiusTypedValueCoder.queryString(endTime)))
    items.append(URLQueryItem(name: "start_time", value: try AudiusTypedValueCoder.queryString(startTime)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserRecommendedTracksParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var timeRange: String?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, timeRange: String? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.timeRange = timeRange
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = timeRange {
      items.append(URLQueryItem(name: "time_range", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserSTrackHistoryParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sortDirection: String?
  public var sortMethod: String?
  public var userId: String?
  public var encodedDataMessage: String?
  public var encodedDataSignature: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sortDirection: String? = nil, sortMethod: String? = nil, userId: String? = nil, encodedDataMessage: String? = nil, encodedDataSignature: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sortDirection = sortDirection
    self.sortMethod = sortMethod
    self.userId = userId
    self.encodedDataMessage = encodedDataMessage
    self.encodedDataSignature = encodedDataSignature
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortDirection {
      items.append(URLQueryItem(name: "sort_direction", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    var values: [String: String] = [:]
    if let value = encodedDataMessage {
      values["Encoded-Data-Message"] = try AudiusTypedValueCoder.queryString(value)
    }
    if let value = encodedDataSignature {
      values["Encoded-Data-Signature"] = try AudiusTypedValueCoder.queryString(value)
    }
    return values
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetUserTracksRemixedParams: Sendable {
  public var id: String
  public var limit: Int?
  public var offset: Int?
  public var userId: String?

  public init(id: String, limit: Int? = nil, offset: Int? = nil, userId: String? = nil) {
    self.id = id
    self.limit = limit
    self.offset = offset
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = userId {
      items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct MuteUserParams: Sendable {
  public var id: String
  public var userId: String

  public init(id: String, userId: String) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct RemoveManagerParams: Sendable {
  public var id: String
  public var managerUserId: String

  public init(id: String, managerUserId: String) {
    self.id = id
    self.managerUserId = managerUserId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    values["managerUserId"] = AudiusTypedValueCoder.pathString(managerUserId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct RevokeGrantParams: Sendable {
  public var address: String
  public var id: String

  public init(address: String, id: String) {
    self.address = address
    self.id = id
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["address"] = AudiusTypedValueCoder.pathString(address)
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    return []
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct SearchUsersParams: Sendable {
  public var genre: [String]?
  public var isVerified: String?
  public var limit: Int?
  public var offset: Int?
  public var query: String?
  public var sortMethod: String?

  public init(genre: [String]? = nil, isVerified: String? = nil, limit: Int? = nil, offset: Int? = nil, query: String? = nil, sortMethod: String? = nil) {
    self.genre = genre
    self.isVerified = isVerified
    self.limit = limit
    self.offset = offset
    self.query = query
    self.sortMethod = sortMethod
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let values = genre {
      for value in values {
        items.append(URLQueryItem(name: "genre", value: try AudiusTypedValueCoder.queryString(value)))
      }
    }
    if let value = isVerified {
      items.append(URLQueryItem(name: "is_verified", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = query {
      items.append(URLQueryItem(name: "query", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = sortMethod {
      items.append(URLQueryItem(name: "sort_method", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct SubscribeToUserParams: Sendable {
  public var id: String
  public var userId: String

  public init(id: String, userId: String) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnfollowUserParams: Sendable {
  public var id: String
  public var userId: String

  public init(id: String, userId: String) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnmuteUserParams: Sendable {
  public var id: String
  public var userId: String

  public init(id: String, userId: String) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UnsubscribeFromUserParams: Sendable {
  public var id: String
  public var userId: String

  public init(id: String, userId: String) {
    self.id = id
    self.userId = userId
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct UpdateUserParams: Sendable {
  public var id: String
  public var userId: String
  public var body: UpdateUserRequestBody

  public init(id: String, userId: String, body: UpdateUserRequestBody) {
    self.id = id
    self.userId = userId
    self.body = body
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["id"] = AudiusTypedValueCoder.pathString(id)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "user_id", value: try AudiusTypedValueCoder.queryString(userId)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return try AudiusTypedValueCoder.jsonValue(from: body)
  }
}

public struct VerifyIdTokenParams: Sendable {
  public var token: String

  public init(token: String) {
    self.token = token
  }

  func pathParameters() -> [String: String] {
    return [:]
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: "token", value: try AudiusTypedValueCoder.queryString(token)))
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}

public struct GetWalletCoinsParams: Sendable {
  public var walletId: String
  public var limit: Int?
  public var offset: Int?

  public init(walletId: String, limit: Int? = nil, offset: Int? = nil) {
    self.walletId = walletId
    self.limit = limit
    self.offset = offset
  }

  func pathParameters() -> [String: String] {
    var values: [String: String] = [:]
    values["walletId"] = AudiusTypedValueCoder.pathString(walletId)
    return values
  }

  func queryItems() throws -> [URLQueryItem] {
    var items: [URLQueryItem] = []
    if let value = limit {
      items.append(URLQueryItem(name: "limit", value: try AudiusTypedValueCoder.queryString(value)))
    }
    if let value = offset {
      items.append(URLQueryItem(name: "offset", value: try AudiusTypedValueCoder.queryString(value)))
    }
    return items
  }

  func headerValues() throws -> [String: String] {
    return [:]
  }

  func encodedBody() throws -> JSONValue? {
    return nil
  }
}
