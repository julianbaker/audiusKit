import Foundation

// MARK: - Safe Decoding Extensions

extension KeyedDecodingContainer {
  /// Safely decode a value, returning nil if decoding fails instead of throwing
  func safeDecodeIfPresent<T: Decodable>(_ type: T.Type, forKey key: Key) -> T? {
    do {
      return try decodeIfPresent(type, forKey: key)
    } catch {
      print("⚠️ Failed to decode \(key.stringValue) as \(type): \(error)")
      return nil
    }
  }
}

/// Represents a user's profile picture with different sizes
public struct ProfilePicture: Codable, Hashable {
  public let small: String?
  public let medium: String?
  public let large: String?

  enum CodingKeys: String, CodingKey {
    case small = "150x150"
    case medium = "480x480"
    case large = "1000x1000"
  }

  public var gatewayURL: URL? {
    if let mediumURL = medium {
      return URL(string: mediumURL)
    } else if let smallURL = small {
      return URL(string: smallURL)
    } else if let largeURL = large {
      return URL(string: largeURL)
    }
    return nil
  }
}

/// Represents a user's cover photo with different sizes
public struct CoverPhoto: Codable, Hashable {
  public let small: String?
  public let large: String?

  enum CodingKeys: String, CodingKey {
    case small = "640x"
    case large = "2000x"
  }

  public var gatewayURL: URL? {
    if let largeURL = large {
      return URL(string: largeURL)
    } else if let smallURL = small {
      return URL(string: smallURL)
    }
    return nil
  }
}

/// Represents remix information for a track
public struct RemixOf: Codable, Hashable {
  public let tracks: [RemixTrack]?
}

public struct RemixTrack: Codable, Hashable {
  public let parent_track_id: String
}

/// Represents album backlink information
public struct AlbumBacklink: Codable, Hashable {
  public let playlistId: Int
  public let playlistName: String
  public let permalink: String

  enum CodingKeys: String, CodingKey {
    case playlistId = "playlist_id"
    case playlistName = "playlist_name"
    case permalink
  }
}

/// Represents the response for /users/id?associated_wallet
public struct UserIdFromWallet: Codable, Hashable {
  public let userId: String?

  enum CodingKeys: String, CodingKey {
    case userId = "user_id"
  }
}

/// Represents a track on Audius
public struct Track: Codable, Identifiable, Hashable {
  public let id: String
  public let title: String
  public let description: String?
  public let genre: String?
  public let mood: String?
  public let tags: [String]?
  public let duration: Int?
  public let playCount: Int?
  public let favoriteCount: Int?
  public let repostCount: Int?
  public let commentCount: Int?
  public let isStreamable: Bool?
  public let isDownloadable: Bool?
  public let isPublic: Bool?
  public let createdAt: String?
  public let updatedAt: String?
  public let releaseDate: String?
  public let artwork: Artwork?
  public let user: User?
  public let streamUrl: String?

  // Additional fields from API documentation
  public let trackCid: String?
  public let previewCid: String?
  public let origFileCid: String?
  public let origFilename: String?
  public let isOriginalAvailable: Bool?
  public let remixOf: RemixOf?
  public let permalink: String?
  public let ddexApp: String?
  public let playlistsContainingTrack: [Int]?
  public let pinnedCommentId: Int?
  public let albumBacklink: AlbumBacklink?

  public struct Artwork: Codable, Hashable {
    public let url: String?
    public let width: Int?
    public let height: Int?
    public let small: String?
    public let medium: String?
    public let large: String?

    enum CodingKeys: String, CodingKey {
      case url
      case width
      case height
      case small = "150x150"
      case medium = "480x480"
      case large = "1000x1000"
    }

