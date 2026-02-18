import Foundation

public enum AudiusOperationTag: String, CaseIterable, Sendable {
  case users
  case tracks
  case playlists
  case comments
  case developerApps
  case events
  case explore
  case challenges
  case tips
  case coins
  case rewards
  case prizes
  case resolve
  case wallet
  case dashboardWalletUsers
}

public enum AudiusOperation: String, CaseIterable, Sendable {
  case getUndisbursedChallenges
  case getUndisbursedChallengesForUser
  case claimCoinReward
  case claimCoinRewardCode
  case createCoin
  case getCoin
  case getCoinByTicker
  case getCoinInsights
  case getCoinMembers
  case getCoinMembersCount
  case getCoinRedeemAmount
  case getCoins
  case getRewardCode
  case getVolumeLeaders
  case updateCoin
  case createComment
  case deleteComment
  case getComment
  case getCommentReplies
  case getUnclaimedCommentId
  case pinComment
  case reactToComment
  case reportComment
  case unpinComment
  case unreactToComment
  case updateComment
  case bulkGetDashboardWalletUsers
  case createDeveloperApp
  case createDeveloperAppAccessKey
  case deactivateDeveloperAppAccessKey
  case deleteDeveloperApp
  case getDeveloperApp
  case getDeveloperApps
  case getAllEvents
  case getBulkEvents
  case getEntityEvents
  case getUnclaimedEventId
  case getBestSelling
  case createPlaylist
  case deletePlaylist
  case favoritePlaylist
  case getBulkPlaylists
  case getPlaylist
  case getPlaylistAccessInfo
  case getPlaylistByHandleAndSlug
  case getPlaylistTracks
  case getTrendingPlaylists
  case repostPlaylist
  case searchPlaylists
  case sharePlaylist
  case unfavoritePlaylist
  case unrepostPlaylist
  case updatePlaylist
  case claimPrize
  case getPrizes
  case getWalletPrizes
  case resolve
  case claimRewards
  case createRewardCode
  case getTips
  case createTrack
  case deleteTrack
  case downloadTrack
  case favoriteTrack
  case getBulkTracks
  case getFeelingLuckyTracks
  case getMostSharedTracks
  case getRecentPremiumTracks
  case getRecommendedTracks
  case getRecommendedTracksWithVersion
  case getTrack
  case getTrackAccessInfo
  case getTrackCommentCount
  case getTrackCommentNotificationSetting
  case getTrackComments
  case getTrackRemixParents
  case getTrackRemixes
  case getTrackStems
  case getTrackTopListeners
  case getTracksWithRecentComments
  case getTrendingTrackIds
  case getTrendingTracks
  case getTrendingTracksIdsWithVersion
  case getTrendingTracksWithVersion
  case getTrendingUsdcPurchaseTracks
  case getTrendingUsdcPurchaseTracksWithVersion
  case getUndergroundTrendingTracks
  case getUndergroundTrendingTracksWithVersion
  case getUsersFromFavorites
  case getUsersFromReposts
  case inspectTrack
  case inspectTracks
  case recordTrackDownload
  case repostTrack
  case searchTracks
  case shareTrack
  case streamTrack
  case unfavoriteTrack
  case unrepostTrack
  case updateTrack
  case addManager
  case approveGrant
  case createGrant
  case createUser
  case downloadPurchasesAsCsv
  case downloadSalesAsCsv
  case downloadSalesAsJson
  case downloadUsdcWithdrawalsAsCsv
  case followUser
  case getAiAttributedTracksByUserHandle
  case getAlbumsByUser
  case getAuthorizedApps
  case getBulkUsers
  case getConnectedWallets
  case getFavorites
  case getFollowers
  case getFollowing
  case getMutedUsers
  case getMutualFollowers
  case getPlaylistsByUser
  case getPurchasers
  case getRelatedUsers
  case getRemixers
  case getReposts
  case getSalesAggregate
  case getSubscribers
  case getSupportedUsers
  case getSupporters
  case getTopTrackTags
  case getTracksByUser
  case getTracksByUserHandle
  case getTracksCountByUser
  case getUser
  case getUserBalanceHistory
  case getUserByHandle
  case getUserChallenges
  case getUserCoin
  case getUserCoins
  case getUserCollectibles
  case getUserComments
  case getUserEmailKey
  case getUserIdsByAddresses
  case getUserMonthlyTrackListens
  case getUserRecommendedTracks
  case getUserSTrackHistory
  case getUserTracksRemixed
  case muteUser
  case removeManager
  case revokeGrant
  case searchUsers
  case subscribeToUser
  case unfollowUser
  case unmuteUser
  case unsubscribeFromUser
  case updateUser
  case verifyIdToken
  case getWalletCoins
}

public struct AudiusOperationSpec: Sendable {
  public let operation: AudiusOperation
  public let operationId: String
  public let method: AudiusHTTPMethod
  public let path: String
  public let tag: AudiusOperationTag
  public let auth: AudiusAuthRequirement
}

