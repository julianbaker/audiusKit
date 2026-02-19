import Foundation

public struct Track: Sendable, Codable, Equatable {
  public var access: Access?
  public var aiAttributionUserId: Int?
  public var albumBacklink: AlbumBacklink?
  public var allowedApiKeys: [String]?
  public var artists: JSONValue?
  public var artwork: TrackArtwork
  public var audioAnalysisErrorCount: Int?
  public var audioUploadId: String?
  public var blocknumber: Int?
  public var bpm: Double?
  public var commentCount: Int
  public var commentsDisabled: Bool?
  public var copyrightLine: JSONValue?
  public var coverArt: String?
  public var coverArtSizes: String?
  public var coverOriginalArtist: String?
  public var coverOriginalSongTitle: String?
  public var createDate: String?
  public var createdAt: Date?
  public var creditsSplits: String?
  public var ddexApp: String?
  public var ddexReleaseIds: JSONValue?
  public var description: String?
  public var download: MediaLink?
  public var downloadConditions: AccessGate?
  public var duration: Int
  public var favoriteCount: Int
  public var fieldVisibility: JSONValue?
  public var followeeFavorites: [JSONValue]?
  public var followeeReposts: [JSONValue]?
  public var genre: String
  public var hasCurrentUserReposted: Bool?
  public var hasCurrentUserSaved: Bool?
  public var id: String
  public var indirectResourceContributors: JSONValue?
  public var isAvailable: Bool?
  public var isCustomBpm: Bool?
  public var isCustomMusicalKey: Bool?
  public var isDelete: Bool?
  public var isDownloadGated: Bool?
  public var isDownloadable: Bool
  public var isOriginalAvailable: Bool
  public var isOwnedByUser: Bool?
  public var isScheduledRelease: Bool?
  public var isStreamGated: Bool?
  public var isStreamable: Bool?
  public var isUnlisted: Bool?
  public var isrc: String?
  public var iswc: String?
  public var license: String?
  public var mood: String?
  public var musicalKey: String?
  public var origFileCid: String?
  public var origFilename: String?
  public var parentalWarningType: String?
  public var permalink: String
  public var pinnedCommentId: Int?
  public var playCount: Int
  public var playlistsContainingTrack: [Int]?
  public var playlistsPreviouslyContainingTrack: JSONValue?
  public var preview: MediaLink?
  public var previewCid: String?
  public var previewStartSeconds: Double?
  public var producerCopyrightLine: JSONValue?
  public var releaseDate: String?
  public var remixOf: RemixParent?
  public var repostCount: Int
  public var resourceContributors: JSONValue?
  public var rightsController: JSONValue?
  public var slug: String?
  public var stemOf: [JSONValue]?
  public var stream: MediaLink?
  public var streamConditions: AccessGate?
  public var tags: String?
  public var title: String
  public var trackCid: String?
  public var trackId: Int?
  public var trackSegments: JSONValue?
  public var updatedAt: Date?
  public var user: User

  public init(access: Access? = nil, aiAttributionUserId: Int? = nil, albumBacklink: AlbumBacklink? = nil, allowedApiKeys: [String]? = nil, artists: JSONValue? = nil, artwork: TrackArtwork, audioAnalysisErrorCount: Int? = nil, audioUploadId: String? = nil, blocknumber: Int? = nil, bpm: Double? = nil, commentCount: Int, commentsDisabled: Bool? = nil, copyrightLine: JSONValue? = nil, coverArt: String? = nil, coverArtSizes: String? = nil, coverOriginalArtist: String? = nil, coverOriginalSongTitle: String? = nil, createDate: String? = nil, createdAt: Date? = nil, creditsSplits: String? = nil, ddexApp: String? = nil, ddexReleaseIds: JSONValue? = nil, description: String? = nil, download: MediaLink? = nil, downloadConditions: AccessGate? = nil, duration: Int, favoriteCount: Int, fieldVisibility: JSONValue? = nil, followeeFavorites: [JSONValue]? = nil, followeeReposts: [JSONValue]? = nil, genre: String, hasCurrentUserReposted: Bool? = nil, hasCurrentUserSaved: Bool? = nil, id: String, indirectResourceContributors: JSONValue? = nil, isAvailable: Bool? = nil, isCustomBpm: Bool? = nil, isCustomMusicalKey: Bool? = nil, isDelete: Bool? = nil, isDownloadGated: Bool? = nil, isDownloadable: Bool, isOriginalAvailable: Bool, isOwnedByUser: Bool? = nil, isScheduledRelease: Bool? = nil, isStreamGated: Bool? = nil, isStreamable: Bool? = nil, isUnlisted: Bool? = nil, isrc: String? = nil, iswc: String? = nil, license: String? = nil, mood: String? = nil, musicalKey: String? = nil, origFileCid: String? = nil, origFilename: String? = nil, parentalWarningType: String? = nil, permalink: String, pinnedCommentId: Int? = nil, playCount: Int, playlistsContainingTrack: [Int]? = nil, playlistsPreviouslyContainingTrack: JSONValue? = nil, preview: MediaLink? = nil, previewCid: String? = nil, previewStartSeconds: Double? = nil, producerCopyrightLine: JSONValue? = nil, releaseDate: String? = nil, remixOf: RemixParent? = nil, repostCount: Int, resourceContributors: JSONValue? = nil, rightsController: JSONValue? = nil, slug: String? = nil, stemOf: [JSONValue]? = nil, stream: MediaLink? = nil, streamConditions: AccessGate? = nil, tags: String? = nil, title: String, trackCid: String? = nil, trackId: Int? = nil, trackSegments: JSONValue? = nil, updatedAt: Date? = nil, user: User) {
    self.access = access
    self.aiAttributionUserId = aiAttributionUserId
    self.albumBacklink = albumBacklink
    self.allowedApiKeys = allowedApiKeys
    self.artists = artists
    self.artwork = artwork
    self.audioAnalysisErrorCount = audioAnalysisErrorCount
    self.audioUploadId = audioUploadId
    self.blocknumber = blocknumber
    self.bpm = bpm
    self.commentCount = commentCount
    self.commentsDisabled = commentsDisabled
    self.copyrightLine = copyrightLine
    self.coverArt = coverArt
    self.coverArtSizes = coverArtSizes
    self.coverOriginalArtist = coverOriginalArtist
    self.coverOriginalSongTitle = coverOriginalSongTitle
    self.createDate = createDate
    self.createdAt = createdAt
    self.creditsSplits = creditsSplits
    self.ddexApp = ddexApp
    self.ddexReleaseIds = ddexReleaseIds
    self.description = description
    self.download = download
    self.downloadConditions = downloadConditions
    self.duration = duration
    self.favoriteCount = favoriteCount
    self.fieldVisibility = fieldVisibility
    self.followeeFavorites = followeeFavorites
    self.followeeReposts = followeeReposts
    self.genre = genre
    self.hasCurrentUserReposted = hasCurrentUserReposted
    self.hasCurrentUserSaved = hasCurrentUserSaved
    self.id = id
    self.indirectResourceContributors = indirectResourceContributors
    self.isAvailable = isAvailable
    self.isCustomBpm = isCustomBpm
    self.isCustomMusicalKey = isCustomMusicalKey
    self.isDelete = isDelete
    self.isDownloadGated = isDownloadGated
    self.isDownloadable = isDownloadable
    self.isOriginalAvailable = isOriginalAvailable
    self.isOwnedByUser = isOwnedByUser
    self.isScheduledRelease = isScheduledRelease
    self.isStreamGated = isStreamGated
    self.isStreamable = isStreamable
    self.isUnlisted = isUnlisted
    self.isrc = isrc
    self.iswc = iswc
    self.license = license
    self.mood = mood
    self.musicalKey = musicalKey
    self.origFileCid = origFileCid
    self.origFilename = origFilename
    self.parentalWarningType = parentalWarningType
    self.permalink = permalink
    self.pinnedCommentId = pinnedCommentId
    self.playCount = playCount
    self.playlistsContainingTrack = playlistsContainingTrack
    self.playlistsPreviouslyContainingTrack = playlistsPreviouslyContainingTrack
    self.preview = preview
    self.previewCid = previewCid
    self.previewStartSeconds = previewStartSeconds
    self.producerCopyrightLine = producerCopyrightLine
    self.releaseDate = releaseDate
    self.remixOf = remixOf
    self.repostCount = repostCount
    self.resourceContributors = resourceContributors
    self.rightsController = rightsController
    self.slug = slug
    self.stemOf = stemOf
    self.stream = stream
    self.streamConditions = streamConditions
    self.tags = tags
    self.title = title
    self.trackCid = trackCid
    self.trackId = trackId
    self.trackSegments = trackSegments
    self.updatedAt = updatedAt
    self.user = user
  }

  enum CodingKeys: String, CodingKey {
    case access
    case aiAttributionUserId = "ai_attribution_user_id"
    case albumBacklink = "album_backlink"
    case allowedApiKeys = "allowed_api_keys"
    case artists
    case artwork
    case audioAnalysisErrorCount = "audio_analysis_error_count"
    case audioUploadId = "audio_upload_id"
    case blocknumber
    case bpm
    case commentCount = "comment_count"
    case commentsDisabled = "comments_disabled"
    case copyrightLine = "copyright_line"
    case coverArt = "cover_art"
    case coverArtSizes = "cover_art_sizes"
    case coverOriginalArtist = "cover_original_artist"
    case coverOriginalSongTitle = "cover_original_song_title"
    case createDate = "create_date"
    case createdAt = "created_at"
    case creditsSplits = "credits_splits"
    case ddexApp = "ddex_app"
    case ddexReleaseIds = "ddex_release_ids"
    case description
    case download
    case downloadConditions = "download_conditions"
    case duration
    case favoriteCount = "favorite_count"
    case fieldVisibility = "field_visibility"
    case followeeFavorites = "followee_favorites"
    case followeeReposts = "followee_reposts"
    case genre
    case hasCurrentUserReposted = "has_current_user_reposted"
    case hasCurrentUserSaved = "has_current_user_saved"
    case id
    case indirectResourceContributors = "indirect_resource_contributors"
    case isAvailable = "is_available"
    case isCustomBpm = "is_custom_bpm"
    case isCustomMusicalKey = "is_custom_musical_key"
    case isDelete = "is_delete"
    case isDownloadGated = "is_download_gated"
    case isDownloadable = "is_downloadable"
    case isOriginalAvailable = "is_original_available"
    case isOwnedByUser = "is_owned_by_user"
    case isScheduledRelease = "is_scheduled_release"
    case isStreamGated = "is_stream_gated"
    case isStreamable = "is_streamable"
    case isUnlisted = "is_unlisted"
    case isrc
    case iswc
    case license
    case mood
    case musicalKey = "musical_key"
    case origFileCid = "orig_file_cid"
    case origFilename = "orig_filename"
    case parentalWarningType = "parental_warning_type"
    case permalink
    case pinnedCommentId = "pinned_comment_id"
    case playCount = "play_count"
    case playlistsContainingTrack = "playlists_containing_track"
    case playlistsPreviouslyContainingTrack = "playlists_previously_containing_track"
    case preview
    case previewCid = "preview_cid"
    case previewStartSeconds = "preview_start_seconds"
    case producerCopyrightLine = "producer_copyright_line"
    case releaseDate = "release_date"
    case remixOf = "remix_of"
    case repostCount = "repost_count"
    case resourceContributors = "resource_contributors"
    case rightsController = "rights_controller"
    case slug
    case stemOf = "stem_of"
    case stream
    case streamConditions = "stream_conditions"
    case tags
    case title
    case trackCid = "track_cid"
    case trackId = "track_id"
    case trackSegments = "track_segments"
    case updatedAt = "updated_at"
    case user
  }
}

public struct Access: Sendable, Codable, Equatable {
  public var download: Bool
  public var stream: Bool

  public init(download: Bool, stream: Bool) {
    self.download = download
    self.stream = stream
  }
}

public struct AccessGate: Sendable, Codable, Equatable {
  public var value: JSONValue

  public init(value: JSONValue) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    self.value = try JSONValue(from: decoder)
  }

  public func encode(to encoder: Encoder) throws {
    try value.encode(to: encoder)
  }
}

public struct AccessInfoResponse: Sendable, Codable, Equatable {
  public var data: TrackAccessInfo?

  public init(data: TrackAccessInfo? = nil) {
    self.data = data
  }
}

public struct Activity: Sendable, Codable, Equatable {
  public var classValue: String
  public var item: JSONValue
  public var itemType: String
  public var timestamp: String

  public init(classValue: String, item: JSONValue, itemType: String, timestamp: String) {
    self.classValue = classValue
    self.item = item
    self.itemType = itemType
    self.timestamp = timestamp
  }

  enum CodingKeys: String, CodingKey {
    case classValue = "class"
    case item
    case itemType = "item_type"
    case timestamp
  }
}

public struct AddManagerRequestBody: Sendable, Codable, Equatable {
  public var managerUserId: String

  public init(managerUserId: String) {
    self.managerUserId = managerUserId
  }

  enum CodingKeys: String, CodingKey {
    case managerUserId = "manager_user_id"
  }
}

public struct AlbumBacklink: Sendable, Codable, Equatable {
  public var permalink: String
  public var playlistId: Int
  public var playlistName: String

  public init(permalink: String, playlistId: Int, playlistName: String) {
    self.permalink = permalink
    self.playlistId = playlistId
    self.playlistName = playlistName
  }

  enum CodingKeys: String, CodingKey {
    case permalink
    case playlistId = "playlist_id"
    case playlistName = "playlist_name"
  }
}

public struct AlbumsResponse: Sendable, Codable, Equatable {
  public var data: [Playlist]?

  public init(data: [Playlist]? = nil) {
    self.data = data
  }
}

public struct ApproveGrantRequestBody: Sendable, Codable, Equatable {
  public var grantorUserId: String

  public init(grantorUserId: String) {
    self.grantorUserId = grantorUserId
  }

  enum CodingKeys: String, CodingKey {
    case grantorUserId = "grantor_user_id"
  }
}

public struct AuthorizedApp: Sendable, Codable, Equatable {
  public var address: String
  public var description: String?
  public var grantCreatedAt: String
  public var grantUpdatedAt: String
  public var grantorUserId: String
  public var imageUrl: String?
  public var name: String

  public init(address: String, description: String? = nil, grantCreatedAt: String, grantUpdatedAt: String, grantorUserId: String, imageUrl: String? = nil, name: String) {
    self.address = address
    self.description = description
    self.grantCreatedAt = grantCreatedAt
    self.grantUpdatedAt = grantUpdatedAt
    self.grantorUserId = grantorUserId
    self.imageUrl = imageUrl
    self.name = name
  }

  enum CodingKeys: String, CodingKey {
    case address
    case description
    case grantCreatedAt = "grant_created_at"
    case grantUpdatedAt = "grant_updated_at"
    case grantorUserId = "grantor_user_id"
    case imageUrl = "image_url"
    case name
  }
}

public struct AuthorizedApps: Sendable, Codable, Equatable {
  public var data: [AuthorizedApp]?

  public init(data: [AuthorizedApp]? = nil) {
    self.data = data
  }
}

public struct BalanceHistoryDataPoint: Sendable, Codable, Equatable {
  public var balanceUsd: Double
  public var timestamp: Int

  public init(balanceUsd: Double, timestamp: Int) {
    self.balanceUsd = balanceUsd
    self.timestamp = timestamp
  }

  enum CodingKeys: String, CodingKey {
    case balanceUsd = "balance_usd"
    case timestamp
  }
}