    public var gatewayURL: URL? {
      if let mediumURL = medium {
        return URL(string: mediumURL)
      } else if let smallURL = small {
        return URL(string: smallURL)
      } else if let largeURL = large {
        return URL(string: largeURL)
      } else if let url = url {
        if url.hasPrefix("ipfs://") {
          let hash = url.replacingOccurrences(of: "ipfs://", with: "")
          return URL(string: "https://ipfs.io/ipfs/\(hash)")
        }
        if url.hasPrefix("ar://") {
          let hash = url.replacingOccurrences(of: "ar://", with: "")
          return URL(string: "https://arweave.net/\(hash)")
        }
        return URL(string: url)
      }
      return nil
    }
  }

  public struct User: Codable, Hashable, Identifiable {
    public let id: String
    public let handle: String
    public let name: String?
    public let profilePicture: ProfilePicture?
    public let coverPhoto: CoverPhoto?
    public let bio: String?
    public let twitterHandle: String?
    public let instagramHandle: String?
    public let tiktokHandle: String?
    public let website: String?
    public let donation: String?
    public let location: String?
    public let followerCount: Int?
    public let followingCount: Int?  // Keep for backwards compatibility
    public let followeeCount: Int?  // New field from API
    public let trackCount: Int?
    public let playlistCount: Int?
    public let albumCount: Int?
    public let repostCount: Int?
    public let isVerified: Bool?
    public let verifiedWithTwitter: Bool?
    public let verifiedWithInstagram: Bool?
    public let verifiedWithTiktok: Bool?
    public let isDeactivated: Bool?
    public let isAvailable: Bool?

    // Wallet information
    public let ercWallet: String?
    public let splWallet: String?
    public let splUsdcPayoutWallet: String?
    public let wallet: String?
    public let supporterCount: Int?
    public let supportingCount: Int?
    public let totalAudioBalance: Int?
    public let artistPickTrackId: String?

    enum CodingKeys: String, CodingKey {
      case id
      case handle
      case name
      case profilePicture = "profile_picture"
      case coverPhoto = "cover_photo"
      case bio
      case twitterHandle = "twitter_handle"
      case instagramHandle = "instagram_handle"
      case tiktokHandle = "tiktok_handle"
      case website
      case donation
      case location
      case followerCount = "follower_count"
      case followingCount = "following_count"  // For backwards compatibility
      case followeeCount = "followee_count"

      case trackCount = "track_count"
      case playlistCount = "playlist_count"
      case albumCount = "album_count"
      case repostCount = "repost_count"
      case isVerified = "is_verified"
      case verifiedWithTwitter = "verified_with_twitter"
      case verifiedWithInstagram = "verified_with_instagram"
      case verifiedWithTiktok = "verified_with_tiktok"
      case isDeactivated = "is_deactivated"
      case isAvailable = "is_available"
      case ercWallet = "erc_wallet"
      case splWallet = "spl_wallet"
      case splUsdcPayoutWallet = "spl_usdc_payout_wallet"
      case wallet
      case supporterCount = "supporter_count"
      case supportingCount = "supporting_count"
      case totalAudioBalance = "total_audio_balance"
      case artistPickTrackId = "artist_pick_track_id"
    }