public enum AudiusOperationRegistry {
  public static let all: [AudiusOperationSpec] = [
    AudiusOperationSpec(operation: .getUndisbursedChallenges, operationId: "Get Undisbursed Challenges", method: .get, path: "challenges/undisbursed", tag: .challenges, auth: .none),
    AudiusOperationSpec(operation: .getUndisbursedChallengesForUser, operationId: "Get Undisbursed Challenges For User", method: .get, path: "challenges/undisbursed/{user_id}", tag: .challenges, auth: .none),
    AudiusOperationSpec(operation: .claimCoinReward, operationId: "Claim Coin Reward", method: .post, path: "coins/{mint}/redeem", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .claimCoinRewardCode, operationId: "Claim Coin Reward Code", method: .post, path: "coins/{mint}/redeem/{code}", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .createCoin, operationId: "Create Coin", method: .post, path: "coins", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoin, operationId: "Get Coin", method: .get, path: "coins/{mint}", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoinByTicker, operationId: "Get Coin By Ticker", method: .get, path: "coins/ticker/{ticker}", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoinInsights, operationId: "Get Coin Insights", method: .get, path: "coins/{mint}/insights", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoinMembers, operationId: "Get Coin Members", method: .get, path: "coins/{mint}/members", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoinMembersCount, operationId: "Get Coin Members Count", method: .get, path: "coins/{mint}/members/count", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoinRedeemAmount, operationId: "Get Coin Redeem Amount", method: .get, path: "coins/{mint}/redeem", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getCoins, operationId: "Get Coins", method: .get, path: "coins", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getRewardCode, operationId: "Get Reward Code", method: .get, path: "coins/{mint}/redeem/{code}", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .getVolumeLeaders, operationId: "Get Volume Leaders", method: .get, path: "coins/volume-leaders", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .updateCoin, operationId: "Update Coin", method: .post, path: "coins/{mint}", tag: .coins, auth: .none),
    AudiusOperationSpec(operation: .createComment, operationId: "Create Comment", method: .post, path: "comments", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .deleteComment, operationId: "Delete Comment", method: .delete, path: "comments/{comment_id}", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .getComment, operationId: "Get Comment", method: .get, path: "comments/{comment_id}", tag: .comments, auth: .none),
    AudiusOperationSpec(operation: .getCommentReplies, operationId: "Get Comment Replies", method: .get, path: "comments/{comment_id}/replies", tag: .comments, auth: .none),
    AudiusOperationSpec(operation: .getUnclaimedCommentId, operationId: "Get unclaimed comment ID", method: .get, path: "comments/unclaimed_id", tag: .comments, auth: .none),
    AudiusOperationSpec(operation: .pinComment, operationId: "Pin Comment", method: .post, path: "comments/{comment_id}/pin", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .reactToComment, operationId: "React to Comment", method: .post, path: "comments/{comment_id}/react", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .reportComment, operationId: "Report Comment", method: .post, path: "comments/{comment_id}/report", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unpinComment, operationId: "Unpin Comment", method: .delete, path: "comments/{comment_id}/pin", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unreactToComment, operationId: "Unreact to Comment", method: .delete, path: "comments/{comment_id}/react", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .updateComment, operationId: "Update Comment", method: .put, path: "comments/{comment_id}", tag: .comments, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .bulkGetDashboardWalletUsers, operationId: "Bulk get dashboard wallet users", method: .get, path: "dashboard_wallet_users", tag: .dashboardWalletUsers, auth: .none),
    AudiusOperationSpec(operation: .createDeveloperApp, operationId: "Create Developer App", method: .post, path: "developer-apps", tag: .developerApps, auth: .none),
    AudiusOperationSpec(operation: .createDeveloperAppAccessKey, operationId: "Create Developer App Access Key", method: .post, path: "developer-apps/{address}/access-keys", tag: .developerApps, auth: .none),
    AudiusOperationSpec(operation: .deactivateDeveloperAppAccessKey, operationId: "Deactivate Developer App Access Key", method: .post, path: "developer-apps/{address}/access-keys/deactivate", tag: .developerApps, auth: .none),
    AudiusOperationSpec(operation: .deleteDeveloperApp, operationId: "Delete Developer App", method: .delete, path: "developer-apps/{address}", tag: .developerApps, auth: .none),
    AudiusOperationSpec(operation: .getDeveloperApp, operationId: "Get Developer App", method: .get, path: "developer-apps/{address}", tag: .developerApps, auth: .none),
    AudiusOperationSpec(operation: .getDeveloperApps, operationId: "Get Developer Apps", method: .get, path: "users/{id}/developer-apps", tag: .developerApps, auth: .none),
    AudiusOperationSpec(operation: .getAllEvents, operationId: "Get All Events", method: .get, path: "events/all", tag: .events, auth: .none),
    AudiusOperationSpec(operation: .getBulkEvents, operationId: "Get Bulk Events", method: .get, path: "events", tag: .events, auth: .none),
    AudiusOperationSpec(operation: .getEntityEvents, operationId: "Get Entity Events", method: .get, path: "events/entity", tag: .events, auth: .none),
    AudiusOperationSpec(operation: .getUnclaimedEventId, operationId: "Get unclaimed event ID", method: .get, path: "events/unclaimed_id", tag: .events, auth: .none),
    AudiusOperationSpec(operation: .getBestSelling, operationId: "Get Best Selling", method: .get, path: "explore/best-selling", tag: .explore, auth: .none),
    AudiusOperationSpec(operation: .createPlaylist, operationId: "Create Playlist", method: .post, path: "playlists", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .deletePlaylist, operationId: "Delete Playlist", method: .delete, path: "playlists/{playlist_id}", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .favoritePlaylist, operationId: "Favorite Playlist", method: .post, path: "playlists/{playlist_id}/favorites", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .getBulkPlaylists, operationId: "Get Bulk Playlists", method: .get, path: "playlists", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .getPlaylist, operationId: "Get Playlist", method: .get, path: "playlists/{playlist_id}", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .getPlaylistAccessInfo, operationId: "Get Playlist Access Info", method: .get, path: "playlists/{playlist_id}/access-info", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .getPlaylistByHandleAndSlug, operationId: "Get Playlist By Handle and Slug", method: .get, path: "playlists/by_permalink/{handle}/{slug}", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .getPlaylistTracks, operationId: "Get Playlist Tracks", method: .get, path: "playlists/{playlist_id}/tracks", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .getTrendingPlaylists, operationId: "Get Trending Playlists", method: .get, path: "playlists/trending", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .repostPlaylist, operationId: "Repost Playlist", method: .post, path: "playlists/{playlist_id}/reposts", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .searchPlaylists, operationId: "Search Playlists", method: .get, path: "playlists/search", tag: .playlists, auth: .none),
    AudiusOperationSpec(operation: .sharePlaylist, operationId: "Share Playlist", method: .post, path: "playlists/{playlist_id}/shares", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unfavoritePlaylist, operationId: "Unfavorite Playlist", method: .delete, path: "playlists/{playlist_id}/favorites", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unrepostPlaylist, operationId: "Unrepost Playlist", method: .delete, path: "playlists/{playlist_id}/reposts", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .updatePlaylist, operationId: "Update Playlist", method: .put, path: "playlists/{playlist_id}", tag: .playlists, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .claimPrize, operationId: "Claim Prize", method: .post, path: "prizes/claim", tag: .prizes, auth: .none),
    AudiusOperationSpec(operation: .getPrizes, operationId: "Get Prizes", method: .get, path: "prizes", tag: .prizes, auth: .none),
    AudiusOperationSpec(operation: .getWalletPrizes, operationId: "Get Wallet Prizes", method: .get, path: "wallet/{wallet}/prizes", tag: .prizes, auth: .none),
    AudiusOperationSpec(operation: .resolve, operationId: "Resolve", method: .get, path: "resolve", tag: .resolve, auth: .none),
    AudiusOperationSpec(operation: .claimRewards, operationId: "Claim Rewards", method: .post, path: "rewards/claim", tag: .rewards, auth: .none),
    AudiusOperationSpec(operation: .createRewardCode, operationId: "Create Reward Code", method: .post, path: "rewards/code", tag: .rewards, auth: .none),
    AudiusOperationSpec(operation: .getTips, operationId: "Get Tips", method: .get, path: "tips", tag: .tips, auth: .none),
    AudiusOperationSpec(operation: .createTrack, operationId: "Create Track", method: .post, path: "tracks", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .deleteTrack, operationId: "Delete Track", method: .delete, path: "tracks/{track_id}", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .downloadTrack, operationId: "Download Track", method: .get, path: "tracks/{track_id}/download", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .favoriteTrack, operationId: "Favorite Track", method: .post, path: "tracks/{track_id}/favorites", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .getBulkTracks, operationId: "Get Bulk Tracks", method: .get, path: "tracks", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getFeelingLuckyTracks, operationId: "Get Feeling Lucky Tracks", method: .get, path: "tracks/feeling-lucky", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getMostSharedTracks, operationId: "Get Most Shared Tracks", method: .get, path: "tracks/most-shared", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getRecentPremiumTracks, operationId: "Get Recent Premium Tracks", method: .get, path: "tracks/recent-premium", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getRecommendedTracks, operationId: "Get Recommended Tracks", method: .get, path: "tracks/recommended", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getRecommendedTracksWithVersion, operationId: "Get Recommended Tracks With Version", method: .get, path: "tracks/recommended/{version}", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrack, operationId: "Get Track", method: .get, path: "tracks/{track_id}", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackAccessInfo, operationId: "Get Track Access Info", method: .get, path: "tracks/{track_id}/access-info", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackCommentCount, operationId: "Get Track Comment Count", method: .get, path: "tracks/{track_id}/comment_count", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackCommentNotificationSetting, operationId: "Get Track Comment Notification Setting", method: .get, path: "tracks/{track_id}/comment_notification_setting", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackComments, operationId: "Get Track Comments", method: .get, path: "tracks/{track_id}/comments", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackRemixParents, operationId: "Get Track Remix Parents", method: .get, path: "tracks/{track_id}/remixing", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackRemixes, operationId: "Get Track Remixes", method: .get, path: "tracks/{track_id}/remixes", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackStems, operationId: "Get Track Stems", method: .get, path: "tracks/{track_id}/stems", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrackTopListeners, operationId: "Get Track Top Listeners", method: .get, path: "tracks/{track_id}/top_listeners", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTracksWithRecentComments, operationId: "Get Tracks With Recent Comments", method: .get, path: "tracks/recent-comments", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrendingTrackIds, operationId: "Get Trending Track IDs", method: .get, path: "tracks/trending/ids", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrendingTracks, operationId: "Get Trending Tracks", method: .get, path: "tracks/trending", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrendingTracksIdsWithVersion, operationId: "Get Trending Tracks IDs With Version", method: .get, path: "tracks/trending/ids/{version}", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrendingTracksWithVersion, operationId: "Get Trending Tracks With Version", method: .get, path: "tracks/trending/{version}", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrendingUsdcPurchaseTracks, operationId: "Get Trending USDC Purchase Tracks", method: .get, path: "tracks/usdc-purchase", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getTrendingUsdcPurchaseTracksWithVersion, operationId: "Get Trending USDC Purchase Tracks With Version", method: .get, path: "tracks/usdc-purchase/{version}", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getUndergroundTrendingTracks, operationId: "Get Underground Trending Tracks", method: .get, path: "tracks/trending/underground", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getUndergroundTrendingTracksWithVersion, operationId: "Get Underground Trending Tracks With Version", method: .get, path: "tracks/trending/underground/{version}", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getUsersFromFavorites, operationId: "Get Users From Favorites", method: .get, path: "tracks/{track_id}/favorites", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .getUsersFromReposts, operationId: "Get Users From Reposts", method: .get, path: "tracks/{track_id}/reposts", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .inspectTrack, operationId: "Inspect Track", method: .get, path: "tracks/{track_id}/inspect", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .inspectTracks, operationId: "Inspect Tracks", method: .get, path: "tracks/inspect", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .recordTrackDownload, operationId: "Record Track Download", method: .post, path: "tracks/{track_id}/downloads", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .repostTrack, operationId: "Repost Track", method: .post, path: "tracks/{track_id}/reposts", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .searchTracks, operationId: "Search Tracks", method: .get, path: "tracks/search", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .shareTrack, operationId: "Share Track", method: .post, path: "tracks/{track_id}/shares", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .streamTrack, operationId: "Stream Track", method: .get, path: "tracks/{track_id}/stream", tag: .tracks, auth: .none),
    AudiusOperationSpec(operation: .unfavoriteTrack, operationId: "Unfavorite Track", method: .delete, path: "tracks/{track_id}/favorites", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unrepostTrack, operationId: "Unrepost Track", method: .delete, path: "tracks/{track_id}/reposts", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .updateTrack, operationId: "Update Track", method: .put, path: "tracks/{track_id}", tag: .tracks, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .addManager, operationId: "Add Manager", method: .post, path: "users/{id}/managers", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .approveGrant, operationId: "Approve Grant", method: .post, path: "users/{id}/grants/approve", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .createGrant, operationId: "Create Grant", method: .post, path: "users/{id}/grants", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .createUser, operationId: "Create User", method: .post, path: "users", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .downloadPurchasesAsCsv, operationId: "Download Purchases as CSV", method: .get, path: "users/{id}/purchases/download", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .downloadSalesAsCsv, operationId: "Download Sales as CSV", method: .get, path: "users/{id}/sales/download", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .downloadSalesAsJson, operationId: "Download Sales as JSON", method: .get, path: "users/{id}/sales/download/json", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .downloadUsdcWithdrawalsAsCsv, operationId: "Download USDC Withdrawals as CSV", method: .get, path: "users/{id}/withdrawals/download", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .followUser, operationId: "Follow User", method: .post, path: "users/{id}/follow", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .getAiAttributedTracksByUserHandle, operationId: "Get AI Attributed Tracks by User Handle", method: .get, path: "users/handle/{handle}/tracks/ai_attributed", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getAlbumsByUser, operationId: "Get Albums by User", method: .get, path: "users/{id}/albums", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getAuthorizedApps, operationId: "Get Authorized Apps", method: .get, path: "users/{id}/authorized_apps", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getBulkUsers, operationId: "Get Bulk Users", method: .get, path: "users", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getConnectedWallets, operationId: "Get connected wallets", method: .get, path: "users/{id}/connected_wallets", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getFavorites, operationId: "Get Favorites", method: .get, path: "users/{id}/favorites", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getFollowers, operationId: "Get Followers", method: .get, path: "users/{id}/followers", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getFollowing, operationId: "Get Following", method: .get, path: "users/{id}/following", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getMutedUsers, operationId: "Get Muted Users", method: .get, path: "users/{id}/muted", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getMutualFollowers, operationId: "Get Mutual Followers", method: .get, path: "users/{id}/mutuals", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getPlaylistsByUser, operationId: "Get Playlists by User", method: .get, path: "users/{id}/playlists", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getPurchasers, operationId: "Get purchasers", method: .get, path: "users/{id}/purchasers", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getRelatedUsers, operationId: "Get Related Users", method: .get, path: "users/{id}/related", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getRemixers, operationId: "Get remixers", method: .get, path: "users/{id}/remixers", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getReposts, operationId: "Get Reposts", method: .get, path: "users/{id}/reposts", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getSalesAggregate, operationId: "Get Sales Aggregate", method: .get, path: "users/{id}/sales/aggregate", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getSubscribers, operationId: "Get Subscribers", method: .get, path: "users/{id}/subscribers", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getSupportedUsers, operationId: "Get Supported Users", method: .get, path: "users/{id}/supporting", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getSupporters, operationId: "Get Supporters", method: .get, path: "users/{id}/supporters", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getTopTrackTags, operationId: "Get Top Track Tags", method: .get, path: "users/{id}/tags", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getTracksByUser, operationId: "Get Tracks by User", method: .get, path: "users/{id}/tracks", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getTracksByUserHandle, operationId: "Get Tracks by User Handle", method: .get, path: "users/handle/{handle}/tracks", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getTracksCountByUser, operationId: "Get Tracks Count by User", method: .get, path: "users/{id}/tracks/count", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUser, operationId: "Get User", method: .get, path: "users/{id}", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserBalanceHistory, operationId: "Get User Balance History", method: .get, path: "users/{id}/balance/history", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserByHandle, operationId: "Get User by Handle", method: .get, path: "users/handle/{handle}", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserChallenges, operationId: "Get User Challenges", method: .get, path: "users/{id}/challenges", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserCoin, operationId: "Get User Coin", method: .get, path: "users/{id}/coins/{mint}", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserCoins, operationId: "Get User Coins", method: .get, path: "users/{id}/coins", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserCollectibles, operationId: "Get User Collectibles", method: .get, path: "users/{id}/collectibles", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserComments, operationId: "Get User Comments", method: .get, path: "users/{id}/comments", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserEmailKey, operationId: "Get User Email Key", method: .get, path: "users/{receiving_user_id}/emails/{grantor_user_id}/key", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserIdsByAddresses, operationId: "Get User IDs by Addresses", method: .get, path: "users/address", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserMonthlyTrackListens, operationId: "Get User Monthly Track Listens", method: .get, path: "users/{id}/listen_counts_monthly", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserRecommendedTracks, operationId: "Get User Recommended Tracks", method: .get, path: "users/{id}/recommended-tracks", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserSTrackHistory, operationId: "Get User's Track History", method: .get, path: "users/{id}/history/tracks", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getUserTracksRemixed, operationId: "Get User Tracks Remixed", method: .get, path: "users/{id}/tracks/remixed", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .muteUser, operationId: "Mute User", method: .post, path: "users/{id}/muted", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .removeManager, operationId: "Remove Manager", method: .delete, path: "users/{id}/managers/{managerUserId}", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .revokeGrant, operationId: "Revoke Grant", method: .delete, path: "users/{id}/grants/{address}", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .searchUsers, operationId: "Search Users", method: .get, path: "users/search", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .subscribeToUser, operationId: "Subscribe to User", method: .post, path: "users/{id}/subscribers", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unfollowUser, operationId: "Unfollow User", method: .delete, path: "users/{id}/follow", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unmuteUser, operationId: "Unmute User", method: .delete, path: "users/{id}/muted", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .unsubscribeFromUser, operationId: "Unsubscribe from User", method: .delete, path: "users/{id}/subscribers", tag: .users, auth: .basicOrBearer),
    AudiusOperationSpec(operation: .updateUser, operationId: "Update User", method: .put, path: "users/{id}", tag: .users, auth: .basic),
    AudiusOperationSpec(operation: .verifyIdToken, operationId: "Verify ID Token", method: .get, path: "users/verify_token", tag: .users, auth: .none),
    AudiusOperationSpec(operation: .getWalletCoins, operationId: "Get Wallet Coins", method: .get, path: "wallet/{walletId}/coins", tag: .wallet, auth: .none),
  ]