public struct BalanceHistoryResponse: Sendable, Codable, Equatable {
  public var data: [BalanceHistoryDataPoint]

  public init(data: [BalanceHistoryDataPoint]) {
    self.data = data
  }
}

public struct BestSellingItem: Sendable, Codable, Equatable {
  public var contentId: String
  public var contentType: String?
  public var ownerId: String
  public var title: String

  public init(contentId: String, contentType: String? = nil, ownerId: String, title: String) {
    self.contentId = contentId
    self.contentType = contentType
    self.ownerId = ownerId
    self.title = title
  }

  enum CodingKeys: String, CodingKey {
    case contentId = "content_id"
    case contentType = "content_type"
    case ownerId = "owner_id"
    case title
  }
}

public struct BestSellingResponse: Sendable, Codable, Equatable {
  public var data: [BestSellingItem]?

  public init(data: [BestSellingItem]? = nil) {
    self.data = data
  }
}

public struct BlobInfo: Sendable, Codable, Equatable {
  public var contentType: String
  public var size: Int

  public init(contentType: String, size: Int) {
    self.contentType = contentType
    self.size = size
  }

  enum CodingKeys: String, CodingKey {
    case contentType = "content_type"
    case size
  }
}

public struct ChallengeResponse: Sendable, Codable, Equatable {
  public var amount: String
  public var challengeId: String
  public var challengeType: String
  public var cooldownDays: Int?
  public var currentStepCount: Int?
  public var disbursedAmount: Int
  public var isActive: Bool
  public var isComplete: Bool
  public var isDisbursed: Bool
  public var maxSteps: Int?
  public var metadata: JSONValue
  public var specifier: String?
  public var userId: String

  public init(amount: String, challengeId: String, challengeType: String, cooldownDays: Int? = nil, currentStepCount: Int? = nil, disbursedAmount: Int, isActive: Bool, isComplete: Bool, isDisbursed: Bool, maxSteps: Int? = nil, metadata: JSONValue, specifier: String? = nil, userId: String) {
    self.amount = amount
    self.challengeId = challengeId
    self.challengeType = challengeType
    self.cooldownDays = cooldownDays
    self.currentStepCount = currentStepCount
    self.disbursedAmount = disbursedAmount
    self.isActive = isActive
    self.isComplete = isComplete
    self.isDisbursed = isDisbursed
    self.maxSteps = maxSteps
    self.metadata = metadata
    self.specifier = specifier
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case amount
    case challengeId = "challenge_id"
    case challengeType = "challenge_type"
    case cooldownDays = "cooldown_days"
    case currentStepCount = "current_step_count"
    case disbursedAmount = "disbursed_amount"
    case isActive = "is_active"
    case isComplete = "is_complete"
    case isDisbursed = "is_disbursed"
    case maxSteps = "max_steps"
    case metadata
    case specifier
    case userId = "user_id"
  }
}

public struct ClaimRewardsRequestBody: Sendable, Codable, Equatable {
  public var challengeId: String?
  public var specifier: String?
  public var userId: String

  public init(challengeId: String? = nil, specifier: String? = nil, userId: String) {
    self.challengeId = challengeId
    self.specifier = specifier
    self.userId = userId
  }
}

public struct ClaimRewardsResponse: Sendable, Codable, Equatable {
  public var data: [JSONValue]

  public init(data: [JSONValue]) {
    self.data = data
  }
}

public struct ClaimedPrize: Sendable, Codable, Equatable {
  public var amount: Int
  public var createdAt: Date
  public var id: Int
  public var mint: String
  public var prizeId: String
  public var prizeName: String
  public var prizeType: String?
  public var signature: String
  public var wallet: String

  public init(amount: Int, createdAt: Date, id: Int, mint: String, prizeId: String, prizeName: String, prizeType: String? = nil, signature: String, wallet: String) {
    self.amount = amount
    self.createdAt = createdAt
    self.id = id
    self.mint = mint
    self.prizeId = prizeId
    self.prizeName = prizeName
    self.prizeType = prizeType
    self.signature = signature
    self.wallet = wallet
  }

  enum CodingKeys: String, CodingKey {
    case amount
    case createdAt = "created_at"
    case id
    case mint
    case prizeId = "prize_id"
    case prizeName = "prize_name"
    case prizeType = "prize_type"
    case signature
    case wallet
  }
}

public struct ClaimedPrizesResponse: Sendable, Codable, Equatable {
  public var data: [ClaimedPrize]

  public init(data: [ClaimedPrize]) {
    self.data = data
  }
}

public struct Coin: Sendable, Codable, Equatable {
  public var address: String?
  public var artistFees: JSONValue?
  public var artistLocker: JSONValue?
  public var bannerImageUrl: String?
  public var buy: Int
  public var buy24h: Int
  public var buy24hChangePercent: Double
  public var buyHistory24h: Int
  public var circulatingSupply: Double
  public var createdAt: String
  public var decimals: Int
  public var description: String?
  public var dynamicBondingCurve: JSONValue
  public var escrowRecipient: String?
  public var extensions: JSONValue?
  public var fdv: Double
  public var hasDiscord: Bool
  public var history24hPrice: Double
  public var holder: Int
  public var lastTradeHumanTime: String
  public var lastTradeUnixTime: Int
  public var link1: String?
  public var link2: String?
  public var link3: String?
  public var link4: String?
  public var liquidity: Double
  public var logoUri: String?
  public var marketCap: Double
  public var mint: String
  public var name: String
  public var numberMarkets: Int?
  public var ownerId: String
  public var price: Double
  public var priceChange24hPercent: Double
  public var rewardPool: JSONValue?
  public var sell: Int
  public var sell24h: Int
  public var sell24hChangePercent: Double
  public var sellHistory24h: Int
  public var symbol: String?
  public var ticker: String?
  public var totalSupply: Double
  public var totalTrade: Int
  public var totalVolume: Double
  public var totalVolumeUsd: Double
  public var trade24h: Int
  public var trade24hChangePercent: Double
  public var tradeHistory24h: Int
  public var uniqueWallet24h: Int
  public var uniqueWallet24hChangePercent: Double
  public var uniqueWalletHistory24h: Int
  public var v24h: Double
  public var v24hChangePercent: Double?
  public var v24hUsd: Double
  public var vBuy24h: Double?
  public var vBuy24hChangePercent: Double?
  public var vBuy24hUsd: Double?
  public var vBuyHistory24h: Double?
  public var vBuyHistory24hUsd: Double?
  public var vHistory24h: Double
  public var vHistory24hUsd: Double?
  public var vSell24h: Double?
  public var vSell24hChangePercent: Double?
  public var vSell24hUsd: Double?
  public var vSellHistory24h: Double?
  public var vSellHistory24hUsd: Double?
  public var volumeBuy: Double
  public var volumeBuyUsd: Double
  public var volumeSell: Double
  public var volumeSellUsd: Double
  public var website: String?

  public init(address: String? = nil, artistFees: JSONValue? = nil, artistLocker: JSONValue? = nil, bannerImageUrl: String? = nil, buy: Int, buy24h: Int, buy24hChangePercent: Double, buyHistory24h: Int, circulatingSupply: Double, createdAt: String, decimals: Int, description: String? = nil, dynamicBondingCurve: JSONValue, escrowRecipient: String? = nil, extensions: JSONValue? = nil, fdv: Double, hasDiscord: Bool, history24hPrice: Double, holder: Int, lastTradeHumanTime: String, lastTradeUnixTime: Int, link1: String? = nil, link2: String? = nil, link3: String? = nil, link4: String? = nil, liquidity: Double, logoUri: String? = nil, marketCap: Double, mint: String, name: String, numberMarkets: Int? = nil, ownerId: String, price: Double, priceChange24hPercent: Double, rewardPool: JSONValue? = nil, sell: Int, sell24h: Int, sell24hChangePercent: Double, sellHistory24h: Int, symbol: String? = nil, ticker: String? = nil, totalSupply: Double, totalTrade: Int, totalVolume: Double, totalVolumeUsd: Double, trade24h: Int, trade24hChangePercent: Double, tradeHistory24h: Int, uniqueWallet24h: Int, uniqueWallet24hChangePercent: Double, uniqueWalletHistory24h: Int, v24h: Double, v24hChangePercent: Double? = nil, v24hUsd: Double, vBuy24h: Double? = nil, vBuy24hChangePercent: Double? = nil, vBuy24hUsd: Double? = nil, vBuyHistory24h: Double? = nil, vBuyHistory24hUsd: Double? = nil, vHistory24h: Double, vHistory24hUsd: Double? = nil, vSell24h: Double? = nil, vSell24hChangePercent: Double? = nil, vSell24hUsd: Double? = nil, vSellHistory24h: Double? = nil, vSellHistory24hUsd: Double? = nil, volumeBuy: Double, volumeBuyUsd: Double, volumeSell: Double, volumeSellUsd: Double, website: String? = nil) {
    self.address = address
    self.artistFees = artistFees
    self.artistLocker = artistLocker
    self.bannerImageUrl = bannerImageUrl
    self.buy = buy
    self.buy24h = buy24h
    self.buy24hChangePercent = buy24hChangePercent
    self.buyHistory24h = buyHistory24h
    self.circulatingSupply = circulatingSupply
    self.createdAt = createdAt
    self.decimals = decimals
    self.description = description
    self.dynamicBondingCurve = dynamicBondingCurve
    self.escrowRecipient = escrowRecipient
    self.extensions = extensions
    self.fdv = fdv
    self.hasDiscord = hasDiscord
    self.history24hPrice = history24hPrice
    self.holder = holder
    self.lastTradeHumanTime = lastTradeHumanTime
    self.lastTradeUnixTime = lastTradeUnixTime
    self.link1 = link1
    self.link2 = link2
    self.link3 = link3
    self.link4 = link4
    self.liquidity = liquidity
    self.logoUri = logoUri
    self.marketCap = marketCap
    self.mint = mint
    self.name = name
    self.numberMarkets = numberMarkets
    self.ownerId = ownerId
    self.price = price
    self.priceChange24hPercent = priceChange24hPercent
    self.rewardPool = rewardPool
    self.sell = sell
    self.sell24h = sell24h
    self.sell24hChangePercent = sell24hChangePercent
    self.sellHistory24h = sellHistory24h
    self.symbol = symbol
    self.ticker = ticker
    self.totalSupply = totalSupply
    self.totalTrade = totalTrade
    self.totalVolume = totalVolume
    self.totalVolumeUsd = totalVolumeUsd
    self.trade24h = trade24h
    self.trade24hChangePercent = trade24hChangePercent
    self.tradeHistory24h = tradeHistory24h
    self.uniqueWallet24h = uniqueWallet24h
    self.uniqueWallet24hChangePercent = uniqueWallet24hChangePercent
    self.uniqueWalletHistory24h = uniqueWalletHistory24h
    self.v24h = v24h
    self.v24hChangePercent = v24hChangePercent
    self.v24hUsd = v24hUsd
    self.vBuy24h = vBuy24h
    self.vBuy24hChangePercent = vBuy24hChangePercent
    self.vBuy24hUsd = vBuy24hUsd
    self.vBuyHistory24h = vBuyHistory24h
    self.vBuyHistory24hUsd = vBuyHistory24hUsd
    self.vHistory24h = vHistory24h
    self.vHistory24hUsd = vHistory24hUsd
    self.vSell24h = vSell24h
    self.vSell24hChangePercent = vSell24hChangePercent
    self.vSell24hUsd = vSell24hUsd
    self.vSellHistory24h = vSellHistory24h
    self.vSellHistory24hUsd = vSellHistory24hUsd
    self.volumeBuy = volumeBuy
    self.volumeBuyUsd = volumeBuyUsd
    self.volumeSell = volumeSell
    self.volumeSellUsd = volumeSellUsd
    self.website = website
  }

  enum CodingKeys: String, CodingKey {
    case address
    case artistFees = "artist_fees"
    case artistLocker = "artist_locker"
    case bannerImageUrl = "banner_image_url"
    case buy
    case buy24h
    case buy24hChangePercent
    case buyHistory24h
    case circulatingSupply
    case createdAt = "created_at"
    case decimals
    case description
    case dynamicBondingCurve
    case escrowRecipient = "escrow_recipient"
    case extensions
    case fdv
    case hasDiscord = "has_discord"
    case history24hPrice
    case holder
    case lastTradeHumanTime
    case lastTradeUnixTime
    case link1 = "link_1"
    case link2 = "link_2"
    case link3 = "link_3"
    case link4 = "link_4"
    case liquidity
    case logoUri = "logo_uri"
    case marketCap
    case mint
    case name
    case numberMarkets
    case ownerId = "owner_id"
    case price
    case priceChange24hPercent
    case rewardPool = "reward_pool"
    case sell
    case sell24h
    case sell24hChangePercent
    case sellHistory24h
    case symbol
    case ticker
    case totalSupply
    case totalTrade
    case totalVolume
    case totalVolumeUsd = "totalVolumeUSD"
    case trade24h
    case trade24hChangePercent
    case tradeHistory24h
    case uniqueWallet24h
    case uniqueWallet24hChangePercent
    case uniqueWalletHistory24h
    case v24h
    case v24hChangePercent
    case v24hUsd = "v24hUSD"
    case vBuy24h
    case vBuy24hChangePercent
    case vBuy24hUsd = "vBuy24hUSD"
    case vBuyHistory24h
    case vBuyHistory24hUsd = "vBuyHistory24hUSD"
    case vHistory24h
    case vHistory24hUsd = "vHistory24hUSD"
    case vSell24h
    case vSell24hChangePercent
    case vSell24hUsd = "vSell24hUSD"
    case vSellHistory24h
    case vSellHistory24hUsd = "vSellHistory24hUSD"
    case volumeBuy
    case volumeBuyUsd = "volumeBuyUSD"
    case volumeSell
    case volumeSellUsd = "volumeSellUSD"
    case website
  }
}

public struct CoinInsights: Sendable, Codable, Equatable {
  public var address: String?
  public var buy: Int
  public var buy24h: Int
  public var buy24hChangePercent: Double
  public var buyHistory24h: Int
  public var circulatingSupply: Double
  public var decimals: Int?
  public var dynamicBondingCurve: JSONValue
  public var extensions: JSONValue?
  public var fdv: Double
  public var history24hPrice: Double
  public var holder: Int
  public var lastTradeHumanTime: String
  public var lastTradeUnixTime: Int
  public var liquidity: Double
  public var marketCap: Double
  public var name: String?
  public var numberMarkets: Int?
  public var price: Double
  public var priceChange24hPercent: Double
  public var sell: Int
  public var sell24h: Int
  public var sell24hChangePercent: Double
  public var sellHistory24h: Int
  public var symbol: String?
  public var totalSupply: Double
  public var totalTrade: Int
  public var totalVolume: Double
  public var totalVolumeUsd: Double
  public var trade24h: Int
  public var trade24hChangePercent: Double
  public var tradeHistory24h: Int
  public var uniqueWallet24h: Int
  public var uniqueWallet24hChangePercent: Double
  public var uniqueWalletHistory24h: Int
  public var v24h: Double
  public var v24hChangePercent: Double?
  public var v24hUsd: Double
  public var vBuy24h: Double?
  public var vBuy24hChangePercent: Double?
  public var vBuy24hUsd: Double?
  public var vBuyHistory24h: Double?
  public var vBuyHistory24hUsd: Double?
  public var vHistory24h: Double
  public var vHistory24hUsd: Double?
  public var vSell24h: Double?
  public var vSell24hChangePercent: Double?
  public var vSell24hUsd: Double?
  public var vSellHistory24h: Double?
  public var vSellHistory24hUsd: Double?
  public var volumeBuy: Double
  public var volumeBuyUsd: Double
  public var volumeSell: Double
  public var volumeSellUsd: Double