    // Memberwise initializer for backwards compatibility
    public init(
      id: String,
      handle: String,
      name: String? = nil,
      profilePicture: ProfilePicture? = nil,
      coverPhoto: CoverPhoto? = nil,
      bio: String? = nil,
      twitterHandle: String? = nil,
      instagramHandle: String? = nil,
      tiktokHandle: String? = nil,
      website: String? = nil,
      donation: String? = nil,
      location: String? = nil,
      followerCount: Int? = nil,
      followingCount: Int? = nil,
      followeeCount: Int? = nil,

      trackCount: Int? = nil,
      playlistCount: Int? = nil,
      albumCount: Int? = nil,
      repostCount: Int? = nil,
      isVerified: Bool? = nil,
      verifiedWithTwitter: Bool? = nil,
      verifiedWithInstagram: Bool? = nil,
      verifiedWithTiktok: Bool? = nil,
      isDeactivated: Bool? = nil,
      isAvailable: Bool? = nil,
      ercWallet: String? = nil,
      splWallet: String? = nil,
      splUsdcPayoutWallet: String? = nil,
      wallet: String? = nil,
      supporterCount: Int? = nil,
      supportingCount: Int? = nil,
      totalAudioBalance: Int? = nil,
      artistPickTrackId: String? = nil
    ) {
      self.id = id
      self.handle = handle
      self.name = name
      self.profilePicture = profilePicture
      self.coverPhoto = coverPhoto
      self.bio = bio
      self.twitterHandle = twitterHandle
      self.instagramHandle = instagramHandle
      self.tiktokHandle = tiktokHandle
      self.website = website
      self.donation = donation
      self.location = location
      self.followerCount = followerCount
      self.followingCount = followingCount
      self.followeeCount = followeeCount

      self.trackCount = trackCount
      self.playlistCount = playlistCount
      self.albumCount = albumCount
      self.repostCount = repostCount
      self.isVerified = isVerified
      self.verifiedWithTwitter = verifiedWithTwitter
      self.verifiedWithInstagram = verifiedWithInstagram
      self.verifiedWithTiktok = verifiedWithTiktok
      self.isDeactivated = isDeactivated
      self.isAvailable = isAvailable
      self.ercWallet = ercWallet
      self.splWallet = splWallet
      self.splUsdcPayoutWallet = splUsdcPayoutWallet
      self.wallet = wallet
      self.supporterCount = supporterCount
      self.supportingCount = supportingCount
      self.totalAudioBalance = totalAudioBalance
      self.artistPickTrackId = artistPickTrackId
    }

  }

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case description
    case genre
    case mood
    case tags
    case duration
    case playCount = "play_count"
    case favoriteCount = "favorite_count"
    case repostCount = "repost_count"
    case commentCount = "comment_count"
    case isStreamable = "is_streamable"
    case isDownloadable = "is_downloadable"
    case isPublic = "is_public"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case releaseDate = "release_date"
    case artwork
    case user
    case streamUrl = "stream_url"
    case trackCid = "track_cid"
    case previewCid = "preview_cid"
    case origFileCid = "orig_file_cid"
    case origFilename = "orig_filename"
    case isOriginalAvailable = "is_original_available"
    case remixOf = "remix_of"
    case permalink
    case ddexApp = "ddex_app"
    case playlistsContainingTrack = "playlists_containing_track"
    case pinnedCommentId = "pinned_comment_id"
    case albumBacklink = "album_backlink"
  }

  public init(
    id: String,
    title: String,
    description: String? = nil,
    genre: String? = nil,
    mood: String? = nil,
    tags: [String]? = nil,
    duration: Int? = nil,
    playCount: Int? = nil,
    favoriteCount: Int? = nil,
    repostCount: Int? = nil,
    commentCount: Int? = nil,
    isStreamable: Bool? = nil,
    isDownloadable: Bool? = nil,
    isPublic: Bool? = nil,
    createdAt: String? = nil,
    updatedAt: String? = nil,
    releaseDate: String? = nil,
    artwork: Artwork? = nil,
    user: User? = nil,
    streamUrl: String? = nil,
    trackCid: String? = nil,
    previewCid: String? = nil,
    origFileCid: String? = nil,
    origFilename: String? = nil,
    isOriginalAvailable: Bool? = nil,
    remixOf: RemixOf? = nil,
    permalink: String? = nil,
    ddexApp: String? = nil,
    playlistsContainingTrack: [Int]? = nil,
    pinnedCommentId: Int? = nil,
    albumBacklink: AlbumBacklink? = nil
  ) {
    self.id = id
    self.title = title
    self.description = description
    self.genre = genre
    self.mood = mood
    self.tags = tags
    self.duration = duration
    self.playCount = playCount
    self.favoriteCount = favoriteCount
    self.repostCount = repostCount
    self.commentCount = commentCount
    self.isStreamable = isStreamable
    self.isDownloadable = isDownloadable
    self.isPublic = isPublic
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.releaseDate = releaseDate
    self.artwork = artwork
    self.user = user
    self.streamUrl = streamUrl
    self.trackCid = trackCid
    self.previewCid = previewCid
    self.origFileCid = origFileCid
    self.origFilename = origFilename
    self.isOriginalAvailable = isOriginalAvailable
    self.remixOf = remixOf
    self.permalink = permalink
    self.ddexApp = ddexApp
    self.playlistsContainingTrack = playlistsContainingTrack
    self.pinnedCommentId = pinnedCommentId
    self.albumBacklink = albumBacklink
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(String.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    // Optional fields - use safe decoding that doesn't fail the entire object
    description = container.safeDecodeIfPresent(String.self, forKey: .description)
    genre = container.safeDecodeIfPresent(String.self, forKey: .genre)
    mood = container.safeDecodeIfPresent(String.self, forKey: .mood)
    duration = container.safeDecodeIfPresent(Int.self, forKey: .duration)
    playCount = container.safeDecodeIfPresent(Int.self, forKey: .playCount)
    favoriteCount = container.safeDecodeIfPresent(Int.self, forKey: .favoriteCount)
    repostCount = container.safeDecodeIfPresent(Int.self, forKey: .repostCount)
    commentCount = container.safeDecodeIfPresent(Int.self, forKey: .commentCount)
    isStreamable = container.safeDecodeIfPresent(Bool.self, forKey: .isStreamable)
    isDownloadable = container.safeDecodeIfPresent(Bool.self, forKey: .isDownloadable)
    isPublic = container.safeDecodeIfPresent(Bool.self, forKey: .isPublic)
    createdAt = container.safeDecodeIfPresent(String.self, forKey: .createdAt)
    updatedAt = container.safeDecodeIfPresent(String.self, forKey: .updatedAt)
    releaseDate = container.safeDecodeIfPresent(String.self, forKey: .releaseDate)
    artwork = container.safeDecodeIfPresent(Artwork.self, forKey: .artwork)
    user = container.safeDecodeIfPresent(User.self, forKey: .user)
    streamUrl = container.safeDecodeIfPresent(String.self, forKey: .streamUrl)

    // New enhanced fields - all safe decode to prevent future API changes from breaking
    trackCid = container.safeDecodeIfPresent(String.self, forKey: .trackCid)
    previewCid = container.safeDecodeIfPresent(String.self, forKey: .previewCid)
    origFileCid = container.safeDecodeIfPresent(String.self, forKey: .origFileCid)
    origFilename = container.safeDecodeIfPresent(String.self, forKey: .origFilename)
    isOriginalAvailable = container.safeDecodeIfPresent(Bool.self, forKey: .isOriginalAvailable)
    remixOf = container.safeDecodeIfPresent(RemixOf.self, forKey: .remixOf)
    permalink = container.safeDecodeIfPresent(String.self, forKey: .permalink)
    ddexApp = container.safeDecodeIfPresent(String.self, forKey: .ddexApp)
    playlistsContainingTrack = container.safeDecodeIfPresent(
      [Int].self, forKey: .playlistsContainingTrack)
    pinnedCommentId = container.safeDecodeIfPresent(Int.self, forKey: .pinnedCommentId)
    albumBacklink = container.safeDecodeIfPresent(AlbumBacklink.self, forKey: .albumBacklink)

    // Handle tags string parsing safely
    if let tagsString = container.safeDecodeIfPresent(String.self, forKey: .tags) {
      if tagsString.isEmpty {
        tags = []
      } else {
        tags = tagsString.split(separator: ",").map {
          String($0).trimmingCharacters(in: .whitespaces)
        }
      }
    } else {
      tags = nil
    }
  }
}

// MARK: - Playable Stream URL Extension

extension Track {
  /// Fetches a playable stream URL for this track using the provided API client.
  public func fetchPlayableStreamURL(using client: AudiusAPIClient = .shared) async throws -> URL {
    let urlString = try await client.fetchStreamUrl(trackId: self.id)
    guard let url = URL(string: urlString) else {
      throw URLError(.badURL)
    }
    return url
  }
}