  private static let byOperation: [AudiusOperation: AudiusOperationSpec] = {
    Dictionary(uniqueKeysWithValues: all.map { ($0.operation, $0) })
  }()

  public static func spec(for operation: AudiusOperation) throws -> AudiusOperationSpec {
    guard let spec = byOperation[operation] else {
      throw AudiusError.unsupportedOperation(operation.rawValue)
    }
    return spec
  }
}

public extension ChallengesAPI {
  /// GET /challenges/undisbursed
  @discardableResult
  func getUndisbursedChallenges(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUndisbursedChallenges, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /challenges/undisbursed/{user_id}
  @discardableResult
  func getUndisbursedChallengesForUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUndisbursedChallengesForUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension CoinsAPI {
  /// POST /coins/{mint}/redeem
  @discardableResult
  func claimCoinReward(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.claimCoinReward, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /coins/{mint}/redeem/{code}
  @discardableResult
  func claimCoinRewardCode(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.claimCoinRewardCode, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /coins
  @discardableResult
  func createCoin(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createCoin, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/{mint}
  @discardableResult
  func getCoin(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoin, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/ticker/{ticker}
  @discardableResult
  func getCoinByTicker(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoinByTicker, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/{mint}/insights
  @discardableResult
  func getCoinInsights(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoinInsights, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/{mint}/members
  @discardableResult
  func getCoinMembers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoinMembers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/{mint}/members/count
  @discardableResult
  func getCoinMembersCount(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoinMembersCount, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/{mint}/redeem
  @discardableResult
  func getCoinRedeemAmount(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoinRedeemAmount, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins
  @discardableResult
  func getCoins(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCoins, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/{mint}/redeem/{code}
  @discardableResult
  func getRewardCode(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getRewardCode, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /coins/volume-leaders
  @discardableResult
  func getVolumeLeaders(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getVolumeLeaders, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /coins/{mint}
  @discardableResult
  func updateCoin(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.updateCoin, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension CommentsAPI {
  /// POST /comments
  @discardableResult
  func createComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /comments/{comment_id}
  @discardableResult
  func deleteComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.deleteComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /comments/{comment_id}
  @discardableResult
  func getComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /comments/{comment_id}/replies
  @discardableResult
  func getCommentReplies(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getCommentReplies, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /comments/unclaimed_id
  @discardableResult
  func getUnclaimedCommentId(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUnclaimedCommentId, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /comments/{comment_id}/pin
  @discardableResult
  func pinComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.pinComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /comments/{comment_id}/react
  @discardableResult
  func reactToComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.reactToComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /comments/{comment_id}/report
  @discardableResult
  func reportComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.reportComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /comments/{comment_id}/pin
  @discardableResult
  func unpinComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unpinComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /comments/{comment_id}/react
  @discardableResult
  func unreactToComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unreactToComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// PUT /comments/{comment_id}
  @discardableResult
  func updateComment(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.updateComment, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension DashboardWalletUsersAPI {
  /// GET /dashboard_wallet_users
  @discardableResult
  func bulkGetDashboardWalletUsers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.bulkGetDashboardWalletUsers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension DeveloperAppsAPI {
  /// POST /developer-apps
  @discardableResult
  func createDeveloperApp(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createDeveloperApp, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /developer-apps/{address}/access-keys
  @discardableResult
  func createDeveloperAppAccessKey(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createDeveloperAppAccessKey, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /developer-apps/{address}/access-keys/deactivate
  @discardableResult
  func deactivateDeveloperAppAccessKey(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.deactivateDeveloperAppAccessKey, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /developer-apps/{address}
  @discardableResult
  func deleteDeveloperApp(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.deleteDeveloperApp, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /developer-apps/{address}
  @discardableResult
  func getDeveloperApp(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getDeveloperApp, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/developer-apps
  @discardableResult
  func getDeveloperApps(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getDeveloperApps, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension EventsAPI {
  /// GET /events/all
  @discardableResult
  func getAllEvents(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getAllEvents, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /events
  @discardableResult
  func getBulkEvents(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getBulkEvents, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /events/entity
  @discardableResult
  func getEntityEvents(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getEntityEvents, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /events/unclaimed_id
  @discardableResult
  func getUnclaimedEventId(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUnclaimedEventId, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension ExploreAPI {
  /// GET /explore/best-selling
  @discardableResult
  func getBestSelling(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getBestSelling, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension PlaylistsAPI {
  /// POST /playlists
  @discardableResult
  func createPlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createPlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /playlists/{playlist_id}
  @discardableResult
  func deletePlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.deletePlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /playlists/{playlist_id}/favorites
  @discardableResult
  func favoritePlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.favoritePlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists
  @discardableResult
  func getBulkPlaylists(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getBulkPlaylists, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists/{playlist_id}
  @discardableResult
  func getPlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists/{playlist_id}/access-info
  @discardableResult
  func getPlaylistAccessInfo(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPlaylistAccessInfo, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists/by_permalink/{handle}/{slug}
  @discardableResult
  func getPlaylistByHandleAndSlug(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPlaylistByHandleAndSlug, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists/{playlist_id}/tracks
  @discardableResult
  func getPlaylistTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPlaylistTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists/trending
  @discardableResult
  func getTrendingPlaylists(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingPlaylists, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /playlists/{playlist_id}/reposts
  @discardableResult
  func repostPlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.repostPlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /playlists/search
  @discardableResult
  func searchPlaylists(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.searchPlaylists, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /playlists/{playlist_id}/shares
  @discardableResult
  func sharePlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.sharePlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /playlists/{playlist_id}/favorites
  @discardableResult
  func unfavoritePlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unfavoritePlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /playlists/{playlist_id}/reposts
  @discardableResult
  func unrepostPlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unrepostPlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// PUT /playlists/{playlist_id}
  @discardableResult
  func updatePlaylist(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.updatePlaylist, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension PrizesAPI {
  /// POST /prizes/claim
  @discardableResult
  func claimPrize(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.claimPrize, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /prizes
  @discardableResult
  func getPrizes(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPrizes, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /wallet/{wallet}/prizes
  @discardableResult
  func getWalletPrizes(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getWalletPrizes, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension ResolveAPI {
  /// GET /resolve
  @discardableResult
  func resolve(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.resolve, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension RewardsAPI {
  /// POST /rewards/claim
  @discardableResult
  func claimRewards(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.claimRewards, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /rewards/code
  @discardableResult
  func createRewardCode(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createRewardCode, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension TipsAPI {
  /// GET /tips
  @discardableResult
  func getTips(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTips, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension TracksAPI {
  /// POST /tracks
  @discardableResult
  func createTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /tracks/{track_id}
  @discardableResult
  func deleteTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.deleteTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/download
  @discardableResult
  func downloadTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.downloadTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /tracks/{track_id}/favorites
  @discardableResult
  func favoriteTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.favoriteTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks
  @discardableResult
  func getBulkTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getBulkTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/feeling-lucky
  @discardableResult
  func getFeelingLuckyTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getFeelingLuckyTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/most-shared
  @discardableResult
  func getMostSharedTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getMostSharedTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/recent-premium
  @discardableResult
  func getRecentPremiumTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getRecentPremiumTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/recommended
  @discardableResult
  func getRecommendedTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getRecommendedTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/recommended/{version}
  @discardableResult
  func getRecommendedTracksWithVersion(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getRecommendedTracksWithVersion, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}
  @discardableResult
  func getTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/access-info
  @discardableResult
  func getTrackAccessInfo(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackAccessInfo, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/comment_count
  @discardableResult
  func getTrackCommentCount(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackCommentCount, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/comment_notification_setting
  @discardableResult
  func getTrackCommentNotificationSetting(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackCommentNotificationSetting, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/comments
  @discardableResult
  func getTrackComments(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackComments, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/remixing
  @discardableResult
  func getTrackRemixParents(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackRemixParents, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/remixes
  @discardableResult
  func getTrackRemixes(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackRemixes, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/stems
  @discardableResult
  func getTrackStems(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackStems, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/top_listeners
  @discardableResult
  func getTrackTopListeners(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrackTopListeners, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/recent-comments
  @discardableResult
  func getTracksWithRecentComments(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTracksWithRecentComments, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/trending/ids
  @discardableResult
  func getTrendingTrackIds(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingTrackIds, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/trending
  @discardableResult
  func getTrendingTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/trending/ids/{version}
  @discardableResult
  func getTrendingTracksIdsWithVersion(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingTracksIdsWithVersion, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/trending/{version}
  @discardableResult
  func getTrendingTracksWithVersion(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingTracksWithVersion, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/usdc-purchase
  @discardableResult
  func getTrendingUsdcPurchaseTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingUsdcPurchaseTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/usdc-purchase/{version}
  @discardableResult
  func getTrendingUsdcPurchaseTracksWithVersion(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTrendingUsdcPurchaseTracksWithVersion, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/trending/underground
  @discardableResult
  func getUndergroundTrendingTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUndergroundTrendingTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/trending/underground/{version}
  @discardableResult
  func getUndergroundTrendingTracksWithVersion(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUndergroundTrendingTracksWithVersion, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/favorites
  @discardableResult
  func getUsersFromFavorites(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUsersFromFavorites, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/reposts
  @discardableResult
  func getUsersFromReposts(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUsersFromReposts, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/inspect
  @discardableResult
  func inspectTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.inspectTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/inspect
  @discardableResult
  func inspectTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.inspectTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /tracks/{track_id}/downloads
  @discardableResult
  func recordTrackDownload(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.recordTrackDownload, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /tracks/{track_id}/reposts
  @discardableResult
  func repostTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.repostTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/search
  @discardableResult
  func searchTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.searchTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /tracks/{track_id}/shares
  @discardableResult
  func shareTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.shareTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /tracks/{track_id}/stream
  @discardableResult
  func streamTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.streamTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /tracks/{track_id}/favorites
  @discardableResult
  func unfavoriteTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unfavoriteTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /tracks/{track_id}/reposts
  @discardableResult
  func unrepostTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unrepostTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// PUT /tracks/{track_id}
  @discardableResult
  func updateTrack(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.updateTrack, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension UsersAPI {
  /// POST /users/{id}/managers
  @discardableResult
  func addManager(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.addManager, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /users/{id}/grants/approve
  @discardableResult
  func approveGrant(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.approveGrant, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /users/{id}/grants
  @discardableResult
  func createGrant(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createGrant, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /users
  @discardableResult
  func createUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.createUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/purchases/download
  @discardableResult
  func downloadPurchasesAsCsv(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.downloadPurchasesAsCsv, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/sales/download
  @discardableResult
  func downloadSalesAsCsv(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.downloadSalesAsCsv, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/sales/download/json
  @discardableResult
  func downloadSalesAsJson(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.downloadSalesAsJson, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/withdrawals/download
  @discardableResult
  func downloadUsdcWithdrawalsAsCsv(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.downloadUsdcWithdrawalsAsCsv, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /users/{id}/follow
  @discardableResult
  func followUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.followUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/handle/{handle}/tracks/ai_attributed
  @discardableResult
  func getAiAttributedTracksByUserHandle(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getAiAttributedTracksByUserHandle, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/albums
  @discardableResult
  func getAlbumsByUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getAlbumsByUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/authorized_apps
  @discardableResult
  func getAuthorizedApps(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getAuthorizedApps, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users
  @discardableResult
  func getBulkUsers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getBulkUsers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/connected_wallets
  @discardableResult
  func getConnectedWallets(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getConnectedWallets, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/favorites
  @discardableResult
  func getFavorites(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getFavorites, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/followers
  @discardableResult
  func getFollowers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getFollowers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/following
  @discardableResult
  func getFollowing(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getFollowing, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/muted
  @discardableResult
  func getMutedUsers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getMutedUsers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/mutuals
  @discardableResult
  func getMutualFollowers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getMutualFollowers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/playlists
  @discardableResult
  func getPlaylistsByUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPlaylistsByUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/purchasers
  @discardableResult
  func getPurchasers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getPurchasers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/related
  @discardableResult
  func getRelatedUsers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getRelatedUsers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/remixers
  @discardableResult
  func getRemixers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getRemixers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/reposts
  @discardableResult
  func getReposts(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getReposts, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/sales/aggregate
  @discardableResult
  func getSalesAggregate(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getSalesAggregate, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/subscribers
  @discardableResult
  func getSubscribers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getSubscribers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/supporting
  @discardableResult
  func getSupportedUsers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getSupportedUsers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/supporters
  @discardableResult
  func getSupporters(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getSupporters, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/tags
  @discardableResult
  func getTopTrackTags(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTopTrackTags, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/tracks
  @discardableResult
  func getTracksByUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTracksByUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/handle/{handle}/tracks
  @discardableResult
  func getTracksByUserHandle(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTracksByUserHandle, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/tracks/count
  @discardableResult
  func getTracksCountByUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getTracksCountByUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}
  @discardableResult
  func getUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/balance/history
  @discardableResult
  func getUserBalanceHistory(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserBalanceHistory, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/handle/{handle}
  @discardableResult
  func getUserByHandle(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserByHandle, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/challenges
  @discardableResult
  func getUserChallenges(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserChallenges, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/coins/{mint}
  @discardableResult
  func getUserCoin(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserCoin, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/coins
  @discardableResult
  func getUserCoins(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserCoins, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/collectibles
  @discardableResult
  func getUserCollectibles(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserCollectibles, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/comments
  @discardableResult
  func getUserComments(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserComments, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{receiving_user_id}/emails/{grantor_user_id}/key
  @discardableResult
  func getUserEmailKey(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserEmailKey, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/address
  @discardableResult
  func getUserIdsByAddresses(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserIdsByAddresses, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/listen_counts_monthly
  @discardableResult
  func getUserMonthlyTrackListens(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserMonthlyTrackListens, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/recommended-tracks
  @discardableResult
  func getUserRecommendedTracks(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserRecommendedTracks, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/history/tracks
  @discardableResult
  func getUserSTrackHistory(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserSTrackHistory, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/{id}/tracks/remixed
  @discardableResult
  func getUserTracksRemixed(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getUserTracksRemixed, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /users/{id}/muted
  @discardableResult
  func muteUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.muteUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /users/{id}/managers/{managerUserId}
  @discardableResult
  func removeManager(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.removeManager, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /users/{id}/grants/{address}
  @discardableResult
  func revokeGrant(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.revokeGrant, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/search
  @discardableResult
  func searchUsers(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.searchUsers, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// POST /users/{id}/subscribers
  @discardableResult
  func subscribeToUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.subscribeToUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /users/{id}/follow
  @discardableResult
  func unfollowUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unfollowUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /users/{id}/muted
  @discardableResult
  func unmuteUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unmuteUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// DELETE /users/{id}/subscribers
  @discardableResult
  func unsubscribeFromUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.unsubscribeFromUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// PUT /users/{id}
  @discardableResult
  func updateUser(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.updateUser, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

  /// GET /users/verify_token
  @discardableResult
  func verifyIdToken(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.verifyIdToken, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}

public extension WalletAPI {
  /// GET /wallet/{walletId}/coins
  @discardableResult
  func getWalletCoins(
    pathParameters: [String: String] = [:],
    queryItems: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: JSONValue? = nil
  ) async throws -> AudiusHTTPResponse<Data> {
    try await perform(.getWalletCoins, pathParameters: pathParameters, queryItems: queryItems, headers: headers, body: body)
  }

}