  public init(address: String? = nil, buy: Int, buy24h: Int, buy24hChangePercent: Double, buyHistory24h: Int, circulatingSupply: Double, decimals: Int? = nil, dynamicBondingCurve: JSONValue, extensions: JSONValue? = nil, fdv: Double, history24hPrice: Double, holder: Int, lastTradeHumanTime: String, lastTradeUnixTime: Int, liquidity: Double, marketCap: Double, name: String? = nil, numberMarkets: Int? = nil, price: Double, priceChange24hPercent: Double, sell: Int, sell24h: Int, sell24hChangePercent: Double, sellHistory24h: Int, symbol: String? = nil, totalSupply: Double, totalTrade: Int, totalVolume: Double, totalVolumeUsd: Double, trade24h: Int, trade24hChangePercent: Double, tradeHistory24h: Int, uniqueWallet24h: Int, uniqueWallet24hChangePercent: Double, uniqueWalletHistory24h: Int, v24h: Double, v24hChangePercent: Double? = nil, v24hUsd: Double, vBuy24h: Double? = nil, vBuy24hChangePercent: Double? = nil, vBuy24hUsd: Double? = nil, vBuyHistory24h: Double? = nil, vBuyHistory24hUsd: Double? = nil, vHistory24h: Double, vHistory24hUsd: Double? = nil, vSell24h: Double? = nil, vSell24hChangePercent: Double? = nil, vSell24hUsd: Double? = nil, vSellHistory24h: Double? = nil, vSellHistory24hUsd: Double? = nil, volumeBuy: Double, volumeBuyUsd: Double, volumeSell: Double, volumeSellUsd: Double) {
    self.address = address
    self.buy = buy
    self.buy24h = buy24h
    self.buy24hChangePercent = buy24hChangePercent
    self.buyHistory24h = buyHistory24h
    self.circulatingSupply = circulatingSupply
    self.decimals = decimals
    self.dynamicBondingCurve = dynamicBondingCurve
    self.extensions = extensions
    self.fdv = fdv
    self.history24hPrice = history24hPrice
    self.holder = holder
    self.lastTradeHumanTime = lastTradeHumanTime
    self.lastTradeUnixTime = lastTradeUnixTime
    self.liquidity = liquidity
    self.marketCap = marketCap
    self.name = name
    self.numberMarkets = numberMarkets
    self.price = price
    self.priceChange24hPercent = priceChange24hPercent
    self.sell = sell
    self.sell24h = sell24h
    self.sell24hChangePercent = sell24hChangePercent
    self.sellHistory24h = sellHistory24h
    self.symbol = symbol
    self.totalSupply = totalSupply
    self.totalTrade = totalTrade
    self.totalVolume = totalVolume
    self.totalVolumeUsd = totalVolumeUsd
    self.trade24h = trade24h
    self.trade24hChangePercent = trade24hChangePercent
    self.tradeHistory24h = tradeHistory24h
    self.uniqueWallet24h = uniqueWallet24h
    self.uniqueWallet24hChangePercent = uniqueWallet24hChangePercent
    self.uniqueWalletHistory24h = uniqueWalletHistory24h
    self.v24h = v24h
    self.v24hChangePercent = v24hChangePercent
    self.v24hUsd = v24hUsd
    self.vBuy24h = vBuy24h
    self.vBuy24hChangePercent = vBuy24hChangePercent
    self.vBuy24hUsd = vBuy24hUsd
    self.vBuyHistory24h = vBuyHistory24h
    self.vBuyHistory24hUsd = vBuyHistory24hUsd
    self.vHistory24h = vHistory24h
    self.vHistory24hUsd = vHistory24hUsd
    self.vSell24h = vSell24h
    self.vSell24hChangePercent = vSell24hChangePercent
    self.vSell24hUsd = vSell24hUsd
    self.vSellHistory24h = vSellHistory24h
    self.vSellHistory24hUsd = vSellHistory24hUsd
    self.volumeBuy = volumeBuy
    self.volumeBuyUsd = volumeBuyUsd
    self.volumeSell = volumeSell
    self.volumeSellUsd = volumeSellUsd
  }

  enum CodingKeys: String, CodingKey {
    case address
    case buy
    case buy24h
    case buy24hChangePercent
    case buyHistory24h
    case circulatingSupply
    case decimals
    case dynamicBondingCurve
    case extensions
    case fdv
    case history24hPrice
    case holder
    case lastTradeHumanTime
    case lastTradeUnixTime
    case liquidity
    case marketCap
    case name
    case numberMarkets
    case price
    case priceChange24hPercent
    case sell
    case sell24h
    case sell24hChangePercent
    case sellHistory24h
    case symbol
    case totalSupply
    case totalTrade
    case totalVolume
    case totalVolumeUsd = "totalVolumeUSD"
    case trade24h
    case trade24hChangePercent
    case tradeHistory24h
    case uniqueWallet24h
    case uniqueWallet24hChangePercent
    case uniqueWalletHistory24h
    case v24h
    case v24hChangePercent
    case v24hUsd = "v24hUSD"
    case vBuy24h
    case vBuy24hChangePercent
    case vBuy24hUsd = "vBuy24hUSD"
    case vBuyHistory24h
    case vBuyHistory24hUsd = "vBuyHistory24hUSD"
    case vHistory24h
    case vHistory24hUsd = "vHistory24hUSD"
    case vSell24h
    case vSell24hChangePercent
    case vSell24hUsd = "vSell24hUSD"
    case vSellHistory24h
    case vSellHistory24hUsd = "vSellHistory24hUSD"
    case volumeBuy
    case volumeBuyUsd = "volumeBuyUSD"
    case volumeSell
    case volumeSellUsd = "volumeSellUSD"
  }
}

public struct CoinInsightsResponse: Sendable, Codable, Equatable {
  public var data: CoinInsights?

  public init(data: CoinInsights? = nil) {
    self.data = data
  }
}

public struct CoinMember: Sendable, Codable, Equatable {
  public var balance: Int
  public var userId: String

  public init(balance: Int, userId: String) {
    self.balance = balance
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case balance
    case userId = "user_id"
  }
}

public struct CoinMembersCountResponse: Sendable, Codable, Equatable {
  public var data: Int

  public init(data: Int) {
    self.data = data
  }
}

public struct CoinMembersResponse: Sendable, Codable, Equatable {
  public var data: [CoinMember]

  public init(data: [CoinMember]) {
    self.data = data
  }
}

public struct CoinResponse: Sendable, Codable, Equatable {
  public var data: Coin?

  public init(data: Coin? = nil) {
    self.data = data
  }
}

public struct CoinsResponse: Sendable, Codable, Equatable {
  public var data: [Coin]

  public init(data: [Coin]) {
    self.data = data
  }
}

public struct CoinsVolumeLeadersResponse: Sendable, Codable, Equatable {
  public var data: [JSONValue]

  public init(data: [JSONValue]) {
    self.data = data
  }
}

public struct Collectibles: Sendable, Codable, Equatable {
  public var data: JSONValue?

  public init(data: JSONValue? = nil) {
    self.data = data
  }
}

public struct CollectiblesResponse: Sendable, Codable, Equatable {
  public var data: Collectibles?

  public init(data: Collectibles? = nil) {
    self.data = data
  }
}

public struct CollectionActivity: Sendable, Codable, Equatable {
  public var value: JSONValue

  public init(value: JSONValue) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    self.value = try JSONValue(from: decoder)
  }

  public func encode(to encoder: Encoder) throws {
    try value.encode(to: encoder)
  }
}

public struct Comment: Sendable, Codable, Equatable {
  public var createdAt: String
  public var entityId: String
  public var entityType: CommentEntityType
  public var id: String
  public var isArtistReacted: Bool?
  public var isCurrentUserReacted: Bool?
  public var isEdited: Bool
  public var isMuted: Bool?
  public var isTombstone: Bool?
  public var mentions: [CommentMention]?
  public var message: String
  public var parentCommentId: Int?
  public var reactCount: Int
  public var replies: [ReplyComment]?
  public var replyCount: Int
  public var trackTimestampS: Int?
  public var updatedAt: String?
  public var userId: String?

  public init(createdAt: String, entityId: String, entityType: CommentEntityType, id: String, isArtistReacted: Bool? = nil, isCurrentUserReacted: Bool? = nil, isEdited: Bool, isMuted: Bool? = nil, isTombstone: Bool? = nil, mentions: [CommentMention]? = nil, message: String, parentCommentId: Int? = nil, reactCount: Int, replies: [ReplyComment]? = nil, replyCount: Int, trackTimestampS: Int? = nil, updatedAt: String? = nil, userId: String? = nil) {
    self.createdAt = createdAt
    self.entityId = entityId
    self.entityType = entityType
    self.id = id
    self.isArtistReacted = isArtistReacted
    self.isCurrentUserReacted = isCurrentUserReacted
    self.isEdited = isEdited
    self.isMuted = isMuted
    self.isTombstone = isTombstone
    self.mentions = mentions
    self.message = message
    self.parentCommentId = parentCommentId
    self.reactCount = reactCount
    self.replies = replies
    self.replyCount = replyCount
    self.trackTimestampS = trackTimestampS
    self.updatedAt = updatedAt
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case entityId = "entity_id"
    case entityType = "entity_type"
    case id
    case isArtistReacted = "is_artist_reacted"
    case isCurrentUserReacted = "is_current_user_reacted"
    case isEdited = "is_edited"
    case isMuted = "is_muted"
    case isTombstone = "is_tombstone"
    case mentions
    case message
    case parentCommentId = "parent_comment_id"
    case reactCount = "react_count"
    case replies
    case replyCount = "reply_count"
    case trackTimestampS = "track_timestamp_s"
    case updatedAt = "updated_at"
    case userId = "user_id"
  }
}

public enum CommentEntityType: String, Sendable, Codable, CaseIterable {
  case track = "Track"
}

public struct CommentMention: Sendable, Codable, Equatable {
  public var handle: String
  public var userId: Int

  public init(handle: String, userId: Int) {
    self.handle = handle
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case handle
    case userId = "user_id"
  }
}

public struct CommentNotificationSetting: Sendable, Codable, Equatable {
  public var isMuted: Bool

  public init(isMuted: Bool) {
    self.isMuted = isMuted
  }

  enum CodingKeys: String, CodingKey {
    case isMuted = "is_muted"
  }
}

public struct CommentRepliesResponse: Sendable, Codable, Equatable {
  public var data: [ReplyComment]?

  public init(data: [ReplyComment]? = nil) {
    self.data = data
  }
}

public struct CommentResponse: Sendable, Codable, Equatable {
  public var data: [Comment]?

  public init(data: [Comment]? = nil) {
    self.data = data
  }
}

public struct ConnectedWallets: Sendable, Codable, Equatable {
  public var ercWallets: [String]
  public var splWallets: [String]

  public init(ercWallets: [String], splWallets: [String]) {
    self.ercWallets = ercWallets
    self.splWallets = splWallets
  }

  enum CodingKeys: String, CodingKey {
    case ercWallets = "erc_wallets"
    case splWallets = "spl_wallets"
  }
}

public struct ConnectedWalletsResponse: Sendable, Codable, Equatable {
  public var data: ConnectedWallets?

  public init(data: ConnectedWallets? = nil) {
    self.data = data
  }
}

public struct CoverPhoto: Sendable, Codable, Equatable {
  public var value2000x: String?
  public var value640x: String?

  public init(value2000x: String? = nil, value640x: String? = nil) {
    self.value2000x = value2000x
    self.value640x = value640x
  }

  enum CodingKeys: String, CodingKey {
    case value2000x = "2000x"
    case value640x = "640x"
  }
}

public struct CreateAccessKeyResponse: Sendable, Codable, Equatable {
  public var apiAccessKey: String

  public init(apiAccessKey: String) {
    self.apiAccessKey = apiAccessKey
  }

  enum CodingKeys: String, CodingKey {
    case apiAccessKey = "api_access_key"
  }
}

public struct CreateCoinRequestBody: Sendable, Codable, Equatable {
  public var bannerImageUrl: String?
  public var decimals: Int
  public var description: String?
  public var link1: String?
  public var link2: String?
  public var link3: String?
  public var link4: String?
  public var logoUri: String?
  public var mint: String
  public var name: String
  public var ticker: String

  public init(bannerImageUrl: String? = nil, decimals: Int, description: String? = nil, link1: String? = nil, link2: String? = nil, link3: String? = nil, link4: String? = nil, logoUri: String? = nil, mint: String, name: String, ticker: String) {
    self.bannerImageUrl = bannerImageUrl
    self.decimals = decimals
    self.description = description
    self.link1 = link1
    self.link2 = link2
    self.link3 = link3
    self.link4 = link4
    self.logoUri = logoUri
    self.mint = mint
    self.name = name
    self.ticker = ticker
  }

  enum CodingKeys: String, CodingKey {
    case bannerImageUrl = "banner_image_url"
    case decimals
    case description
    case link1 = "link_1"
    case link2 = "link_2"
    case link3 = "link_3"
    case link4 = "link_4"
    case logoUri = "logo_uri"
    case mint
    case name
    case ticker
  }
}

public struct CreateCoinResponse: Sendable, Codable, Equatable {
  public var data: JSONValue?

  public init(data: JSONValue? = nil) {
    self.data = data
  }
}

public struct CreateCommentRequestBody: Sendable, Codable, Equatable {
  public var body: String
  public var commentId: Int?
  public var entityId: Int
  public var entityType: JSONValue
  public var mentions: [Int]?
  public var parentId: Int?
  public var trackTimestampS: Int?

  public init(body: String, commentId: Int? = nil, entityId: Int, entityType: JSONValue, mentions: [Int]? = nil, parentId: Int? = nil, trackTimestampS: Int? = nil) {
    self.body = body
    self.commentId = commentId
    self.entityId = entityId
    self.entityType = entityType
    self.mentions = mentions
    self.parentId = parentId
    self.trackTimestampS = trackTimestampS
  }
}

public struct CreateCommentResponse: Sendable, Codable, Equatable {
  public var commentId: String?
  public var success: Bool?
  public var transactionHash: String?

  public init(commentId: String? = nil, success: Bool? = nil, transactionHash: String? = nil) {
    self.commentId = commentId
    self.success = success
    self.transactionHash = transactionHash
  }

  enum CodingKeys: String, CodingKey {
    case commentId = "comment_id"
    case success
    case transactionHash = "transaction_hash"
  }
}

public struct CreateDeveloperAppRequestBody: Sendable, Codable, Equatable {
  public var description: String?
  public var imageUrl: String?
  public var name: String

  public init(description: String? = nil, imageUrl: String? = nil, name: String) {
    self.description = description
    self.imageUrl = imageUrl
    self.name = name
  }
}

public struct CreateDeveloperAppResponse: Sendable, Codable, Equatable {
  public var apiKey: String?
  public var apiSecret: String?
  public var bearerToken: String?
  public var transactionHash: String?

  public init(apiKey: String? = nil, apiSecret: String? = nil, bearerToken: String? = nil, transactionHash: String? = nil) {
    self.apiKey = apiKey
    self.apiSecret = apiSecret
    self.bearerToken = bearerToken
    self.transactionHash = transactionHash
  }

  enum CodingKeys: String, CodingKey {
    case apiKey = "api_key"
    case apiSecret = "api_secret"
    case bearerToken = "bearer_token"
    case transactionHash = "transaction_hash"
  }
}

public struct CreateGrantRequestBody: Sendable, Codable, Equatable {
  public var appApiKey: String

  public init(appApiKey: String) {
    self.appApiKey = appApiKey
  }

  enum CodingKeys: String, CodingKey {
    case appApiKey = "app_api_key"
  }
}

public struct CreatePlaylistRequestBody: Sendable, Codable, Equatable {
  public var coverArtCid: String?
  public var ddexApp: String?
  public var description: String?
  public var genre: Genre?
  public var isAlbum: Bool?
  public var isImageAutogenerated: Bool?
  public var isPrivate: Bool?
  public var license: String?
  public var mood: Mood?
  public var parentalWarningType: String?
  public var playlistContents: [PlaylistAddedTimestamp]?
  public var playlistId: Int?
  public var playlistName: String
  public var releaseDate: String?
  public var tags: String?
  public var upc: String?

  public init(coverArtCid: String? = nil, ddexApp: String? = nil, description: String? = nil, genre: Genre? = nil, isAlbum: Bool? = nil, isImageAutogenerated: Bool? = nil, isPrivate: Bool? = nil, license: String? = nil, mood: Mood? = nil, parentalWarningType: String? = nil, playlistContents: [PlaylistAddedTimestamp]? = nil, playlistId: Int? = nil, playlistName: String, releaseDate: String? = nil, tags: String? = nil, upc: String? = nil) {
    self.coverArtCid = coverArtCid
    self.ddexApp = ddexApp
    self.description = description
    self.genre = genre
    self.isAlbum = isAlbum
    self.isImageAutogenerated = isImageAutogenerated
    self.isPrivate = isPrivate
    self.license = license
    self.mood = mood
    self.parentalWarningType = parentalWarningType
    self.playlistContents = playlistContents
    self.playlistId = playlistId
    self.playlistName = playlistName
    self.releaseDate = releaseDate
    self.tags = tags
    self.upc = upc
  }

  enum CodingKeys: String, CodingKey {
    case coverArtCid = "cover_art_cid"
    case ddexApp = "ddex_app"
    case description
    case genre
    case isAlbum = "is_album"
    case isImageAutogenerated = "is_image_autogenerated"
    case isPrivate = "is_private"
    case license
    case mood
    case parentalWarningType = "parental_warning_type"
    case playlistContents = "playlist_contents"
    case playlistId = "playlist_id"
    case playlistName = "playlist_name"
    case releaseDate = "release_date"
    case tags
    case upc
  }
}

public struct CreatePlaylistResponse: Sendable, Codable, Equatable {
  public var playlistId: String?
  public var success: Bool?
  public var transactionHash: String?

  public init(playlistId: String? = nil, success: Bool? = nil, transactionHash: String? = nil) {
    self.playlistId = playlistId
    self.success = success
    self.transactionHash = transactionHash
  }

  enum CodingKeys: String, CodingKey {
    case playlistId = "playlist_id"
    case success
    case transactionHash = "transaction_hash"
  }
}

public struct CreateRewardCodeRequestBody: Sendable, Codable, Equatable {
  public var amount: Int
  public var mint: String
  public var signature: String

  public init(amount: Int, mint: String, signature: String) {
    self.amount = amount
    self.mint = mint
    self.signature = signature
  }
}

public struct CreateRewardCodeResponse: Sendable, Codable, Equatable {
  public var amount: Int
  public var code: String
  public var mint: String
  public var rewardAddress: String

  public init(amount: Int, code: String, mint: String, rewardAddress: String) {
    self.amount = amount
    self.code = code
    self.mint = mint
    self.rewardAddress = rewardAddress
  }

  enum CodingKeys: String, CodingKey {
    case amount
    case code
    case mint
    case rewardAddress = "reward_address"
  }
}

public struct CreateTrackRequestBody: Sendable, Codable, Equatable {
  public var bpm: Double?
  public var coverArtCid: String?
  public var coverArtSizes: String?
  public var ddexApp: String?
  public var description: String?
  public var downloadConditions: AccessGate?
  public var downloadable: Bool?
  public var duration: Double?
  public var fieldVisibility: FieldVisibility?
  public var genre: Genre
  public var isUnlisted: Bool?
  public var isrc: String?
  public var iswc: String?
  public var license: String?
  public var mood: Mood?
  public var musicalKey: String?
  public var origFileCid: String?
  public var origFilename: String?
  public var parentalWarningType: String?
  public var placementHosts: String?
  public var previewCid: String?
  public var previewStartSeconds: Double?
  public var releaseDate: String?
  public var remixOf: RemixParentWrite?
  public var stemOf: StemParent?
  public var streamConditions: AccessGate?
  public var tags: String?
  public var title: String
  public var trackCid: String
  public var trackId: Int?

  public init(bpm: Double? = nil, coverArtCid: String? = nil, coverArtSizes: String? = nil, ddexApp: String? = nil, description: String? = nil, downloadConditions: AccessGate? = nil, downloadable: Bool? = nil, duration: Double? = nil, fieldVisibility: FieldVisibility? = nil, genre: Genre, isUnlisted: Bool? = nil, isrc: String? = nil, iswc: String? = nil, license: String? = nil, mood: Mood? = nil, musicalKey: String? = nil, origFileCid: String? = nil, origFilename: String? = nil, parentalWarningType: String? = nil, placementHosts: String? = nil, previewCid: String? = nil, previewStartSeconds: Double? = nil, releaseDate: String? = nil, remixOf: RemixParentWrite? = nil, stemOf: StemParent? = nil, streamConditions: AccessGate? = nil, tags: String? = nil, title: String, trackCid: String, trackId: Int? = nil) {
    self.bpm = bpm
    self.coverArtCid = coverArtCid
    self.coverArtSizes = coverArtSizes
    self.ddexApp = ddexApp
    self.description = description
    self.downloadConditions = downloadConditions
    self.downloadable = downloadable
    self.duration = duration
    self.fieldVisibility = fieldVisibility
    self.genre = genre
    self.isUnlisted = isUnlisted
    self.isrc = isrc
    self.iswc = iswc
    self.license = license
    self.mood = mood
    self.musicalKey = musicalKey
    self.origFileCid = origFileCid
    self.origFilename = origFilename
    self.parentalWarningType = parentalWarningType
    self.placementHosts = placementHosts
    self.previewCid = previewCid
    self.previewStartSeconds = previewStartSeconds
    self.releaseDate = releaseDate
    self.remixOf = remixOf
    self.stemOf = stemOf
    self.streamConditions = streamConditions
    self.tags = tags
    self.title = title
    self.trackCid = trackCid
    self.trackId = trackId
  }

  enum CodingKeys: String, CodingKey {
    case bpm
    case coverArtCid = "cover_art_cid"
    case coverArtSizes = "cover_art_sizes"
    case ddexApp = "ddex_app"
    case description
    case downloadConditions = "download_conditions"
    case downloadable
    case duration
    case fieldVisibility = "field_visibility"
    case genre
    case isUnlisted = "is_unlisted"
    case isrc
    case iswc
    case license
    case mood
    case musicalKey = "musical_key"
    case origFileCid = "orig_file_cid"
    case origFilename = "orig_filename"
    case parentalWarningType = "parental_warning_type"
    case placementHosts = "placement_hosts"
    case previewCid = "preview_cid"
    case previewStartSeconds = "preview_start_seconds"
    case releaseDate = "release_date"
    case remixOf = "remix_of"
    case stemOf = "stem_of"
    case streamConditions = "stream_conditions"
    case tags
    case title
    case trackCid = "track_cid"
    case trackId = "track_id"
  }
}

public struct CreateTrackResponse: Sendable, Codable, Equatable {
  public var success: Bool?
  public var trackId: String?
  public var transactionHash: String?

  public init(success: Bool? = nil, trackId: String? = nil, transactionHash: String? = nil) {
    self.success = success
    self.trackId = trackId
    self.transactionHash = transactionHash
  }

  enum CodingKeys: String, CodingKey {
    case success
    case trackId = "track_id"
    case transactionHash = "transaction_hash"
  }
}

public struct CreateUserDeveloperAppRequestBody: Sendable, Codable, Equatable {
  public var name: String

  public init(name: String) {
    self.name = name
  }
}

public struct CreateUserDeveloperAppResponse: Sendable, Codable, Equatable {
  public var apiKey: String?
  public var apiSecret: String?
  public var bearerToken: String?
  public var transactionHash: String?

  public init(apiKey: String? = nil, apiSecret: String? = nil, bearerToken: String? = nil, transactionHash: String? = nil) {
    self.apiKey = apiKey
    self.apiSecret = apiSecret
    self.bearerToken = bearerToken
    self.transactionHash = transactionHash
  }

  enum CodingKeys: String, CodingKey {
    case apiKey = "api_key"
    case apiSecret = "api_secret"
    case bearerToken = "bearer_token"
    case transactionHash = "transaction_hash"
  }
}

public struct CreateUserRequestBody: Sendable, Codable, Equatable {
  public var allowAiAttribution: Bool?
  public var bio: String?
  public var coverPhoto: String?
  public var coverPhotoSizes: String?
  public var donation: String?
  public var events: JSONValue?
  public var handle: String
  public var instagramHandle: String?
  public var location: String?
  public var name: String?
  public var playlistLibrary: JSONValue?
  public var profilePicture: String?
  public var profilePictureSizes: String?
  public var profileType: String?
  public var splUsdcPayoutWallet: String?
  public var tiktokHandle: String?
  public var twitterHandle: String?
  public var userId: Int?
  public var wallet: String
  public var website: String?

  public init(allowAiAttribution: Bool? = nil, bio: String? = nil, coverPhoto: String? = nil, coverPhotoSizes: String? = nil, donation: String? = nil, events: JSONValue? = nil, handle: String, instagramHandle: String? = nil, location: String? = nil, name: String? = nil, playlistLibrary: JSONValue? = nil, profilePicture: String? = nil, profilePictureSizes: String? = nil, profileType: String? = nil, splUsdcPayoutWallet: String? = nil, tiktokHandle: String? = nil, twitterHandle: String? = nil, userId: Int? = nil, wallet: String, website: String? = nil) {
    self.allowAiAttribution = allowAiAttribution
    self.bio = bio
    self.coverPhoto = coverPhoto
    self.coverPhotoSizes = coverPhotoSizes
    self.donation = donation
    self.events = events
    self.handle = handle
    self.instagramHandle = instagramHandle
    self.location = location
    self.name = name
    self.playlistLibrary = playlistLibrary
    self.profilePicture = profilePicture
    self.profilePictureSizes = profilePictureSizes
    self.profileType = profileType
    self.splUsdcPayoutWallet = splUsdcPayoutWallet
    self.tiktokHandle = tiktokHandle
    self.twitterHandle = twitterHandle
    self.userId = userId
    self.wallet = wallet
    self.website = website
  }

  enum CodingKeys: String, CodingKey {
    case allowAiAttribution = "allow_ai_attribution"
    case bio
    case coverPhoto = "cover_photo"
    case coverPhotoSizes = "cover_photo_sizes"
    case donation
    case events
    case handle
    case instagramHandle = "instagram_handle"
    case location
    case name
    case playlistLibrary = "playlist_library"
    case profilePicture = "profile_picture"
    case profilePictureSizes = "profile_picture_sizes"
    case profileType = "profile_type"
    case splUsdcPayoutWallet = "spl_usdc_payout_wallet"
    case tiktokHandle = "tiktok_handle"
    case twitterHandle = "twitter_handle"
    case userId = "user_id"
    case wallet
    case website
  }
}

public struct CreateUserResponse: Sendable, Codable, Equatable {
  public var success: Bool?
  public var transactionHash: String?
  public var userId: String?

  public init(success: Bool? = nil, transactionHash: String? = nil, userId: String? = nil) {
    self.success = success
    self.transactionHash = transactionHash
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case success
    case transactionHash = "transaction_hash"
    case userId = "user_id"
  }
}

public struct DashboardWalletUser: Sendable, Codable, Equatable {
  public var user: User
  public var wallet: String

  public init(user: User, wallet: String) {
    self.user = user
    self.wallet = wallet
  }
}

public struct DashboardWalletUsersResponse: Sendable, Codable, Equatable {
  public var data: [DashboardWalletUser]?

  public init(data: [DashboardWalletUser]? = nil) {
    self.data = data
  }
}

public struct DeactivateAccessKeyRequestBody: Sendable, Codable, Equatable {
  public var apiAccessKey: String

  public init(apiAccessKey: String) {
    self.apiAccessKey = apiAccessKey
  }

  enum CodingKeys: String, CodingKey {
    case apiAccessKey = "api_access_key"
  }
}

public struct DeactivateAccessKeyResponse: Sendable, Codable, Equatable {
  public var success: Bool?

  public init(success: Bool? = nil) {
    self.success = success
  }
}

public struct DecodedUserToken: Sendable, Codable, Equatable {
  public var apiKey: String
  public var email: String
  public var handle: String
  public var iat: String
  public var name: String
  public var profilePicture: ProfilePicture?
  public var sub: String
  public var userId: String
  public var verified: Bool

  public init(apiKey: String, email: String, handle: String, iat: String, name: String, profilePicture: ProfilePicture? = nil, sub: String, userId: String, verified: Bool) {
    self.apiKey = apiKey
    self.email = email
    self.handle = handle
    self.iat = iat
    self.name = name
    self.profilePicture = profilePicture
    self.sub = sub
    self.userId = userId
    self.verified = verified
  }
}

public struct DeveloperApp: Sendable, Codable, Equatable {
  public var address: String
  public var description: String?
  public var imageUrl: String?
  public var name: String
  public var userId: String

  public init(address: String, description: String? = nil, imageUrl: String? = nil, name: String, userId: String) {
    self.address = address
    self.description = description
    self.imageUrl = imageUrl
    self.name = name
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case address
    case description
    case imageUrl = "image_url"
    case name
    case userId = "user_id"
  }
}

public struct DeveloperAppResponse: Sendable, Codable, Equatable {
  public var data: DeveloperApp?

  public init(data: DeveloperApp? = nil) {
    self.data = data
  }
}

public struct DeveloperAppsResponse: Sendable, Codable, Equatable {
  public var data: [DeveloperApp]?

  public init(data: [DeveloperApp]? = nil) {
    self.data = data
  }
}

public struct EmailAccess: Sendable, Codable, Equatable {
  public var createdAt: String
  public var emailOwnerUserId: Int
  public var encryptedKey: String
  public var grantorUserId: Int
  public var id: Int
  public var isInitial: Bool
  public var receivingUserId: Int
  public var updatedAt: String

  public init(createdAt: String, emailOwnerUserId: Int, encryptedKey: String, grantorUserId: Int, id: Int, isInitial: Bool, receivingUserId: Int, updatedAt: String) {
    self.createdAt = createdAt
    self.emailOwnerUserId = emailOwnerUserId
    self.encryptedKey = encryptedKey
    self.grantorUserId = grantorUserId
    self.id = id
    self.isInitial = isInitial
    self.receivingUserId = receivingUserId
    self.updatedAt = updatedAt
  }

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case emailOwnerUserId = "email_owner_user_id"
    case encryptedKey = "encrypted_key"
    case grantorUserId = "grantor_user_id"
    case id
    case isInitial = "is_initial"
    case receivingUserId = "receiving_user_id"
    case updatedAt = "updated_at"
  }
}

public struct EmailAccessResponse: Sendable, Codable, Equatable {
  public var data: EmailAccess?

  public init(data: EmailAccess? = nil) {
    self.data = data
  }
}

public struct Event: Sendable, Codable, Equatable {
  public var createdAt: String
  public var endDate: String?
  public var entityId: String?
  public var entityType: String?
  public var eventData: JSONValue
  public var eventId: String
  public var eventType: String
  public var isDeleted: Bool?
  public var updatedAt: String
  public var userId: String

  public init(createdAt: String, endDate: String? = nil, entityId: String? = nil, entityType: String? = nil, eventData: JSONValue, eventId: String, eventType: String, isDeleted: Bool? = nil, updatedAt: String, userId: String) {
    self.createdAt = createdAt
    self.endDate = endDate
    self.entityId = entityId
    self.entityType = entityType
    self.eventData = eventData
    self.eventId = eventId
    self.eventType = eventType
    self.isDeleted = isDeleted
    self.updatedAt = updatedAt
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case endDate = "end_date"
    case entityId = "entity_id"
    case entityType = "entity_type"
    case eventData = "event_data"
    case eventId = "event_id"
    case eventType = "event_type"
    case isDeleted = "is_deleted"
    case updatedAt = "updated_at"
    case userId = "user_id"
  }
}

public struct EventsResponse: Sendable, Codable, Equatable {
  public var data: [Event]?

  public init(data: [Event]? = nil) {
    self.data = data
  }
}

public struct ExtendedAccessGate: Sendable, Codable, Equatable {
  public var value: JSONValue

  public init(value: JSONValue) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    self.value = try JSONValue(from: decoder)
  }

  public func encode(to encoder: Encoder) throws {
    try value.encode(to: encoder)
  }
}

public struct ExtendedPaymentSplit: Sendable, Codable, Equatable {
  public var amount: Int
  public var ethWallet: String?
  public var payoutWallet: String
  public var percentage: Double
  public var userId: Int?

  public init(amount: Int, ethWallet: String? = nil, payoutWallet: String, percentage: Double, userId: Int? = nil) {
    self.amount = amount
    self.ethWallet = ethWallet
    self.payoutWallet = payoutWallet
    self.percentage = percentage
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case amount
    case ethWallet = "eth_wallet"
    case payoutWallet = "payout_wallet"
    case percentage
    case userId = "user_id"
  }
}

public struct ExtendedPurchaseGate: Sendable, Codable, Equatable {
  public var usdcPurchase: JSONValue

  public init(usdcPurchase: JSONValue) {
    self.usdcPurchase = usdcPurchase
  }

  enum CodingKeys: String, CodingKey {
    case usdcPurchase = "usdc_purchase"
  }
}

public struct ExtendedTokenGate: Sendable, Codable, Equatable {
  public var tokenAmount: Int
  public var tokenMint: String

  public init(tokenAmount: Int, tokenMint: String) {
    self.tokenAmount = tokenAmount
    self.tokenMint = tokenMint
  }

  enum CodingKeys: String, CodingKey {
    case tokenAmount = "token_amount"
    case tokenMint = "token_mint"
  }
}

public struct ExtendedUsdcGate: Sendable, Codable, Equatable {
  public var price: Int
  public var splits: [ExtendedPaymentSplit]

  public init(price: Int, splits: [ExtendedPaymentSplit]) {
    self.price = price
    self.splits = splits
  }
}

public struct Favorite: Sendable, Codable, Equatable {
  public var createdAt: String
  public var favoriteItemId: String
  public var favoriteType: String
  public var userId: String

  public init(createdAt: String, favoriteItemId: String, favoriteType: String, userId: String) {
    self.createdAt = createdAt
    self.favoriteItemId = favoriteItemId
    self.favoriteType = favoriteType
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case favoriteItemId = "favorite_item_id"
    case favoriteType = "favorite_type"
    case userId = "user_id"
  }
}

public struct FavoritesResponse: Sendable, Codable, Equatable {
  public var data: [Favorite]?

  public init(data: [Favorite]? = nil) {
    self.data = data
  }
}

public struct FieldVisibility: Sendable, Codable, Equatable {
  public var genre: Bool?
  public var mood: Bool?
  public var playCount: Bool?
  public var remixes: Bool?
  public var share: Bool?
  public var tags: Bool?

  public init(genre: Bool? = nil, mood: Bool? = nil, playCount: Bool? = nil, remixes: Bool? = nil, share: Bool? = nil, tags: Bool? = nil) {
    self.genre = genre
    self.mood = mood
    self.playCount = playCount
    self.remixes = remixes
    self.share = share
    self.tags = tags
  }

  enum CodingKeys: String, CodingKey {
    case genre
    case mood
    case playCount = "play_count"
    case remixes
    case share
    case tags
  }
}

public struct FollowGate: Sendable, Codable, Equatable {
  public var followUserId: Int

  public init(followUserId: Int) {
    self.followUserId = followUserId
  }

  enum CodingKeys: String, CodingKey {
    case followUserId = "follow_user_id"
  }
}

public struct FollowersResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct FollowingResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public enum Genre: String, Sendable, Codable, CaseIterable {
  case electronic = "Electronic"
  case rock = "Rock"
  case metal = "Metal"
  case alternative = "Alternative"
  case hipHopRap = "Hip-Hop/Rap"
  case experimental = "Experimental"
  case punk = "Punk"
  case folk = "Folk"
  case pop = "Pop"
  case ambient = "Ambient"
  case soundtrack = "Soundtrack"
  case world = "World"
  case jazz = "Jazz"
  case acoustic = "Acoustic"
  case funk = "Funk"
  case rBSoul = "R&B/Soul"
  case devotional = "Devotional"
  case classical = "Classical"
  case reggae = "Reggae"
  case podcasts = "Podcasts"
  case country = "Country"
  case spokenWord = "Spoken Word"
  case comedy = "Comedy"
  case blues = "Blues"
  case kids = "Kids"
  case audiobooks = "Audiobooks"
  case latin = "Latin"
  case loFi = "Lo-Fi"
  case hyperpop = "Hyperpop"
  case dancehall = "Dancehall"
  case techno = "Techno"
  case trap = "Trap"
  case house = "House"
  case techHouse = "Tech House"
  case deepHouse = "Deep House"
  case disco = "Disco"
  case electro = "Electro"
  case jungle = "Jungle"
  case progressiveHouse = "Progressive House"
  case hardstyle = "Hardstyle"
  case glitchHop = "Glitch Hop"
  case trance = "Trance"
  case futureBass = "Future Bass"
  case futureHouse = "Future House"
  case tropicalHouse = "Tropical House"
  case downtempo = "Downtempo"
  case drumBass = "Drum & Bass"
  case dubstep = "Dubstep"
  case jerseyClub = "Jersey Club"
  case vaporwave = "Vaporwave"
  case moombahton = "Moombahton"
}

public struct GetChallenges: Sendable, Codable, Equatable {
  public var data: [ChallengeResponse]?

  public init(data: [ChallengeResponse]? = nil) {
    self.data = data
  }
}

public struct GetSupportedUsers: Sendable, Codable, Equatable {
  public var data: [Supporting]?

  public init(data: [Supporting]? = nil) {
    self.data = data
  }
}

public struct GetSupporters: Sendable, Codable, Equatable {
  public var data: [Supporter]?

  public init(data: [Supporter]? = nil) {
    self.data = data
  }
}

public struct GetTipsResponse: Sendable, Codable, Equatable {
  public var data: [Tip]?

  public init(data: [Tip]? = nil) {
    self.data = data
  }
}

public struct HistoryResponse: Sendable, Codable, Equatable {
  public var data: [TrackActivity]?

  public init(data: [TrackActivity]? = nil) {
    self.data = data
  }
}

public struct ListenCount: Sendable, Codable, Equatable {
  public var date: String?
  public var listens: Int?
  public var trackId: Int?

  public init(date: String? = nil, listens: Int? = nil, trackId: Int? = nil) {
    self.date = date
    self.listens = listens
    self.trackId = trackId
  }
}

public struct MediaLink: Sendable, Codable, Equatable {
  public var mirrors: [String]?
  public var url: String?

  public init(mirrors: [String]? = nil, url: String? = nil) {
    self.mirrors = mirrors
    self.url = url
  }
}

public struct MonthlyAggregatePlay: Sendable, Codable, Equatable {
  public var listenCounts: [ListenCount]?
  public var totalListens: Int?
  public var trackIds: [Int]?

  public init(listenCounts: [ListenCount]? = nil, totalListens: Int? = nil, trackIds: [Int]? = nil) {
    self.listenCounts = listenCounts
    self.totalListens = totalListens
    self.trackIds = trackIds
  }
}

public enum Mood: String, Sendable, Codable, CaseIterable {
  case peaceful = "Peaceful"
  case romantic = "Romantic"
  case sentimental = "Sentimental"
  case tender = "Tender"
  case easygoing = "Easygoing"
  case yearning = "Yearning"
  case sophisticated = "Sophisticated"
  case sensual = "Sensual"
  case cool = "Cool"
  case gritty = "Gritty"
  case melancholy = "Melancholy"
  case serious = "Serious"
  case brooding = "Brooding"
  case fiery = "Fiery"
  case defiant = "Defiant"
  case aggressive = "Aggressive"
  case rowdy = "Rowdy"
  case excited = "Excited"
  case energizing = "Energizing"
  case empowering = "Empowering"
  case stirring = "Stirring"
  case upbeat = "Upbeat"
  case other = "Other"
}

public struct MutualFollowersResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct PinCommentRequestBody: Sendable, Codable, Equatable {
  public var entityId: Int
  public var entityType: JSONValue

  public init(entityId: Int, entityType: JSONValue) {
    self.entityId = entityId
    self.entityType = entityType
  }
}

public struct Playlist: Sendable, Codable, Equatable {
  public var access: Access
  public var addedTimestamps: [PlaylistAddedTimestamp]
  public var artists: [JSONValue]?
  public var artwork: PlaylistArtwork?
  public var blocknumber: Int
  public var copyrightLine: JSONValue?
  public var coverArt: String?
  public var coverArtCids: PlaylistArtwork?
  public var coverArtSizes: String?
  public var createdAt: String
  public var ddexApp: String?
  public var ddexReleaseIds: JSONValue?
  public var description: String?
  public var favoriteCount: Int
  public var followeeFavorites: [Favorite]
  public var followeeReposts: [Repost]
  public var hasCurrentUserReposted: Bool
  public var hasCurrentUserSaved: Bool
  public var id: String
  public var isAlbum: Bool
  public var isDelete: Bool
  public var isImageAutogenerated: Bool
  public var isPrivate: Bool
  public var isScheduledRelease: Bool
  public var isStreamGated: Bool
  public var parentalWarningType: String?
  public var permalink: String
  public var playlistContents: [PlaylistAddedTimestamp]
  public var playlistName: String
  public var producerCopyrightLine: JSONValue?
  public var releaseDate: String?
  public var repostCount: Int
  public var streamConditions: JSONValue?
  public var totalPlayCount: Int
  public var trackCount: Int
  public var tracks: [Track]?
  public var upc: String?
  public var updatedAt: String
  public var user: User
  public var userId: String

  public init(access: Access, addedTimestamps: [PlaylistAddedTimestamp], artists: [JSONValue]? = nil, artwork: PlaylistArtwork? = nil, blocknumber: Int, copyrightLine: JSONValue? = nil, coverArt: String? = nil, coverArtCids: PlaylistArtwork? = nil, coverArtSizes: String? = nil, createdAt: String, ddexApp: String? = nil, ddexReleaseIds: JSONValue? = nil, description: String? = nil, favoriteCount: Int, followeeFavorites: [Favorite], followeeReposts: [Repost], hasCurrentUserReposted: Bool, hasCurrentUserSaved: Bool, id: String, isAlbum: Bool, isDelete: Bool, isImageAutogenerated: Bool, isPrivate: Bool, isScheduledRelease: Bool, isStreamGated: Bool, parentalWarningType: String? = nil, permalink: String, playlistContents: [PlaylistAddedTimestamp], playlistName: String, producerCopyrightLine: JSONValue? = nil, releaseDate: String? = nil, repostCount: Int, streamConditions: JSONValue? = nil, totalPlayCount: Int, trackCount: Int, tracks: [Track]? = nil, upc: String? = nil, updatedAt: String, user: User, userId: String) {
    self.access = access
    self.addedTimestamps = addedTimestamps
    self.artists = artists
    self.artwork = artwork
    self.blocknumber = blocknumber
    self.copyrightLine = copyrightLine
    self.coverArt = coverArt
    self.coverArtCids = coverArtCids
    self.coverArtSizes = coverArtSizes
    self.createdAt = createdAt
    self.ddexApp = ddexApp
    self.ddexReleaseIds = ddexReleaseIds
    self.description = description
    self.favoriteCount = favoriteCount
    self.followeeFavorites = followeeFavorites
    self.followeeReposts = followeeReposts
    self.hasCurrentUserReposted = hasCurrentUserReposted
    self.hasCurrentUserSaved = hasCurrentUserSaved
    self.id = id
    self.isAlbum = isAlbum
    self.isDelete = isDelete
    self.isImageAutogenerated = isImageAutogenerated
    self.isPrivate = isPrivate
    self.isScheduledRelease = isScheduledRelease
    self.isStreamGated = isStreamGated
    self.parentalWarningType = parentalWarningType
    self.permalink = permalink
    self.playlistContents = playlistContents
    self.playlistName = playlistName
    self.producerCopyrightLine = producerCopyrightLine
    self.releaseDate = releaseDate
    self.repostCount = repostCount
    self.streamConditions = streamConditions
    self.totalPlayCount = totalPlayCount
    self.trackCount = trackCount
    self.tracks = tracks
    self.upc = upc
    self.updatedAt = updatedAt
    self.user = user
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case access
    case addedTimestamps = "added_timestamps"
    case artists
    case artwork
    case blocknumber
    case copyrightLine = "copyright_line"
    case coverArt = "cover_art"
    case coverArtCids = "cover_art_cids"
    case coverArtSizes = "cover_art_sizes"
    case createdAt = "created_at"
    case ddexApp = "ddex_app"
    case ddexReleaseIds = "ddex_release_ids"
    case description
    case favoriteCount = "favorite_count"
    case followeeFavorites = "followee_favorites"
    case followeeReposts = "followee_reposts"
    case hasCurrentUserReposted = "has_current_user_reposted"
    case hasCurrentUserSaved = "has_current_user_saved"
    case id
    case isAlbum = "is_album"
    case isDelete = "is_delete"
    case isImageAutogenerated = "is_image_autogenerated"
    case isPrivate = "is_private"
    case isScheduledRelease = "is_scheduled_release"
    case isStreamGated = "is_stream_gated"
    case parentalWarningType = "parental_warning_type"
    case permalink
    case playlistContents = "playlist_contents"
    case playlistName = "playlist_name"
    case producerCopyrightLine = "producer_copyright_line"
    case releaseDate = "release_date"
    case repostCount = "repost_count"
    case streamConditions = "stream_conditions"
    case totalPlayCount = "total_play_count"
    case trackCount = "track_count"
    case tracks
    case upc
    case updatedAt = "updated_at"
    case user
    case userId = "user_id"
  }
}

public struct PlaylistAddedTimestamp: Sendable, Codable, Equatable {
  public var metadataTimestamp: Int?
  public var timestamp: Int
  public var trackId: String

  public init(metadataTimestamp: Int? = nil, timestamp: Int, trackId: String) {
    self.metadataTimestamp = metadataTimestamp
    self.timestamp = timestamp
    self.trackId = trackId
  }

  enum CodingKeys: String, CodingKey {
    case metadataTimestamp = "metadata_timestamp"
    case timestamp
    case trackId = "track_id"
  }
}

public struct PlaylistArtwork: Sendable, Codable, Equatable {
  public var value1000x1000: String?
  public var value150x150: String?
  public var value480x480: String?

  public init(value1000x1000: String? = nil, value150x150: String? = nil, value480x480: String? = nil) {
    self.value1000x1000 = value1000x1000
    self.value150x150 = value150x150
    self.value480x480 = value480x480
  }

  enum CodingKeys: String, CodingKey {
    case value1000x1000 = "1000x1000"
    case value150x150 = "150x150"
    case value480x480 = "480x480"
  }
}

public struct PlaylistLibraryExplorePlaylistIdentifier: Sendable, Codable, Equatable {
  public var playlistId: String
  public var type: String

  public init(playlistId: String, type: String) {
    self.playlistId = playlistId
    self.type = type
  }

  enum CodingKeys: String, CodingKey {
    case playlistId = "playlist_id"
    case type
  }
}

public struct PlaylistLibraryFolder: Sendable, Codable, Equatable {
  public var contents: [JSONValue]
  public var id: String
  public var name: String
  public var type: String

  public init(contents: [JSONValue], id: String, name: String, type: String) {
    self.contents = contents
    self.id = id
    self.name = name
    self.type = type
  }
}

public struct PlaylistLibraryPlaylistIdentifier: Sendable, Codable, Equatable {
  public var playlistId: Int
  public var type: String

  public init(playlistId: Int, type: String) {
    self.playlistId = playlistId
    self.type = type
  }

  enum CodingKeys: String, CodingKey {
    case playlistId = "playlist_id"
    case type
  }
}

public struct PlaylistResponse: Sendable, Codable, Equatable {
  public var data: [Playlist]?

  public init(data: [Playlist]? = nil) {
    self.data = data
  }
}

public struct PlaylistSearchResult: Sendable, Codable, Equatable {
  public var data: [Playlist]?

  public init(data: [Playlist]? = nil) {
    self.data = data
  }
}

public struct PlaylistTracksResponse: Sendable, Codable, Equatable {
  public var data: [Track]?

  public init(data: [Track]? = nil) {
    self.data = data
  }
}

public struct PlaylistsResponse: Sendable, Codable, Equatable {
  public var data: [Playlist]?

  public init(data: [Playlist]? = nil) {
    self.data = data
  }
}

public struct PrizeClaimRequestBody: Sendable, Codable, Equatable {
  public var signature: String
  public var wallet: String

  public init(signature: String, wallet: String) {
    self.signature = signature
    self.wallet = wallet
  }
}

public struct PrizeClaimResponse: Sendable, Codable, Equatable {
  public var actionData: [String: JSONValue]?
  public var prizeId: String
  public var prizeName: String
  public var prizeType: String?
  public var wallet: String

  public init(actionData: [String: JSONValue]? = nil, prizeId: String, prizeName: String, prizeType: String? = nil, wallet: String) {
    self.actionData = actionData
    self.prizeId = prizeId
    self.prizeName = prizeName
    self.prizeType = prizeType
    self.wallet = wallet
  }

  enum CodingKeys: String, CodingKey {
    case actionData = "action_data"
    case prizeId = "prize_id"
    case prizeName = "prize_name"
    case prizeType = "prize_type"
    case wallet
  }
}

public struct PrizePublic: Sendable, Codable, Equatable {
  public var description: String?
  public var metadata: [String: JSONValue]?
  public var name: String
  public var prizeId: String
  public var weight: Int

  public init(description: String? = nil, metadata: [String: JSONValue]? = nil, name: String, prizeId: String, weight: Int) {
    self.description = description
    self.metadata = metadata
    self.name = name
    self.prizeId = prizeId
    self.weight = weight
  }

  enum CodingKeys: String, CodingKey {
    case description
    case metadata
    case name
    case prizeId = "prize_id"
    case weight
  }
}

public struct PrizesResponse: Sendable, Codable, Equatable {
  public var data: [PrizePublic]

  public init(data: [PrizePublic]) {
    self.data = data
  }
}

public struct ProfilePicture: Sendable, Codable, Equatable {
  public var value1000x1000: String?
  public var value150x150: String?
  public var value480x480: String?

  public init(value1000x1000: String? = nil, value150x150: String? = nil, value480x480: String? = nil) {
    self.value1000x1000 = value1000x1000
    self.value150x150 = value150x150
    self.value480x480 = value480x480
  }

  enum CodingKeys: String, CodingKey {
    case value1000x1000 = "1000x1000"
    case value150x150 = "150x150"
    case value480x480 = "480x480"
  }
}

public struct ProfilePictureModel: Sendable, Codable, Equatable {
  public var value1000x1000: String?
  public var value150x150: String?
  public var value480x480: String?

  public init(value1000x1000: String? = nil, value150x150: String? = nil, value480x480: String? = nil) {
    self.value1000x1000 = value1000x1000
    self.value150x150 = value150x150
    self.value480x480 = value480x480
  }

  enum CodingKeys: String, CodingKey {
    case value1000x1000 = "1000x1000"
    case value150x150 = "150x150"
    case value480x480 = "480x480"
  }
}

public struct PurchasersResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct ReactCommentRequestBody: Sendable, Codable, Equatable {
  public var entityId: Int
  public var entityType: JSONValue

  public init(entityId: Int, entityType: JSONValue) {
    self.entityId = entityId
    self.entityType = entityType
  }
}

public struct RedeemAmountResponse: Sendable, Codable, Equatable {
  public var amount: Int

  public init(amount: Int) {
    self.amount = amount
  }
}

public struct RelatedArtistResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct RemixParent: Sendable, Codable, Equatable {
  public var tracks: [TrackElement]?

  public init(tracks: [TrackElement]? = nil) {
    self.tracks = tracks
  }
}

public struct RemixParentWrite: Sendable, Codable, Equatable {
  public var tracks: [TrackElementWrite]

  public init(tracks: [TrackElementWrite]) {
    self.tracks = tracks
  }
}

public struct RemixedTrackAggregate: Sendable, Codable, Equatable {
  public var remixCount: Int
  public var title: String
  public var trackId: String

  public init(remixCount: Int, title: String, trackId: String) {
    self.remixCount = remixCount
    self.title = title
    self.trackId = trackId
  }

  enum CodingKeys: String, CodingKey {
    case remixCount = "remix_count"
    case title
    case trackId = "track_id"
  }
}

public struct RemixersResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct RemixesResponse: Sendable, Codable, Equatable {
  public var count: Int
  public var tracks: [Track]?

  public init(count: Int, tracks: [Track]? = nil) {
    self.count = count
    self.tracks = tracks
  }
}

public struct RemixingResponse: Sendable, Codable, Equatable {
  public var data: [Track]?

  public init(data: [Track]? = nil) {
    self.data = data
  }
}

public struct ReplyComment: Sendable, Codable, Equatable {
  public var createdAt: String
  public var entityId: String
  public var entityType: CommentEntityType
  public var id: String
  public var isArtistReacted: Bool?
  public var isCurrentUserReacted: Bool?
  public var isEdited: Bool
  public var mentions: [CommentMention]?
  public var message: String
  public var parentCommentId: Int?
  public var reactCount: Int
  public var trackTimestampS: Int?
  public var updatedAt: String?
  public var userId: String

  public init(createdAt: String, entityId: String, entityType: CommentEntityType, id: String, isArtistReacted: Bool? = nil, isCurrentUserReacted: Bool? = nil, isEdited: Bool, mentions: [CommentMention]? = nil, message: String, parentCommentId: Int? = nil, reactCount: Int, trackTimestampS: Int? = nil, updatedAt: String? = nil, userId: String) {
    self.createdAt = createdAt
    self.entityId = entityId
    self.entityType = entityType
    self.id = id
    self.isArtistReacted = isArtistReacted
    self.isCurrentUserReacted = isCurrentUserReacted
    self.isEdited = isEdited
    self.mentions = mentions
    self.message = message
    self.parentCommentId = parentCommentId
    self.reactCount = reactCount
    self.trackTimestampS = trackTimestampS
    self.updatedAt = updatedAt
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case entityId = "entity_id"
    case entityType = "entity_type"
    case id
    case isArtistReacted = "is_artist_reacted"
    case isCurrentUserReacted = "is_current_user_reacted"
    case isEdited = "is_edited"
    case mentions
    case message
    case parentCommentId = "parent_comment_id"
    case reactCount = "react_count"
    case trackTimestampS = "track_timestamp_s"
    case updatedAt = "updated_at"
    case userId = "user_id"
  }
}

public struct Repost: Sendable, Codable, Equatable {
  public var repostItemId: String
  public var repostType: String
  public var userId: String

  public init(repostItemId: String, repostType: String, userId: String) {
    self.repostItemId = repostItemId
    self.repostType = repostType
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case repostItemId = "repost_item_id"
    case repostType = "repost_type"
    case userId = "user_id"
  }
}

public struct Reposts: Sendable, Codable, Equatable {
  public var data: [Activity]?

  public init(data: [Activity]? = nil) {
    self.data = data
  }
}

public struct RewardCodeErrorResponse: Sendable, Codable, Equatable {
  public var error: String?

  public init(error: String? = nil) {
    self.error = error
  }
}

public struct RewardCodeResponse: Sendable, Codable, Equatable {
  public var amount: Int
  public var code: String

  public init(amount: Int, code: String) {
    self.amount = amount
    self.code = code
  }
}

public struct SaleJson: Sendable, Codable, Equatable {
  public var buyerUserId: Int?
  public var country: String?
  public var date: String?
  public var encryptedEmail: String?
  public var encryptedKey: String?
  public var isInitial: Bool?
  public var link: String?
  public var networkFee: Double?
  public var payExtra: Double?
  public var pubkeyBase64: String?
  public var purchasedBy: String?
  public var salePrice: Double?
  public var title: String?
  public var total: Double?

  public init(buyerUserId: Int? = nil, country: String? = nil, date: String? = nil, encryptedEmail: String? = nil, encryptedKey: String? = nil, isInitial: Bool? = nil, link: String? = nil, networkFee: Double? = nil, payExtra: Double? = nil, pubkeyBase64: String? = nil, purchasedBy: String? = nil, salePrice: Double? = nil, title: String? = nil, total: Double? = nil) {
    self.buyerUserId = buyerUserId
    self.country = country
    self.date = date
    self.encryptedEmail = encryptedEmail
    self.encryptedKey = encryptedKey
    self.isInitial = isInitial
    self.link = link
    self.networkFee = networkFee
    self.payExtra = payExtra
    self.pubkeyBase64 = pubkeyBase64
    self.purchasedBy = purchasedBy
    self.salePrice = salePrice
    self.title = title
    self.total = total
  }

  enum CodingKeys: String, CodingKey {
    case buyerUserId = "buyer_user_id"
    case country
    case date
    case encryptedEmail = "encrypted_email"
    case encryptedKey = "encrypted_key"
    case isInitial = "is_initial"
    case link
    case networkFee = "network_fee"
    case payExtra = "pay_extra"
    case pubkeyBase64 = "pubkey_base64"
    case purchasedBy = "purchased_by"
    case salePrice = "sale_price"
    case title
    case total
  }
}

public struct SalesAggregate: Sendable, Codable, Equatable {
  public var contentId: String
  public var contentType: String
  public var purchaseCount: Int

  public init(contentId: String, contentType: String, purchaseCount: Int) {
    self.contentId = contentId
    self.contentType = contentType
    self.purchaseCount = purchaseCount
  }

  enum CodingKeys: String, CodingKey {
    case contentId = "content_id"
    case contentType = "content_type"
    case purchaseCount = "purchase_count"
  }
}

public struct SalesAggregateResponse: Sendable, Codable, Equatable {
  public var data: [SalesAggregate]?

  public init(data: [SalesAggregate]? = nil) {
    self.data = data
  }
}

public struct SalesJsonContent: Sendable, Codable, Equatable {
  public var sales: [SaleJson]?

  public init(sales: [SaleJson]? = nil) {
    self.sales = sales
  }
}

public struct SalesJsonResponse: Sendable, Codable, Equatable {
  public var data: SalesJsonContent?

  public init(data: SalesJsonContent? = nil) {
    self.data = data
  }
}

public struct Stem: Sendable, Codable, Equatable {
  public var blocknumber: Int
  public var category: String
  public var cid: String
  public var id: String
  public var origFilename: String
  public var parentId: String
  public var userId: String

  public init(blocknumber: Int, category: String, cid: String, id: String, origFilename: String, parentId: String, userId: String) {
    self.blocknumber = blocknumber
    self.category = category
    self.cid = cid
    self.id = id
    self.origFilename = origFilename
    self.parentId = parentId
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case blocknumber
    case category
    case cid
    case id
    case origFilename = "orig_filename"
    case parentId = "parent_id"
    case userId = "user_id"
  }
}

public enum StemCategory: String, Sendable, Codable, CaseIterable {
  case instrumental = "INSTRUMENTAL"
  case leadVocals = "LEAD_VOCALS"
  case melodicLead = "MELODIC_LEAD"
  case pad = "PAD"
  case snare = "SNARE"
  case kick = "KICK"
  case hihat = "HIHAT"
  case percussion = "PERCUSSION"
  case sample = "SAMPLE"
  case backingVox = "BACKING_VOX"
  case bass = "BASS"
  case other = "OTHER"
}

public struct StemParent: Sendable, Codable, Equatable {
  public var category: StemCategory
  public var parentTrackId: Int

  public init(category: StemCategory, parentTrackId: Int) {
    self.category = category
    self.parentTrackId = parentTrackId
  }

  enum CodingKeys: String, CodingKey {
    case category
    case parentTrackId = "parent_track_id"
  }
}

public struct StemsResponse: Sendable, Codable, Equatable {
  public var data: [Stem]?

  public init(data: [Stem]? = nil) {
    self.data = data
  }
}

public struct StreamUrlResponse: Sendable, Codable, Equatable {
  public var data: String

  public init(data: String) {
    self.data = data
  }
}

public struct SubscribersResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct Supporter: Sendable, Codable, Equatable {
  public var amount: String
  public var rank: Int
  public var sender: User

  public init(amount: String, rank: Int, sender: User) {
    self.amount = amount
    self.rank = rank
    self.sender = sender
  }
}

public struct Supporting: Sendable, Codable, Equatable {
  public var amount: String
  public var rank: Int
  public var receiver: User

  public init(amount: String, rank: Int, receiver: User) {
    self.amount = amount
    self.rank = rank
    self.receiver = receiver
  }
}

public struct TagsResponse: Sendable, Codable, Equatable {
  public var data: [String]?

  public init(data: [String]? = nil) {
    self.data = data
  }
}

public struct Tip: Sendable, Codable, Equatable {
  public var amount: String
  public var createdAt: String
  public var receiver: User?
  public var sender: User?

  public init(amount: String, createdAt: String, receiver: User? = nil, sender: User? = nil) {
    self.amount = amount
    self.createdAt = createdAt
    self.receiver = receiver
    self.sender = sender
  }

  enum CodingKeys: String, CodingKey {
    case amount
    case createdAt = "created_at"
    case receiver
    case sender
  }
}

public struct TipGate: Sendable, Codable, Equatable {
  public var tipUserId: Int

  public init(tipUserId: Int) {
    self.tipUserId = tipUserId
  }

  enum CodingKeys: String, CodingKey {
    case tipUserId = "tip_user_id"
  }
}

public struct TokenGate: Sendable, Codable, Equatable {
  public var tokenGate: JSONValue

  public init(tokenGate: JSONValue) {
    self.tokenGate = tokenGate
  }

  enum CodingKeys: String, CodingKey {
    case tokenGate = "token_gate"
  }
}

public struct TopListener: Sendable, Codable, Equatable {
  public var count: Int?
  public var user: User?

  public init(count: Int? = nil, user: User? = nil) {
    self.count = count
    self.user = user
  }
}

public struct TrackAccessInfo: Sendable, Codable, Equatable {
  public var access: JSONValue?
  public var blocknumber: Int
  public var downloadConditions: JSONValue?
  public var isDownloadGated: Bool?
  public var isStreamGated: Bool?
  public var streamConditions: JSONValue?
  public var userId: String

  public init(access: JSONValue? = nil, blocknumber: Int, downloadConditions: JSONValue? = nil, isDownloadGated: Bool? = nil, isStreamGated: Bool? = nil, streamConditions: JSONValue? = nil, userId: String) {
    self.access = access
    self.blocknumber = blocknumber
    self.downloadConditions = downloadConditions
    self.isDownloadGated = isDownloadGated
    self.isStreamGated = isStreamGated
    self.streamConditions = streamConditions
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case access
    case blocknumber
    case downloadConditions = "download_conditions"
    case isDownloadGated = "is_download_gated"
    case isStreamGated = "is_stream_gated"
    case streamConditions = "stream_conditions"
    case userId = "user_id"
  }
}

public struct TrackActivity: Sendable, Codable, Equatable {
  public var value: JSONValue

  public init(value: JSONValue) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    self.value = try JSONValue(from: decoder)
  }

  public func encode(to encoder: Encoder) throws {
    try value.encode(to: encoder)
  }
}

public struct TrackArtwork: Sendable, Codable, Equatable {
  public var value1000x1000: String?
  public var value150x150: String?
  public var value480x480: String?

  public init(value1000x1000: String? = nil, value150x150: String? = nil, value480x480: String? = nil) {
    self.value1000x1000 = value1000x1000
    self.value150x150 = value150x150
    self.value480x480 = value480x480
  }

  enum CodingKeys: String, CodingKey {
    case value1000x1000 = "1000x1000"
    case value150x150 = "150x150"
    case value480x480 = "480x480"
  }
}

public struct TrackCommentCountResponse: Sendable, Codable, Equatable {
  public var data: Int?

  public init(data: Int? = nil) {
    self.data = data
  }
}

public struct TrackCommentNotificationResponse: Sendable, Codable, Equatable {
  public var data: CommentNotificationSetting?

  public init(data: CommentNotificationSetting? = nil) {
    self.data = data
  }
}

public struct TrackCommentsResponse: Sendable, Codable, Equatable {
  public var data: [Comment]?

  public init(data: [Comment]? = nil) {
    self.data = data
  }
}

public struct TrackDownloadRequestBody: Sendable, Codable, Equatable {
  public var city: String?
  public var country: String?
  public var region: String?

  public init(city: String? = nil, country: String? = nil, region: String? = nil) {
    self.city = city
    self.country = country
    self.region = region
  }
}

public struct TrackElement: Sendable, Codable, Equatable {
  public var parentTrackId: String

  public init(parentTrackId: String) {
    self.parentTrackId = parentTrackId
  }

  enum CodingKeys: String, CodingKey {
    case parentTrackId = "parent_track_id"
  }
}

public struct TrackElementWrite: Sendable, Codable, Equatable {
  public var parentTrackId: Int

  public init(parentTrackId: Int) {
    self.parentTrackId = parentTrackId
  }

  enum CodingKeys: String, CodingKey {
    case parentTrackId = "parent_track_id"
  }
}

public struct TrackFavoritesResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct TrackId: Sendable, Codable, Equatable {
  public var id: String

  public init(id: String) {
    self.id = id
  }
}

public struct TrackInspect: Sendable, Codable, Equatable {
  public var data: BlobInfo?

  public init(data: BlobInfo? = nil) {
    self.data = data
  }
}

public struct TrackInspectList: Sendable, Codable, Equatable {
  public var data: [BlobInfo]?

  public init(data: [BlobInfo]? = nil) {
    self.data = data
  }
}

public struct TrackRepostsResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct TrackResponse: Sendable, Codable, Equatable {
  public var data: Track?

  public init(data: Track? = nil) {
    self.data = data
  }
}

public struct TrackSearch: Sendable, Codable, Equatable {
  public var data: [Track]?

  public init(data: [Track]? = nil) {
    self.data = data
  }
}

public struct TracksCountResponse: Sendable, Codable, Equatable {
  public var data: Int?

  public init(data: Int? = nil) {
    self.data = data
  }
}

public struct TracksResponse: Sendable, Codable, Equatable {
  public var data: [Track]?

  public init(data: [Track]? = nil) {
    self.data = data
  }
}

public struct TrendingIdsResponse: Sendable, Codable, Equatable {
  public var data: TrendingTimesIds?

  public init(data: TrendingTimesIds? = nil) {
    self.data = data
  }
}

public struct TrendingPlaylistsResponse: Sendable, Codable, Equatable {
  public var data: [Playlist]?

  public init(data: [Playlist]? = nil) {
    self.data = data
  }
}

public struct TrendingTimesIds: Sendable, Codable, Equatable {
  public var month: [TrackId]?
  public var week: [TrackId]?
  public var year: [TrackId]?

  public init(month: [TrackId]? = nil, week: [TrackId]? = nil, year: [TrackId]? = nil) {
    self.month = month
    self.week = week
    self.year = year
  }
}

public struct UnclaimedIdResponse: Sendable, Codable, Equatable {
  public var data: String?

  public init(data: String? = nil) {
    self.data = data
  }
}

public struct UndisbursedChallenge: Sendable, Codable, Equatable {
  public var amount: String
  public var challengeId: String
  public var completedAt: String
  public var completedBlocknumber: Int
  public var cooldownDays: Int?
  public var createdAt: String
  public var handle: String
  public var specifier: String
  public var userId: String
  public var wallet: String

  public init(amount: String, challengeId: String, completedAt: String, completedBlocknumber: Int, cooldownDays: Int? = nil, createdAt: String, handle: String, specifier: String, userId: String, wallet: String) {
    self.amount = amount
    self.challengeId = challengeId
    self.completedAt = completedAt
    self.completedBlocknumber = completedBlocknumber
    self.cooldownDays = cooldownDays
    self.createdAt = createdAt
    self.handle = handle
    self.specifier = specifier
    self.userId = userId
    self.wallet = wallet
  }

  enum CodingKeys: String, CodingKey {
    case amount
    case challengeId = "challenge_id"
    case completedAt = "completed_at"
    case completedBlocknumber = "completed_blocknumber"
    case cooldownDays = "cooldown_days"
    case createdAt = "created_at"
    case handle
    case specifier
    case userId = "user_id"
    case wallet
  }
}

public struct UndisbursedChallenges: Sendable, Codable, Equatable {
  public var data: [UndisbursedChallenge]?

  public init(data: [UndisbursedChallenge]? = nil) {
    self.data = data
  }
}

public struct UpdateCoinRequestBody: Sendable, Codable, Equatable {
  public var bannerImageUrl: String?
  public var description: String?
  public var link1: String?
  public var link2: String?
  public var link3: String?
  public var link4: String?

  public init(bannerImageUrl: String? = nil, description: String? = nil, link1: String? = nil, link2: String? = nil, link3: String? = nil, link4: String? = nil) {
    self.bannerImageUrl = bannerImageUrl
    self.description = description
    self.link1 = link1
    self.link2 = link2
    self.link3 = link3
    self.link4 = link4
  }

  enum CodingKeys: String, CodingKey {
    case bannerImageUrl = "banner_image_url"
    case description
    case link1 = "link_1"
    case link2 = "link_2"
    case link3 = "link_3"
    case link4 = "link_4"
  }
}

public struct UpdateCoinResponse: Sendable, Codable, Equatable {
  public var success: Bool?

  public init(success: Bool? = nil) {
    self.success = success
  }
}

public struct UpdateCommentRequestBody: Sendable, Codable, Equatable {
  public var body: String
  public var entityId: Int
  public var entityType: JSONValue
  public var mentions: [Int]?

  public init(body: String, entityId: Int, entityType: JSONValue, mentions: [Int]? = nil) {
    self.body = body
    self.entityId = entityId
    self.entityType = entityType
    self.mentions = mentions
  }
}

public struct UpdateDeveloperAppRequestBody: Sendable, Codable, Equatable {
  public var description: String?
  public var imageUrl: String?
  public var name: String

  public init(description: String? = nil, imageUrl: String? = nil, name: String) {
    self.description = description
    self.imageUrl = imageUrl
    self.name = name
  }
}

public struct UpdatePlaylistRequestBody: Sendable, Codable, Equatable {
  public var coverArtCid: String?
  public var description: String?
  public var genre: Genre?
  public var isPrivate: Bool?
  public var license: String?
  public var mood: Mood?
  public var playlistContents: [PlaylistAddedTimestamp]?
  public var playlistName: String?
  public var releaseDate: String?
  public var tags: String?
  public var upc: String?

  public init(coverArtCid: String? = nil, description: String? = nil, genre: Genre? = nil, isPrivate: Bool? = nil, license: String? = nil, mood: Mood? = nil, playlistContents: [PlaylistAddedTimestamp]? = nil, playlistName: String? = nil, releaseDate: String? = nil, tags: String? = nil, upc: String? = nil) {
    self.coverArtCid = coverArtCid
    self.description = description
    self.genre = genre
    self.isPrivate = isPrivate
    self.license = license
    self.mood = mood
    self.playlistContents = playlistContents
    self.playlistName = playlistName
    self.releaseDate = releaseDate
    self.tags = tags
    self.upc = upc
  }

  enum CodingKeys: String, CodingKey {
    case coverArtCid = "cover_art_cid"
    case description
    case genre
    case isPrivate = "is_private"
    case license
    case mood
    case playlistContents = "playlist_contents"
    case playlistName = "playlist_name"
    case releaseDate = "release_date"
    case tags
    case upc
  }
}

public struct UpdateTrackRequestBody: Sendable, Codable, Equatable {
  public var bpm: Double?
  public var coverArtCid: String?
  public var coverArtSizes: String?
  public var ddexApp: String?
  public var description: String?
  public var downloadConditions: JSONValue?
  public var downloadable: Bool?
  public var duration: Double?
  public var fieldVisibility: FieldVisibility?
  public var genre: Genre?
  public var isUnlisted: Bool?
  public var isrc: String?
  public var iswc: String?
  public var license: String?
  public var mood: JSONValue?
  public var musicalKey: String?
  public var origFileCid: String?
  public var origFilename: String?
  public var parentalWarningType: String?
  public var placementHosts: String?
  public var previewCid: String?
  public var previewStartSeconds: Double?
  public var releaseDate: String?
  public var remixOf: RemixParentWrite?
  public var stemOf: StemParent?
  public var streamConditions: JSONValue?
  public var tags: String?
  public var title: String?
  public var trackCid: String?

  public init(bpm: Double? = nil, coverArtCid: String? = nil, coverArtSizes: String? = nil, ddexApp: String? = nil, description: String? = nil, downloadConditions: JSONValue? = nil, downloadable: Bool? = nil, duration: Double? = nil, fieldVisibility: FieldVisibility? = nil, genre: Genre? = nil, isUnlisted: Bool? = nil, isrc: String? = nil, iswc: String? = nil, license: String? = nil, mood: JSONValue? = nil, musicalKey: String? = nil, origFileCid: String? = nil, origFilename: String? = nil, parentalWarningType: String? = nil, placementHosts: String? = nil, previewCid: String? = nil, previewStartSeconds: Double? = nil, releaseDate: String? = nil, remixOf: RemixParentWrite? = nil, stemOf: StemParent? = nil, streamConditions: JSONValue? = nil, tags: String? = nil, title: String? = nil, trackCid: String? = nil) {
    self.bpm = bpm
    self.coverArtCid = coverArtCid
    self.coverArtSizes = coverArtSizes
    self.ddexApp = ddexApp
    self.description = description
    self.downloadConditions = downloadConditions
    self.downloadable = downloadable
    self.duration = duration
    self.fieldVisibility = fieldVisibility
    self.genre = genre
    self.isUnlisted = isUnlisted
    self.isrc = isrc
    self.iswc = iswc
    self.license = license
    self.mood = mood
    self.musicalKey = musicalKey
    self.origFileCid = origFileCid
    self.origFilename = origFilename
    self.parentalWarningType = parentalWarningType
    self.placementHosts = placementHosts
    self.previewCid = previewCid
    self.previewStartSeconds = previewStartSeconds
    self.releaseDate = releaseDate
    self.remixOf = remixOf
    self.stemOf = stemOf
    self.streamConditions = streamConditions
    self.tags = tags
    self.title = title
    self.trackCid = trackCid
  }

  enum CodingKeys: String, CodingKey {
    case bpm
    case coverArtCid = "cover_art_cid"
    case coverArtSizes = "cover_art_sizes"
    case ddexApp = "ddex_app"
    case description
    case downloadConditions = "download_conditions"
    case downloadable
    case duration
    case fieldVisibility = "field_visibility"
    case genre
    case isUnlisted = "is_unlisted"
    case isrc
    case iswc
    case license
    case mood
    case musicalKey = "musical_key"
    case origFileCid = "orig_file_cid"
    case origFilename = "orig_filename"
    case parentalWarningType = "parental_warning_type"
    case placementHosts = "placement_hosts"
    case previewCid = "preview_cid"
    case previewStartSeconds = "preview_start_seconds"
    case releaseDate = "release_date"
    case remixOf = "remix_of"
    case stemOf = "stem_of"
    case streamConditions = "stream_conditions"
    case tags
    case title
    case trackCid = "track_cid"
  }
}

public struct UpdateUserRequestBody: Sendable, Codable, Equatable {
  public var allowAiAttribution: Bool?
  public var artistPickTrackId: Int?
  public var bio: String?
  public var coinFlairMint: String?
  public var coverPhoto: String?
  public var coverPhotoSizes: String?
  public var donation: String?
  public var events: JSONValue?
  public var instagramHandle: String?
  public var isDeactivated: Bool?
  public var location: String?
  public var name: String?
  public var playlistLibrary: JSONValue?
  public var profilePicture: String?
  public var profilePictureSizes: String?
  public var profileType: String?
  public var splUsdcPayoutWallet: String?
  public var tiktokHandle: String?
  public var twitterHandle: String?
  public var website: String?

  public init(allowAiAttribution: Bool? = nil, artistPickTrackId: Int? = nil, bio: String? = nil, coinFlairMint: String? = nil, coverPhoto: String? = nil, coverPhotoSizes: String? = nil, donation: String? = nil, events: JSONValue? = nil, instagramHandle: String? = nil, isDeactivated: Bool? = nil, location: String? = nil, name: String? = nil, playlistLibrary: JSONValue? = nil, profilePicture: String? = nil, profilePictureSizes: String? = nil, profileType: String? = nil, splUsdcPayoutWallet: String? = nil, tiktokHandle: String? = nil, twitterHandle: String? = nil, website: String? = nil) {
    self.allowAiAttribution = allowAiAttribution
    self.artistPickTrackId = artistPickTrackId
    self.bio = bio
    self.coinFlairMint = coinFlairMint
    self.coverPhoto = coverPhoto
    self.coverPhotoSizes = coverPhotoSizes
    self.donation = donation
    self.events = events
    self.instagramHandle = instagramHandle
    self.isDeactivated = isDeactivated
    self.location = location
    self.name = name
    self.playlistLibrary = playlistLibrary
    self.profilePicture = profilePicture
    self.profilePictureSizes = profilePictureSizes
    self.profileType = profileType
    self.splUsdcPayoutWallet = splUsdcPayoutWallet
    self.tiktokHandle = tiktokHandle
    self.twitterHandle = twitterHandle
    self.website = website
  }

  enum CodingKeys: String, CodingKey {
    case allowAiAttribution = "allow_ai_attribution"
    case artistPickTrackId = "artist_pick_track_id"
    case bio
    case coinFlairMint = "coin_flair_mint"
    case coverPhoto = "cover_photo"
    case coverPhotoSizes = "cover_photo_sizes"
    case donation
    case events
    case instagramHandle = "instagram_handle"
    case isDeactivated = "is_deactivated"
    case location
    case name
    case playlistLibrary = "playlist_library"
    case profilePicture = "profile_picture"
    case profilePictureSizes = "profile_picture_sizes"
    case profileType = "profile_type"
    case splUsdcPayoutWallet = "spl_usdc_payout_wallet"
    case tiktokHandle = "tiktok_handle"
    case twitterHandle = "twitter_handle"
    case website
  }
}

public struct User: Sendable, Codable, Equatable {
  public var albumCount: Int
  public var allowAiAttribution: Bool?
  public var artistCoinBadge: JSONValue?
  public var artistPickTrackId: String?
  public var associatedSolWalletsBalance: String?
  public var associatedWalletsBalance: String?
  public var balance: String?
  public var bio: String?
  public var blocknumber: Int?
  public var coinFlairMint: String?
  public var coverPhoto: CoverPhoto?
  public var coverPhotoCids: JSONValue?
  public var coverPhotoLegacy: JSONValue?
  public var coverPhotoSizes: String?
  public var createdAt: Date?
  public var creatorNodeEndpoint: String?
  public var currentUserFolloweeFollowCount: Int?
  public var doesCurrentUserFollow: Bool?
  public var doesCurrentUserSubscribe: Bool?
  public var doesFollowCurrentUser: Bool?
  public var donation: String?
  public var ercWallet: String
  public var followeeCount: Int
  public var followerCount: Int
  public var handle: String
  public var handleLc: String?
  public var hasCollectibles: Bool?
  public var id: String
  public var instagramHandle: String?
  public var isAvailable: Bool
  public var isDeactivated: Bool
  public var isStorageV2: Bool?
  public var isVerified: Bool
  public var location: String?
  public var name: String
  public var payoutWallet: String?
  public var playlistCount: Int
  public var profilePicture: ProfilePictureModel?
  public var profilePictureCids: JSONValue?
  public var profilePictureLegacy: JSONValue?
  public var profilePictureSizes: String?
  public var profileType: String?
  public var repostCount: Int
  public var splUsdcPayoutWallet: String?
  public var splUsdcWallet: String?
  public var splWallet: String?
  public var supporterCount: Int
  public var supportingCount: Int
  public var tiktokHandle: String?
  public var totalAudioBalance: Int
  public var totalBalance: String?
  public var trackCount: Int
  public var twitterHandle: String?
  public var updatedAt: Date?
  public var userId: Int?
  public var verifiedWithInstagram: Bool
  public var verifiedWithTiktok: Bool
  public var verifiedWithTwitter: Bool
  public var wallet: String
  public var waudioBalance: String?
  public var website: String?

  public init(albumCount: Int, allowAiAttribution: Bool? = nil, artistCoinBadge: JSONValue? = nil, artistPickTrackId: String? = nil, associatedSolWalletsBalance: String? = nil, associatedWalletsBalance: String? = nil, balance: String? = nil, bio: String? = nil, blocknumber: Int? = nil, coinFlairMint: String? = nil, coverPhoto: CoverPhoto? = nil, coverPhotoCids: JSONValue? = nil, coverPhotoLegacy: JSONValue? = nil, coverPhotoSizes: String? = nil, createdAt: Date? = nil, creatorNodeEndpoint: String? = nil, currentUserFolloweeFollowCount: Int? = nil, doesCurrentUserFollow: Bool? = nil, doesCurrentUserSubscribe: Bool? = nil, doesFollowCurrentUser: Bool? = nil, donation: String? = nil, ercWallet: String, followeeCount: Int, followerCount: Int, handle: String, handleLc: String? = nil, hasCollectibles: Bool? = nil, id: String, instagramHandle: String? = nil, isAvailable: Bool, isDeactivated: Bool, isStorageV2: Bool? = nil, isVerified: Bool, location: String? = nil, name: String, payoutWallet: String? = nil, playlistCount: Int, profilePicture: ProfilePictureModel? = nil, profilePictureCids: JSONValue? = nil, profilePictureLegacy: JSONValue? = nil, profilePictureSizes: String? = nil, profileType: String? = nil, repostCount: Int, splUsdcPayoutWallet: String? = nil, splUsdcWallet: String? = nil, splWallet: String? = nil, supporterCount: Int, supportingCount: Int, tiktokHandle: String? = nil, totalAudioBalance: Int, totalBalance: String? = nil, trackCount: Int, twitterHandle: String? = nil, updatedAt: Date? = nil, userId: Int? = nil, verifiedWithInstagram: Bool, verifiedWithTiktok: Bool, verifiedWithTwitter: Bool, wallet: String, waudioBalance: String? = nil, website: String? = nil) {
    self.albumCount = albumCount
    self.allowAiAttribution = allowAiAttribution
    self.artistCoinBadge = artistCoinBadge
    self.artistPickTrackId = artistPickTrackId
    self.associatedSolWalletsBalance = associatedSolWalletsBalance
    self.associatedWalletsBalance = associatedWalletsBalance
    self.balance = balance
    self.bio = bio
    self.blocknumber = blocknumber
    self.coinFlairMint = coinFlairMint
    self.coverPhoto = coverPhoto
    self.coverPhotoCids = coverPhotoCids
    self.coverPhotoLegacy = coverPhotoLegacy
    self.coverPhotoSizes = coverPhotoSizes
    self.createdAt = createdAt
    self.creatorNodeEndpoint = creatorNodeEndpoint
    self.currentUserFolloweeFollowCount = currentUserFolloweeFollowCount
    self.doesCurrentUserFollow = doesCurrentUserFollow
    self.doesCurrentUserSubscribe = doesCurrentUserSubscribe
    self.doesFollowCurrentUser = doesFollowCurrentUser
    self.donation = donation
    self.ercWallet = ercWallet
    self.followeeCount = followeeCount
    self.followerCount = followerCount
    self.handle = handle
    self.handleLc = handleLc
    self.hasCollectibles = hasCollectibles
    self.id = id
    self.instagramHandle = instagramHandle
    self.isAvailable = isAvailable
    self.isDeactivated = isDeactivated
    self.isStorageV2 = isStorageV2
    self.isVerified = isVerified
    self.location = location
    self.name = name
    self.payoutWallet = payoutWallet
    self.playlistCount = playlistCount
    self.profilePicture = profilePicture
    self.profilePictureCids = profilePictureCids
    self.profilePictureLegacy = profilePictureLegacy
    self.profilePictureSizes = profilePictureSizes
    self.profileType = profileType
    self.repostCount = repostCount
    self.splUsdcPayoutWallet = splUsdcPayoutWallet
    self.splUsdcWallet = splUsdcWallet
    self.splWallet = splWallet
    self.supporterCount = supporterCount
    self.supportingCount = supportingCount
    self.tiktokHandle = tiktokHandle
    self.totalAudioBalance = totalAudioBalance
    self.totalBalance = totalBalance
    self.trackCount = trackCount
    self.twitterHandle = twitterHandle
    self.updatedAt = updatedAt
    self.userId = userId
    self.verifiedWithInstagram = verifiedWithInstagram
    self.verifiedWithTiktok = verifiedWithTiktok
    self.verifiedWithTwitter = verifiedWithTwitter
    self.wallet = wallet
    self.waudioBalance = waudioBalance
    self.website = website
  }

  enum CodingKeys: String, CodingKey {
    case albumCount = "album_count"
    case allowAiAttribution = "allow_ai_attribution"
    case artistCoinBadge = "artist_coin_badge"
    case artistPickTrackId = "artist_pick_track_id"
    case associatedSolWalletsBalance = "associated_sol_wallets_balance"
    case associatedWalletsBalance = "associated_wallets_balance"
    case balance
    case bio
    case blocknumber
    case coinFlairMint = "coin_flair_mint"
    case coverPhoto = "cover_photo"
    case coverPhotoCids = "cover_photo_cids"
    case coverPhotoLegacy = "cover_photo_legacy"
    case coverPhotoSizes = "cover_photo_sizes"
    case createdAt = "created_at"
    case creatorNodeEndpoint = "creator_node_endpoint"
    case currentUserFolloweeFollowCount = "current_user_followee_follow_count"
    case doesCurrentUserFollow = "does_current_user_follow"
    case doesCurrentUserSubscribe = "does_current_user_subscribe"
    case doesFollowCurrentUser = "does_follow_current_user"
    case donation
    case ercWallet = "erc_wallet"
    case followeeCount = "followee_count"
    case followerCount = "follower_count"
    case handle
    case handleLc = "handle_lc"
    case hasCollectibles = "has_collectibles"
    case id
    case instagramHandle = "instagram_handle"
    case isAvailable = "is_available"
    case isDeactivated = "is_deactivated"
    case isStorageV2 = "is_storage_v2"
    case isVerified = "is_verified"
    case location
    case name
    case payoutWallet = "payout_wallet"
    case playlistCount = "playlist_count"
    case profilePicture = "profile_picture"
    case profilePictureCids = "profile_picture_cids"
    case profilePictureLegacy = "profile_picture_legacy"
    case profilePictureSizes = "profile_picture_sizes"
    case profileType = "profile_type"
    case repostCount = "repost_count"
    case splUsdcPayoutWallet = "spl_usdc_payout_wallet"
    case splUsdcWallet = "spl_usdc_wallet"
    case splWallet = "spl_wallet"
    case supporterCount = "supporter_count"
    case supportingCount = "supporting_count"
    case tiktokHandle = "tiktok_handle"
    case totalAudioBalance = "total_audio_balance"
    case totalBalance = "total_balance"
    case trackCount = "track_count"
    case twitterHandle = "twitter_handle"
    case updatedAt = "updated_at"
    case userId = "user_id"
    case verifiedWithInstagram = "verified_with_instagram"
    case verifiedWithTiktok = "verified_with_tiktok"
    case verifiedWithTwitter = "verified_with_twitter"
    case wallet
    case waudioBalance = "waudio_balance"
    case website
  }
}

public struct UserCoin: Sendable, Codable, Equatable {
  public var balance: Int
  public var balanceUsd: Double
  public var bannerImageUrl: String?
  public var decimals: Int
  public var hasDiscord: Bool
  public var logoUri: String?
  public var mint: String
  public var ownerId: String
  public var ticker: String

  public init(balance: Int, balanceUsd: Double, bannerImageUrl: String? = nil, decimals: Int, hasDiscord: Bool, logoUri: String? = nil, mint: String, ownerId: String, ticker: String) {
    self.balance = balance
    self.balanceUsd = balanceUsd
    self.bannerImageUrl = bannerImageUrl
    self.decimals = decimals
    self.hasDiscord = hasDiscord
    self.logoUri = logoUri
    self.mint = mint
    self.ownerId = ownerId
    self.ticker = ticker
  }

  enum CodingKeys: String, CodingKey {
    case balance
    case balanceUsd = "balance_usd"
    case bannerImageUrl = "banner_image_url"
    case decimals
    case hasDiscord = "has_discord"
    case logoUri = "logo_uri"
    case mint
    case ownerId = "owner_id"
    case ticker
  }
}

public struct UserCoinAccount: Sendable, Codable, Equatable {
  public var account: String
  public var balance: Int
  public var balanceUsd: Double
  public var isInAppWallet: Bool
  public var owner: String

  public init(account: String, balance: Int, balanceUsd: Double, isInAppWallet: Bool, owner: String) {
    self.account = account
    self.balance = balance
    self.balanceUsd = balanceUsd
    self.isInAppWallet = isInAppWallet
    self.owner = owner
  }

  enum CodingKeys: String, CodingKey {
    case account
    case balance
    case balanceUsd = "balance_usd"
    case isInAppWallet = "is_in_app_wallet"
    case owner
  }
}

public struct UserCoinResponse: Sendable, Codable, Equatable {
  public var data: UserCoinWithAccounts?

  public init(data: UserCoinWithAccounts? = nil) {
    self.data = data
  }
}

public struct UserCoinWithAccounts: Sendable, Codable, Equatable {
  public var accounts: [UserCoinAccount]
  public var balance: Int
  public var balanceUsd: Double
  public var decimals: Int
  public var logoUri: String?
  public var mint: String
  public var ticker: String

  public init(accounts: [UserCoinAccount], balance: Int, balanceUsd: Double, decimals: Int, logoUri: String? = nil, mint: String, ticker: String) {
    self.accounts = accounts
    self.balance = balance
    self.balanceUsd = balanceUsd
    self.decimals = decimals
    self.logoUri = logoUri
    self.mint = mint
    self.ticker = ticker
  }

  enum CodingKeys: String, CodingKey {
    case accounts
    case balance
    case balanceUsd = "balance_usd"
    case decimals
    case logoUri = "logo_uri"
    case mint
    case ticker
  }
}

public struct UserCoinsResponse: Sendable, Codable, Equatable {
  public var data: [UserCoin]

  public init(data: [UserCoin]) {
    self.data = data
  }
}

public struct UserCommentsResponse: Sendable, Codable, Equatable {
  public var data: [Comment]?

  public init(data: [Comment]? = nil) {
    self.data = data
  }
}

public struct UserIdAddress: Sendable, Codable, Equatable {
  public var address: String
  public var userId: String

  public init(address: String, userId: String) {
    self.address = address
    self.userId = userId
  }

  enum CodingKeys: String, CodingKey {
    case address
    case userId = "user_id"
  }
}

public struct UserIdsAddressesResponse: Sendable, Codable, Equatable {
  public var data: [UserIdAddress]?

  public init(data: [UserIdAddress]? = nil) {
    self.data = data
  }
}

public struct UserResponse: Sendable, Codable, Equatable {
  public var data: User?

  public init(data: User? = nil) {
    self.data = data
  }
}

public struct UserSearch: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct UserTrackListenCountsResponse: Sendable, Codable, Equatable {
  public var data: WildMonthModel?

  public init(data: WildMonthModel? = nil) {
    self.data = data
  }
}

public struct UserTracksRemixedResponse: Sendable, Codable, Equatable {
  public var data: [RemixedTrackAggregate]?

  public init(data: [RemixedTrackAggregate]? = nil) {
    self.data = data
  }
}

public struct UsersResponse: Sendable, Codable, Equatable {
  public var data: [User]?

  public init(data: [User]? = nil) {
    self.data = data
  }
}

public struct VerifyToken: Sendable, Codable, Equatable {
  public var data: DecodedUserToken?

  public init(data: DecodedUserToken? = nil) {
    self.data = data
  }
}

public struct WildMonthModel: Sendable, Codable, Equatable {
  public var raw: [String: JSONValue]

  public init(raw: [String: JSONValue] = [:]) {
    self.raw = raw
  }
}

public struct WriteResponse: Sendable, Codable, Equatable {
  public var success: Bool?
  public var transactionHash: String?

  public init(success: Bool? = nil, transactionHash: String? = nil) {
    self.success = success
    self.transactionHash = transactionHash
  }

  enum CodingKeys: String, CodingKey {
    case success
    case transactionHash = "transaction_hash"
  }
}
