import Foundation

public typealias GetUndisbursedChallengesTypedResponse = AudiusListEnvelope<UndisbursedChallenge>
public typealias GetUndisbursedChallengesForUserTypedResponse = AudiusListEnvelope<UndisbursedChallenge>
public typealias ClaimCoinRewardTypedResponse = AudiusListEnvelope<JSONValue>
public typealias ClaimCoinRewardCodeTypedResponse = AudiusListEnvelope<JSONValue>
public typealias CreateCoinTypedResponse = AudiusEnvelope<JSONValue>
public typealias GetCoinTypedResponse = AudiusEnvelope<Coin>
public typealias GetCoinByTickerTypedResponse = AudiusEnvelope<Coin>
public typealias GetCoinInsightsTypedResponse = AudiusEnvelope<CoinInsights>
public typealias GetCoinMembersTypedResponse = AudiusListEnvelope<CoinMember>
public typealias GetCoinMembersCountTypedResponse = AudiusEnvelope<Int>
public typealias GetCoinRedeemAmountTypedResponse = RedeemAmountResponse
public typealias GetCoinsTypedResponse = AudiusListEnvelope<Coin>
public typealias GetRewardCodeTypedResponse = RewardCodeResponse
public typealias GetVolumeLeadersTypedResponse = AudiusListEnvelope<JSONValue>
public typealias UpdateCoinTypedResponse = UpdateCoinResponse
public typealias CreateCommentTypedResponse = CreateCommentResponse
public typealias DeleteCommentTypedResponse = WriteResponse
public typealias GetCommentTypedResponse = AudiusListEnvelope<Comment>
public typealias GetCommentRepliesTypedResponse = AudiusListEnvelope<ReplyComment>
public typealias GetUnclaimedCommentIdTypedResponse = AudiusEnvelope<String>
public typealias PinCommentTypedResponse = WriteResponse
public typealias ReactToCommentTypedResponse = WriteResponse
public typealias ReportCommentTypedResponse = WriteResponse
public typealias UnpinCommentTypedResponse = WriteResponse
public typealias UnreactToCommentTypedResponse = WriteResponse
public typealias UpdateCommentTypedResponse = WriteResponse
public typealias BulkGetDashboardWalletUsersTypedResponse = AudiusListEnvelope<DashboardWalletUser>
public typealias CreateDeveloperAppTypedResponse = CreateDeveloperAppResponse
public typealias CreateDeveloperAppAccessKeyTypedResponse = CreateAccessKeyResponse
public typealias DeactivateDeveloperAppAccessKeyTypedResponse = DeactivateAccessKeyResponse
public typealias DeleteDeveloperAppTypedResponse = WriteResponse
public typealias GetDeveloperAppTypedResponse = AudiusEnvelope<DeveloperApp>
public typealias GetDeveloperAppsTypedResponse = AudiusListEnvelope<DeveloperApp>
public typealias GetAllEventsTypedResponse = AudiusListEnvelope<Event>
public typealias GetBulkEventsTypedResponse = AudiusListEnvelope<Event>
public typealias GetEntityEventsTypedResponse = AudiusListEnvelope<Event>
public typealias GetUnclaimedEventIdTypedResponse = AudiusEnvelope<String>
public typealias GetBestSellingTypedResponse = AudiusListEnvelope<BestSellingItem>
public typealias CreatePlaylistTypedResponse = CreatePlaylistResponse
public typealias DeletePlaylistTypedResponse = WriteResponse
public typealias FavoritePlaylistTypedResponse = WriteResponse
public typealias GetBulkPlaylistsTypedResponse = AudiusListEnvelope<Playlist>
public typealias GetPlaylistTypedResponse = AudiusListEnvelope<Playlist>
public typealias GetPlaylistAccessInfoTypedResponse = AudiusEnvelope<TrackAccessInfo>
public typealias GetPlaylistByHandleAndSlugTypedResponse = AudiusListEnvelope<Playlist>
public typealias GetPlaylistTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrendingPlaylistsTypedResponse = AudiusListEnvelope<Playlist>
public typealias RepostPlaylistTypedResponse = WriteResponse
public typealias SearchPlaylistsTypedResponse = AudiusListEnvelope<Playlist>
public typealias SharePlaylistTypedResponse = WriteResponse
public typealias UnfavoritePlaylistTypedResponse = WriteResponse
public typealias UnrepostPlaylistTypedResponse = WriteResponse
public typealias UpdatePlaylistTypedResponse = WriteResponse
public typealias ClaimPrizeTypedResponse = PrizeClaimResponse
public typealias GetPrizesTypedResponse = AudiusListEnvelope<PrizePublic>
public typealias GetWalletPrizesTypedResponse = AudiusListEnvelope<ClaimedPrize>
public typealias ResolveTypedResponse = AudiusHTTPResponse<Data>
public typealias ClaimRewardsTypedResponse = AudiusListEnvelope<JSONValue>
public typealias CreateRewardCodeTypedResponse = CreateRewardCodeResponse
public typealias GetTipsTypedResponse = AudiusListEnvelope<Tip>
public typealias CreateTrackTypedResponse = CreateTrackResponse
public typealias DeleteTrackTypedResponse = WriteResponse
public typealias DownloadTrackTypedResponse = AudiusHTTPResponse<Data>
public typealias FavoriteTrackTypedResponse = WriteResponse
public typealias GetBulkTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetFeelingLuckyTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetMostSharedTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetRecentPremiumTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetRecommendedTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetRecommendedTracksWithVersionTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrackTypedResponse = AudiusEnvelope<Track>
public typealias GetTrackAccessInfoTypedResponse = AudiusEnvelope<TrackAccessInfo>
public typealias GetTrackCommentCountTypedResponse = AudiusEnvelope<Int>
public typealias GetTrackCommentNotificationSettingTypedResponse = AudiusEnvelope<CommentNotificationSetting>
public typealias GetTrackCommentsTypedResponse = AudiusListEnvelope<Comment>
public typealias GetTrackRemixParentsTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrackRemixesTypedResponse = RemixesResponse
public typealias GetTrackStemsTypedResponse = AudiusListEnvelope<Stem>
public typealias GetTrackTopListenersTypedResponse = AudiusListEnvelope<TopListener>
public typealias GetTracksWithRecentCommentsTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrendingTrackIdsTypedResponse = AudiusEnvelope<TrendingTimesIds>
public typealias GetTrendingTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrendingTracksIdsWithVersionTypedResponse = AudiusEnvelope<TrendingTimesIds>
public typealias GetTrendingTracksWithVersionTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrendingUsdcPurchaseTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetTrendingUsdcPurchaseTracksWithVersionTypedResponse = AudiusListEnvelope<Track>
public typealias GetUndergroundTrendingTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetUndergroundTrendingTracksWithVersionTypedResponse = AudiusListEnvelope<Track>
public typealias GetUsersFromFavoritesTypedResponse = AudiusListEnvelope<User>
public typealias GetUsersFromRepostsTypedResponse = AudiusListEnvelope<User>
public typealias InspectTrackTypedResponse = AudiusEnvelope<BlobInfo>
public typealias InspectTracksTypedResponse = AudiusListEnvelope<BlobInfo>
public typealias RecordTrackDownloadTypedResponse = WriteResponse
public typealias RepostTrackTypedResponse = WriteResponse
public typealias SearchTracksTypedResponse = AudiusListEnvelope<Track>
public typealias ShareTrackTypedResponse = WriteResponse
public typealias StreamTrackTypedResponse = AudiusEnvelope<String>
public typealias UnfavoriteTrackTypedResponse = WriteResponse
public typealias UnrepostTrackTypedResponse = WriteResponse
public typealias UpdateTrackTypedResponse = WriteResponse
public typealias AddManagerTypedResponse = WriteResponse
public typealias ApproveGrantTypedResponse = WriteResponse
public typealias CreateGrantTypedResponse = WriteResponse
public typealias CreateUserTypedResponse = CreateUserResponse
public typealias DownloadPurchasesAsCsvTypedResponse = AudiusHTTPResponse<Data>
public typealias DownloadSalesAsCsvTypedResponse = AudiusHTTPResponse<Data>
public typealias DownloadSalesAsJsonTypedResponse = AudiusEnvelope<SalesJsonContent>
public typealias DownloadUsdcWithdrawalsAsCsvTypedResponse = AudiusHTTPResponse<Data>
public typealias FollowUserTypedResponse = WriteResponse
public typealias GetAiAttributedTracksByUserHandleTypedResponse = AudiusListEnvelope<Track>
public typealias GetAlbumsByUserTypedResponse = AudiusListEnvelope<Playlist>
public typealias GetAuthorizedAppsTypedResponse = AudiusListEnvelope<AuthorizedApp>
public typealias GetBulkUsersTypedResponse = AudiusListEnvelope<User>
public typealias GetConnectedWalletsTypedResponse = AudiusEnvelope<ConnectedWallets>
public typealias GetFavoritesTypedResponse = AudiusListEnvelope<Favorite>
public typealias GetFollowersTypedResponse = AudiusListEnvelope<User>
public typealias GetFollowingTypedResponse = AudiusListEnvelope<User>
public typealias GetMutedUsersTypedResponse = AudiusListEnvelope<User>
public typealias GetMutualFollowersTypedResponse = AudiusListEnvelope<User>
public typealias GetPlaylistsByUserTypedResponse = AudiusListEnvelope<Playlist>
public typealias GetPurchasersTypedResponse = AudiusListEnvelope<User>
public typealias GetRelatedUsersTypedResponse = AudiusListEnvelope<User>
public typealias GetRemixersTypedResponse = AudiusListEnvelope<User>
public typealias GetRepostsTypedResponse = AudiusListEnvelope<Activity>
public typealias GetSalesAggregateTypedResponse = AudiusListEnvelope<SalesAggregate>
public typealias GetSubscribersTypedResponse = AudiusListEnvelope<User>
public typealias GetSupportedUsersTypedResponse = AudiusListEnvelope<Supporting>
public typealias GetSupportersTypedResponse = AudiusListEnvelope<Supporter>
public typealias GetTopTrackTagsTypedResponse = AudiusListEnvelope<String>
public typealias GetTracksByUserTypedResponse = AudiusListEnvelope<Track>
public typealias GetTracksByUserHandleTypedResponse = AudiusListEnvelope<Track>
public typealias GetTracksCountByUserTypedResponse = AudiusEnvelope<Int>
public typealias GetUserTypedResponse = AudiusEnvelope<User>
public typealias GetUserBalanceHistoryTypedResponse = AudiusListEnvelope<BalanceHistoryDataPoint>
public typealias GetUserByHandleTypedResponse = AudiusEnvelope<User>
public typealias GetUserChallengesTypedResponse = AudiusListEnvelope<ChallengeResponse>
public typealias GetUserCoinTypedResponse = AudiusEnvelope<UserCoinWithAccounts>
public typealias GetUserCoinsTypedResponse = AudiusListEnvelope<UserCoin>
public typealias GetUserCollectiblesTypedResponse = AudiusEnvelope<Collectibles>
public typealias GetUserCommentsTypedResponse = AudiusListEnvelope<Comment>
public typealias GetUserEmailKeyTypedResponse = AudiusEnvelope<EmailAccess>
public typealias GetUserIdsByAddressesTypedResponse = AudiusListEnvelope<UserIdAddress>
public typealias GetUserMonthlyTrackListensTypedResponse = AudiusEnvelope<WildMonthModel>
public typealias GetUserRecommendedTracksTypedResponse = AudiusListEnvelope<Track>
public typealias GetUserSTrackHistoryTypedResponse = AudiusListEnvelope<TrackActivity>
public typealias GetUserTracksRemixedTypedResponse = AudiusListEnvelope<RemixedTrackAggregate>
public typealias MuteUserTypedResponse = WriteResponse
public typealias RemoveManagerTypedResponse = WriteResponse
public typealias RevokeGrantTypedResponse = WriteResponse
public typealias SearchUsersTypedResponse = AudiusListEnvelope<User>
public typealias SubscribeToUserTypedResponse = WriteResponse
public typealias UnfollowUserTypedResponse = WriteResponse
public typealias UnmuteUserTypedResponse = WriteResponse
public typealias UnsubscribeFromUserTypedResponse = WriteResponse
public typealias UpdateUserTypedResponse = WriteResponse
public typealias VerifyIdTokenTypedResponse = AudiusEnvelope<DecodedUserToken>
public typealias GetWalletCoinsTypedResponse = AudiusListEnvelope<UserCoin>

public struct AudiusTypedOperationSpec: Sendable, Hashable {
  public let operation: AudiusOperation
  public let method: AudiusHTTPMethod
  public let path: String
  public let tag: AudiusOperationTag
  public let auth: AudiusAuthRequirement

  public init(operation: AudiusOperation, method: AudiusHTTPMethod, path: String, tag: AudiusOperationTag, auth: AudiusAuthRequirement) {
    self.operation = operation
    self.method = method
    self.path = path
    self.tag = tag
    self.auth = auth
  }
}

public enum AudiusTypedOperationRegistry {
  public static let all: [AudiusTypedOperationSpec] = [
    AudiusTypedOperationSpec(operation: .getUndisbursedChallenges, method: .get, path: "challenges/undisbursed", tag: .challenges, auth: .none),
    AudiusTypedOperationSpec(operation: .getUndisbursedChallengesForUser, method: .get, path: "challenges/undisbursed/{user_id}", tag: .challenges, auth: .none),
    AudiusTypedOperationSpec(operation: .claimCoinReward, method: .post, path: "coins/{mint}/redeem", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .claimCoinRewardCode, method: .post, path: "coins/{mint}/redeem/{code}", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .createCoin, method: .post, path: "coins", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoin, method: .get, path: "coins/{mint}", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoinByTicker, method: .get, path: "coins/ticker/{ticker}", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoinInsights, method: .get, path: "coins/{mint}/insights", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoinMembers, method: .get, path: "coins/{mint}/members", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoinMembersCount, method: .get, path: "coins/{mint}/members/count", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoinRedeemAmount, method: .get, path: "coins/{mint}/redeem", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getCoins, method: .get, path: "coins", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getRewardCode, method: .get, path: "coins/{mint}/redeem/{code}", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .getVolumeLeaders, method: .get, path: "coins/volume-leaders", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .updateCoin, method: .post, path: "coins/{mint}", tag: .coins, auth: .none),
    AudiusTypedOperationSpec(operation: .createComment, method: .post, path: "comments", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .deleteComment, method: .delete, path: "comments/{comment_id}", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .getComment, method: .get, path: "comments/{comment_id}", tag: .comments, auth: .none),
    AudiusTypedOperationSpec(operation: .getCommentReplies, method: .get, path: "comments/{comment_id}/replies", tag: .comments, auth: .none),
    AudiusTypedOperationSpec(operation: .getUnclaimedCommentId, method: .get, path: "comments/unclaimed_id", tag: .comments, auth: .none),
    AudiusTypedOperationSpec(operation: .pinComment, method: .post, path: "comments/{comment_id}/pin", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .reactToComment, method: .post, path: "comments/{comment_id}/react", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .reportComment, method: .post, path: "comments/{comment_id}/report", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unpinComment, method: .delete, path: "comments/{comment_id}/pin", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unreactToComment, method: .delete, path: "comments/{comment_id}/react", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .updateComment, method: .put, path: "comments/{comment_id}", tag: .comments, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .bulkGetDashboardWalletUsers, method: .get, path: "dashboard_wallet_users", tag: .dashboardWalletUsers, auth: .none),
    AudiusTypedOperationSpec(operation: .createDeveloperApp, method: .post, path: "developer-apps", tag: .developerApps, auth: .none),
    AudiusTypedOperationSpec(operation: .createDeveloperAppAccessKey, method: .post, path: "developer-apps/{address}/access-keys", tag: .developerApps, auth: .none),
    AudiusTypedOperationSpec(operation: .deactivateDeveloperAppAccessKey, method: .post, path: "developer-apps/{address}/access-keys/deactivate", tag: .developerApps, auth: .none),
    AudiusTypedOperationSpec(operation: .deleteDeveloperApp, method: .delete, path: "developer-apps/{address}", tag: .developerApps, auth: .none),
    AudiusTypedOperationSpec(operation: .getDeveloperApp, method: .get, path: "developer-apps/{address}", tag: .developerApps, auth: .none),
    AudiusTypedOperationSpec(operation: .getDeveloperApps, method: .get, path: "users/{id}/developer-apps", tag: .developerApps, auth: .none),
    AudiusTypedOperationSpec(operation: .getAllEvents, method: .get, path: "events/all", tag: .events, auth: .none),
    AudiusTypedOperationSpec(operation: .getBulkEvents, method: .get, path: "events", tag: .events, auth: .none),
    AudiusTypedOperationSpec(operation: .getEntityEvents, method: .get, path: "events/entity", tag: .events, auth: .none),
    AudiusTypedOperationSpec(operation: .getUnclaimedEventId, method: .get, path: "events/unclaimed_id", tag: .events, auth: .none),
    AudiusTypedOperationSpec(operation: .getBestSelling, method: .get, path: "explore/best-selling", tag: .explore, auth: .none),
    AudiusTypedOperationSpec(operation: .createPlaylist, method: .post, path: "playlists", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .deletePlaylist, method: .delete, path: "playlists/{playlist_id}", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .favoritePlaylist, method: .post, path: "playlists/{playlist_id}/favorites", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .getBulkPlaylists, method: .get, path: "playlists", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .getPlaylist, method: .get, path: "playlists/{playlist_id}", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .getPlaylistAccessInfo, method: .get, path: "playlists/{playlist_id}/access-info", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .getPlaylistByHandleAndSlug, method: .get, path: "playlists/by_permalink/{handle}/{slug}", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .getPlaylistTracks, method: .get, path: "playlists/{playlist_id}/tracks", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingPlaylists, method: .get, path: "playlists/trending", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .repostPlaylist, method: .post, path: "playlists/{playlist_id}/reposts", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .searchPlaylists, method: .get, path: "playlists/search", tag: .playlists, auth: .none),
    AudiusTypedOperationSpec(operation: .sharePlaylist, method: .post, path: "playlists/{playlist_id}/shares", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unfavoritePlaylist, method: .delete, path: "playlists/{playlist_id}/favorites", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unrepostPlaylist, method: .delete, path: "playlists/{playlist_id}/reposts", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .updatePlaylist, method: .put, path: "playlists/{playlist_id}", tag: .playlists, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .claimPrize, method: .post, path: "prizes/claim", tag: .prizes, auth: .none),
    AudiusTypedOperationSpec(operation: .getPrizes, method: .get, path: "prizes", tag: .prizes, auth: .none),
    AudiusTypedOperationSpec(operation: .getWalletPrizes, method: .get, path: "wallet/{wallet}/prizes", tag: .prizes, auth: .none),
    AudiusTypedOperationSpec(operation: .resolve, method: .get, path: "resolve", tag: .resolve, auth: .none),
    AudiusTypedOperationSpec(operation: .claimRewards, method: .post, path: "rewards/claim", tag: .rewards, auth: .none),
    AudiusTypedOperationSpec(operation: .createRewardCode, method: .post, path: "rewards/code", tag: .rewards, auth: .none),
    AudiusTypedOperationSpec(operation: .getTips, method: .get, path: "tips", tag: .tips, auth: .none),
    AudiusTypedOperationSpec(operation: .createTrack, method: .post, path: "tracks", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .deleteTrack, method: .delete, path: "tracks/{track_id}", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .downloadTrack, method: .get, path: "tracks/{track_id}/download", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .favoriteTrack, method: .post, path: "tracks/{track_id}/favorites", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .getBulkTracks, method: .get, path: "tracks", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getFeelingLuckyTracks, method: .get, path: "tracks/feeling-lucky", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getMostSharedTracks, method: .get, path: "tracks/most-shared", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getRecentPremiumTracks, method: .get, path: "tracks/recent-premium", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getRecommendedTracks, method: .get, path: "tracks/recommended", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getRecommendedTracksWithVersion, method: .get, path: "tracks/recommended/{version}", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrack, method: .get, path: "tracks/{track_id}", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackAccessInfo, method: .get, path: "tracks/{track_id}/access-info", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackCommentCount, method: .get, path: "tracks/{track_id}/comment_count", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackCommentNotificationSetting, method: .get, path: "tracks/{track_id}/comment_notification_setting", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackComments, method: .get, path: "tracks/{track_id}/comments", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackRemixParents, method: .get, path: "tracks/{track_id}/remixing", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackRemixes, method: .get, path: "tracks/{track_id}/remixes", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackStems, method: .get, path: "tracks/{track_id}/stems", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrackTopListeners, method: .get, path: "tracks/{track_id}/top_listeners", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTracksWithRecentComments, method: .get, path: "tracks/recent-comments", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingTrackIds, method: .get, path: "tracks/trending/ids", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingTracks, method: .get, path: "tracks/trending", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingTracksIdsWithVersion, method: .get, path: "tracks/trending/ids/{version}", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingTracksWithVersion, method: .get, path: "tracks/trending/{version}", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingUsdcPurchaseTracks, method: .get, path: "tracks/usdc-purchase", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getTrendingUsdcPurchaseTracksWithVersion, method: .get, path: "tracks/usdc-purchase/{version}", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getUndergroundTrendingTracks, method: .get, path: "tracks/trending/underground", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getUndergroundTrendingTracksWithVersion, method: .get, path: "tracks/trending/underground/{version}", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getUsersFromFavorites, method: .get, path: "tracks/{track_id}/favorites", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .getUsersFromReposts, method: .get, path: "tracks/{track_id}/reposts", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .inspectTrack, method: .get, path: "tracks/{track_id}/inspect", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .inspectTracks, method: .get, path: "tracks/inspect", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .recordTrackDownload, method: .post, path: "tracks/{track_id}/downloads", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .repostTrack, method: .post, path: "tracks/{track_id}/reposts", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .searchTracks, method: .get, path: "tracks/search", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .shareTrack, method: .post, path: "tracks/{track_id}/shares", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .streamTrack, method: .get, path: "tracks/{track_id}/stream", tag: .tracks, auth: .none),
    AudiusTypedOperationSpec(operation: .unfavoriteTrack, method: .delete, path: "tracks/{track_id}/favorites", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unrepostTrack, method: .delete, path: "tracks/{track_id}/reposts", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .updateTrack, method: .put, path: "tracks/{track_id}", tag: .tracks, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .addManager, method: .post, path: "users/{id}/managers", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .approveGrant, method: .post, path: "users/{id}/grants/approve", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .createGrant, method: .post, path: "users/{id}/grants", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .createUser, method: .post, path: "users", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .downloadPurchasesAsCsv, method: .get, path: "users/{id}/purchases/download", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .downloadSalesAsCsv, method: .get, path: "users/{id}/sales/download", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .downloadSalesAsJson, method: .get, path: "users/{id}/sales/download/json", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .downloadUsdcWithdrawalsAsCsv, method: .get, path: "users/{id}/withdrawals/download", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .followUser, method: .post, path: "users/{id}/follow", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .getAiAttributedTracksByUserHandle, method: .get, path: "users/handle/{handle}/tracks/ai_attributed", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getAlbumsByUser, method: .get, path: "users/{id}/albums", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getAuthorizedApps, method: .get, path: "users/{id}/authorized_apps", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getBulkUsers, method: .get, path: "users", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getConnectedWallets, method: .get, path: "users/{id}/connected_wallets", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getFavorites, method: .get, path: "users/{id}/favorites", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getFollowers, method: .get, path: "users/{id}/followers", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getFollowing, method: .get, path: "users/{id}/following", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getMutedUsers, method: .get, path: "users/{id}/muted", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getMutualFollowers, method: .get, path: "users/{id}/mutuals", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getPlaylistsByUser, method: .get, path: "users/{id}/playlists", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getPurchasers, method: .get, path: "users/{id}/purchasers", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getRelatedUsers, method: .get, path: "users/{id}/related", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getRemixers, method: .get, path: "users/{id}/remixers", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getReposts, method: .get, path: "users/{id}/reposts", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getSalesAggregate, method: .get, path: "users/{id}/sales/aggregate", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getSubscribers, method: .get, path: "users/{id}/subscribers", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getSupportedUsers, method: .get, path: "users/{id}/supporting", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getSupporters, method: .get, path: "users/{id}/supporters", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getTopTrackTags, method: .get, path: "users/{id}/tags", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getTracksByUser, method: .get, path: "users/{id}/tracks", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getTracksByUserHandle, method: .get, path: "users/handle/{handle}/tracks", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getTracksCountByUser, method: .get, path: "users/{id}/tracks/count", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUser, method: .get, path: "users/{id}", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserBalanceHistory, method: .get, path: "users/{id}/balance/history", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserByHandle, method: .get, path: "users/handle/{handle}", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserChallenges, method: .get, path: "users/{id}/challenges", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserCoin, method: .get, path: "users/{id}/coins/{mint}", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserCoins, method: .get, path: "users/{id}/coins", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserCollectibles, method: .get, path: "users/{id}/collectibles", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserComments, method: .get, path: "users/{id}/comments", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserEmailKey, method: .get, path: "users/{receiving_user_id}/emails/{grantor_user_id}/key", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserIdsByAddresses, method: .get, path: "users/address", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserMonthlyTrackListens, method: .get, path: "users/{id}/listen_counts_monthly", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserRecommendedTracks, method: .get, path: "users/{id}/recommended-tracks", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserSTrackHistory, method: .get, path: "users/{id}/history/tracks", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getUserTracksRemixed, method: .get, path: "users/{id}/tracks/remixed", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .muteUser, method: .post, path: "users/{id}/muted", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .removeManager, method: .delete, path: "users/{id}/managers/{managerUserId}", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .revokeGrant, method: .delete, path: "users/{id}/grants/{address}", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .searchUsers, method: .get, path: "users/search", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .subscribeToUser, method: .post, path: "users/{id}/subscribers", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unfollowUser, method: .delete, path: "users/{id}/follow", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unmuteUser, method: .delete, path: "users/{id}/muted", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .unsubscribeFromUser, method: .delete, path: "users/{id}/subscribers", tag: .users, auth: .basicOrBearer),
    AudiusTypedOperationSpec(operation: .updateUser, method: .put, path: "users/{id}", tag: .users, auth: .basic),
    AudiusTypedOperationSpec(operation: .verifyIdToken, method: .get, path: "users/verify_token", tag: .users, auth: .none),
    AudiusTypedOperationSpec(operation: .getWalletCoins, method: .get, path: "wallet/{walletId}/coins", tag: .wallet, auth: .none),
  ]
}

public extension TypedChallengesAPI {
  @discardableResult
  func getUndisbursedChallenges(_ params: GetUndisbursedChallengesParams = .init()) async throws -> GetUndisbursedChallengesTypedResponse {
    let response = try await perform(
      .getUndisbursedChallenges,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUndisbursedChallengesTypedResponse.self, operation: .getUndisbursedChallenges)
  }

  @discardableResult
  func getUndisbursedChallengesForUser(_ params: GetUndisbursedChallengesForUserParams) async throws -> GetUndisbursedChallengesForUserTypedResponse {
    let response = try await perform(
      .getUndisbursedChallengesForUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUndisbursedChallengesForUserTypedResponse.self, operation: .getUndisbursedChallengesForUser)
  }

}

public extension TypedCoinsAPI {
  @discardableResult
  func claimCoinReward(_ params: ClaimCoinRewardParams) async throws -> ClaimCoinRewardTypedResponse {
    let response = try await perform(
      .claimCoinReward,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ClaimCoinRewardTypedResponse.self, operation: .claimCoinReward)
  }

  @discardableResult
  func claimCoinRewardCode(_ params: ClaimCoinRewardCodeParams) async throws -> ClaimCoinRewardCodeTypedResponse {
    let response = try await perform(
      .claimCoinRewardCode,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ClaimCoinRewardCodeTypedResponse.self, operation: .claimCoinRewardCode)
  }

  @discardableResult
  func createCoin(_ params: CreateCoinParams) async throws -> CreateCoinTypedResponse {
    let response = try await perform(
      .createCoin,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateCoinTypedResponse.self, operation: .createCoin)
  }

  @discardableResult
  func getCoin(_ params: GetCoinParams) async throws -> GetCoinTypedResponse {
    let response = try await perform(
      .getCoin,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinTypedResponse.self, operation: .getCoin)
  }

  @discardableResult
  func getCoinByTicker(_ params: GetCoinByTickerParams) async throws -> GetCoinByTickerTypedResponse {
    let response = try await perform(
      .getCoinByTicker,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinByTickerTypedResponse.self, operation: .getCoinByTicker)
  }

  @discardableResult
  func getCoinInsights(_ params: GetCoinInsightsParams) async throws -> GetCoinInsightsTypedResponse {
    let response = try await perform(
      .getCoinInsights,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinInsightsTypedResponse.self, operation: .getCoinInsights)
  }

  @discardableResult
  func getCoinMembers(_ params: GetCoinMembersParams) async throws -> GetCoinMembersTypedResponse {
    let response = try await perform(
      .getCoinMembers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinMembersTypedResponse.self, operation: .getCoinMembers)
  }

  @discardableResult
  func getCoinMembersCount(_ params: GetCoinMembersCountParams) async throws -> GetCoinMembersCountTypedResponse {
    let response = try await perform(
      .getCoinMembersCount,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinMembersCountTypedResponse.self, operation: .getCoinMembersCount)
  }

  @discardableResult
  func getCoinRedeemAmount(_ params: GetCoinRedeemAmountParams) async throws -> GetCoinRedeemAmountTypedResponse {
    let response = try await perform(
      .getCoinRedeemAmount,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinRedeemAmountTypedResponse.self, operation: .getCoinRedeemAmount)
  }

  @discardableResult
  func getCoins(_ params: GetCoinsParams = .init()) async throws -> GetCoinsTypedResponse {
    let response = try await perform(
      .getCoins,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCoinsTypedResponse.self, operation: .getCoins)
  }

  @discardableResult
  func getRewardCode(_ params: GetRewardCodeParams) async throws -> GetRewardCodeTypedResponse {
    let response = try await perform(
      .getRewardCode,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRewardCodeTypedResponse.self, operation: .getRewardCode)
  }

  @discardableResult
  func getVolumeLeaders(_ params: GetVolumeLeadersParams = .init()) async throws -> GetVolumeLeadersTypedResponse {
    let response = try await perform(
      .getVolumeLeaders,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetVolumeLeadersTypedResponse.self, operation: .getVolumeLeaders)
  }

  @discardableResult
  func updateCoin(_ params: UpdateCoinParams) async throws -> UpdateCoinTypedResponse {
    let response = try await perform(
      .updateCoin,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UpdateCoinTypedResponse.self, operation: .updateCoin)
  }

}

public extension TypedCommentsAPI {
  @discardableResult
  func createComment(_ params: CreateCommentParams) async throws -> CreateCommentTypedResponse {
    let response = try await perform(
      .createComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateCommentTypedResponse.self, operation: .createComment)
  }

  @discardableResult
  func deleteComment(_ params: DeleteCommentParams) async throws -> DeleteCommentTypedResponse {
    let response = try await perform(
      .deleteComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(DeleteCommentTypedResponse.self, operation: .deleteComment)
  }

  @discardableResult
  func getComment(_ params: GetCommentParams) async throws -> GetCommentTypedResponse {
    let response = try await perform(
      .getComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCommentTypedResponse.self, operation: .getComment)
  }

  @discardableResult
  func getCommentReplies(_ params: GetCommentRepliesParams) async throws -> GetCommentRepliesTypedResponse {
    let response = try await perform(
      .getCommentReplies,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetCommentRepliesTypedResponse.self, operation: .getCommentReplies)
  }

  @discardableResult
  func getUnclaimedCommentId(_ params: GetUnclaimedCommentIdParams = .init()) async throws -> GetUnclaimedCommentIdTypedResponse {
    let response = try await perform(
      .getUnclaimedCommentId,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUnclaimedCommentIdTypedResponse.self, operation: .getUnclaimedCommentId)
  }

  @discardableResult
  func pinComment(_ params: PinCommentParams) async throws -> PinCommentTypedResponse {
    let response = try await perform(
      .pinComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(PinCommentTypedResponse.self, operation: .pinComment)
  }

  @discardableResult
  func reactToComment(_ params: ReactToCommentParams) async throws -> ReactToCommentTypedResponse {
    let response = try await perform(
      .reactToComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ReactToCommentTypedResponse.self, operation: .reactToComment)
  }

  @discardableResult
  func reportComment(_ params: ReportCommentParams) async throws -> ReportCommentTypedResponse {
    let response = try await perform(
      .reportComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ReportCommentTypedResponse.self, operation: .reportComment)
  }

  @discardableResult
  func unpinComment(_ params: UnpinCommentParams) async throws -> UnpinCommentTypedResponse {
    let response = try await perform(
      .unpinComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnpinCommentTypedResponse.self, operation: .unpinComment)
  }

  @discardableResult
  func unreactToComment(_ params: UnreactToCommentParams) async throws -> UnreactToCommentTypedResponse {
    let response = try await perform(
      .unreactToComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnreactToCommentTypedResponse.self, operation: .unreactToComment)
  }

  @discardableResult
  func updateComment(_ params: UpdateCommentParams) async throws -> UpdateCommentTypedResponse {
    let response = try await perform(
      .updateComment,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UpdateCommentTypedResponse.self, operation: .updateComment)
  }

}

public extension TypedDashboardWalletUsersAPI {
  @discardableResult
  func bulkGetDashboardWalletUsers(_ params: BulkGetDashboardWalletUsersParams) async throws -> BulkGetDashboardWalletUsersTypedResponse {
    let response = try await perform(
      .bulkGetDashboardWalletUsers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(BulkGetDashboardWalletUsersTypedResponse.self, operation: .bulkGetDashboardWalletUsers)
  }

}

public extension TypedDeveloperAppsAPI {
  @discardableResult
  func createDeveloperApp(_ params: CreateDeveloperAppParams) async throws -> CreateDeveloperAppTypedResponse {
    let response = try await perform(
      .createDeveloperApp,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateDeveloperAppTypedResponse.self, operation: .createDeveloperApp)
  }

  @discardableResult
  func createDeveloperAppAccessKey(_ params: CreateDeveloperAppAccessKeyParams) async throws -> CreateDeveloperAppAccessKeyTypedResponse {
    let response = try await perform(
      .createDeveloperAppAccessKey,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateDeveloperAppAccessKeyTypedResponse.self, operation: .createDeveloperAppAccessKey)
  }

  @discardableResult
  func deactivateDeveloperAppAccessKey(_ params: DeactivateDeveloperAppAccessKeyParams) async throws -> DeactivateDeveloperAppAccessKeyTypedResponse {
    let response = try await perform(
      .deactivateDeveloperAppAccessKey,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(DeactivateDeveloperAppAccessKeyTypedResponse.self, operation: .deactivateDeveloperAppAccessKey)
  }

  @discardableResult
  func deleteDeveloperApp(_ params: DeleteDeveloperAppParams) async throws -> DeleteDeveloperAppTypedResponse {
    let response = try await perform(
      .deleteDeveloperApp,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(DeleteDeveloperAppTypedResponse.self, operation: .deleteDeveloperApp)
  }

  @discardableResult
  func getDeveloperApp(_ params: GetDeveloperAppParams) async throws -> GetDeveloperAppTypedResponse {
    let response = try await perform(
      .getDeveloperApp,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetDeveloperAppTypedResponse.self, operation: .getDeveloperApp)
  }

  @discardableResult
  func getDeveloperApps(_ params: GetDeveloperAppsParams) async throws -> GetDeveloperAppsTypedResponse {
    let response = try await perform(
      .getDeveloperApps,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetDeveloperAppsTypedResponse.self, operation: .getDeveloperApps)
  }

}

public extension TypedEventsAPI {
  @discardableResult
  func getAllEvents(_ params: GetAllEventsParams = .init()) async throws -> GetAllEventsTypedResponse {
    let response = try await perform(
      .getAllEvents,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetAllEventsTypedResponse.self, operation: .getAllEvents)
  }

  @discardableResult
  func getBulkEvents(_ params: GetBulkEventsParams = .init()) async throws -> GetBulkEventsTypedResponse {
    let response = try await perform(
      .getBulkEvents,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetBulkEventsTypedResponse.self, operation: .getBulkEvents)
  }

  @discardableResult
  func getEntityEvents(_ params: GetEntityEventsParams) async throws -> GetEntityEventsTypedResponse {
    let response = try await perform(
      .getEntityEvents,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetEntityEventsTypedResponse.self, operation: .getEntityEvents)
  }

  @discardableResult
  func getUnclaimedEventId(_ params: GetUnclaimedEventIdParams = .init()) async throws -> GetUnclaimedEventIdTypedResponse {
    let response = try await perform(
      .getUnclaimedEventId,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUnclaimedEventIdTypedResponse.self, operation: .getUnclaimedEventId)
  }

}

public extension TypedExploreAPI {
  @discardableResult
  func getBestSelling(_ params: GetBestSellingParams = .init()) async throws -> GetBestSellingTypedResponse {
    let response = try await perform(
      .getBestSelling,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetBestSellingTypedResponse.self, operation: .getBestSelling)
  }

}

public extension TypedPlaylistsAPI {
  @discardableResult
  func createPlaylist(_ params: CreatePlaylistParams) async throws -> CreatePlaylistTypedResponse {
    let response = try await perform(
      .createPlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreatePlaylistTypedResponse.self, operation: .createPlaylist)
  }

  @discardableResult
  func deletePlaylist(_ params: DeletePlaylistParams) async throws -> DeletePlaylistTypedResponse {
    let response = try await perform(
      .deletePlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(DeletePlaylistTypedResponse.self, operation: .deletePlaylist)
  }

  @discardableResult
  func favoritePlaylist(_ params: FavoritePlaylistParams) async throws -> FavoritePlaylistTypedResponse {
    let response = try await perform(
      .favoritePlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(FavoritePlaylistTypedResponse.self, operation: .favoritePlaylist)
  }

  @discardableResult
  func getBulkPlaylists(_ params: GetBulkPlaylistsParams = .init()) async throws -> GetBulkPlaylistsTypedResponse {
    let response = try await perform(
      .getBulkPlaylists,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetBulkPlaylistsTypedResponse.self, operation: .getBulkPlaylists)
  }

  @discardableResult
  func getPlaylist(_ params: GetPlaylistParams) async throws -> GetPlaylistTypedResponse {
    let response = try await perform(
      .getPlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPlaylistTypedResponse.self, operation: .getPlaylist)
  }

  @discardableResult
  func getPlaylistAccessInfo(_ params: GetPlaylistAccessInfoParams) async throws -> GetPlaylistAccessInfoTypedResponse {
    let response = try await perform(
      .getPlaylistAccessInfo,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPlaylistAccessInfoTypedResponse.self, operation: .getPlaylistAccessInfo)
  }

  @discardableResult
  func getPlaylistByHandleAndSlug(_ params: GetPlaylistByHandleAndSlugParams) async throws -> GetPlaylistByHandleAndSlugTypedResponse {
    let response = try await perform(
      .getPlaylistByHandleAndSlug,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPlaylistByHandleAndSlugTypedResponse.self, operation: .getPlaylistByHandleAndSlug)
  }

  @discardableResult
  func getPlaylistTracks(_ params: GetPlaylistTracksParams) async throws -> GetPlaylistTracksTypedResponse {
    let response = try await perform(
      .getPlaylistTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPlaylistTracksTypedResponse.self, operation: .getPlaylistTracks)
  }

  @discardableResult
  func getTrendingPlaylists(_ params: GetTrendingPlaylistsParams = .init()) async throws -> GetTrendingPlaylistsTypedResponse {
    let response = try await perform(
      .getTrendingPlaylists,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingPlaylistsTypedResponse.self, operation: .getTrendingPlaylists)
  }

  @discardableResult
  func repostPlaylist(_ params: RepostPlaylistParams) async throws -> RepostPlaylistTypedResponse {
    let response = try await perform(
      .repostPlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(RepostPlaylistTypedResponse.self, operation: .repostPlaylist)
  }

  @discardableResult
  func searchPlaylists(_ params: SearchPlaylistsParams = .init()) async throws -> SearchPlaylistsTypedResponse {
    let response = try await perform(
      .searchPlaylists,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(SearchPlaylistsTypedResponse.self, operation: .searchPlaylists)
  }

  @discardableResult
  func sharePlaylist(_ params: SharePlaylistParams) async throws -> SharePlaylistTypedResponse {
    let response = try await perform(
      .sharePlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(SharePlaylistTypedResponse.self, operation: .sharePlaylist)
  }

  @discardableResult
  func unfavoritePlaylist(_ params: UnfavoritePlaylistParams) async throws -> UnfavoritePlaylistTypedResponse {
    let response = try await perform(
      .unfavoritePlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnfavoritePlaylistTypedResponse.self, operation: .unfavoritePlaylist)
  }

  @discardableResult
  func unrepostPlaylist(_ params: UnrepostPlaylistParams) async throws -> UnrepostPlaylistTypedResponse {
    let response = try await perform(
      .unrepostPlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnrepostPlaylistTypedResponse.self, operation: .unrepostPlaylist)
  }

  @discardableResult
  func updatePlaylist(_ params: UpdatePlaylistParams) async throws -> UpdatePlaylistTypedResponse {
    let response = try await perform(
      .updatePlaylist,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UpdatePlaylistTypedResponse.self, operation: .updatePlaylist)
  }

}

public extension TypedPrizesAPI {
  @discardableResult
  func claimPrize(_ params: ClaimPrizeParams) async throws -> ClaimPrizeTypedResponse {
    let response = try await perform(
      .claimPrize,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ClaimPrizeTypedResponse.self, operation: .claimPrize)
  }

  @discardableResult
  func getPrizes(_ params: GetPrizesParams = .init()) async throws -> GetPrizesTypedResponse {
    let response = try await perform(
      .getPrizes,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPrizesTypedResponse.self, operation: .getPrizes)
  }

  @discardableResult
  func getWalletPrizes(_ params: GetWalletPrizesParams) async throws -> GetWalletPrizesTypedResponse {
    let response = try await perform(
      .getWalletPrizes,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetWalletPrizesTypedResponse.self, operation: .getWalletPrizes)
  }

}

public extension TypedResolveAPI {
  @discardableResult
  func resolve(_ params: ResolveParams) async throws -> ResolveTypedResponse {
    let response = try await perform(
      .resolve,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return response
  }

}

public extension TypedRewardsAPI {
  @discardableResult
  func claimRewards(_ params: ClaimRewardsParams) async throws -> ClaimRewardsTypedResponse {
    let response = try await perform(
      .claimRewards,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ClaimRewardsTypedResponse.self, operation: .claimRewards)
  }

  @discardableResult
  func createRewardCode(_ params: CreateRewardCodeParams = .init()) async throws -> CreateRewardCodeTypedResponse {
    let response = try await perform(
      .createRewardCode,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateRewardCodeTypedResponse.self, operation: .createRewardCode)
  }

}

public extension TypedTipsAPI {
  @discardableResult
  func getTips(_ params: GetTipsParams = .init()) async throws -> GetTipsTypedResponse {
    let response = try await perform(
      .getTips,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTipsTypedResponse.self, operation: .getTips)
  }

}

public extension TypedTracksAPI {
  @discardableResult
  func createTrack(_ params: CreateTrackParams) async throws -> CreateTrackTypedResponse {
    let response = try await perform(
      .createTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateTrackTypedResponse.self, operation: .createTrack)
  }

  @discardableResult
  func deleteTrack(_ params: DeleteTrackParams) async throws -> DeleteTrackTypedResponse {
    let response = try await perform(
      .deleteTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(DeleteTrackTypedResponse.self, operation: .deleteTrack)
  }

  @discardableResult
  func downloadTrack(_ params: DownloadTrackParams) async throws -> DownloadTrackTypedResponse {
    let response = try await perform(
      .downloadTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return response
  }

  @discardableResult
  func favoriteTrack(_ params: FavoriteTrackParams) async throws -> FavoriteTrackTypedResponse {
    let response = try await perform(
      .favoriteTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(FavoriteTrackTypedResponse.self, operation: .favoriteTrack)
  }

  @discardableResult
  func getBulkTracks(_ params: GetBulkTracksParams = .init()) async throws -> GetBulkTracksTypedResponse {
    let response = try await perform(
      .getBulkTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetBulkTracksTypedResponse.self, operation: .getBulkTracks)
  }

  @discardableResult
  func getFeelingLuckyTracks(_ params: GetFeelingLuckyTracksParams = .init()) async throws -> GetFeelingLuckyTracksTypedResponse {
    let response = try await perform(
      .getFeelingLuckyTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetFeelingLuckyTracksTypedResponse.self, operation: .getFeelingLuckyTracks)
  }

  @discardableResult
  func getMostSharedTracks(_ params: GetMostSharedTracksParams = .init()) async throws -> GetMostSharedTracksTypedResponse {
    let response = try await perform(
      .getMostSharedTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetMostSharedTracksTypedResponse.self, operation: .getMostSharedTracks)
  }

  @discardableResult
  func getRecentPremiumTracks(_ params: GetRecentPremiumTracksParams = .init()) async throws -> GetRecentPremiumTracksTypedResponse {
    let response = try await perform(
      .getRecentPremiumTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRecentPremiumTracksTypedResponse.self, operation: .getRecentPremiumTracks)
  }

  @discardableResult
  func getRecommendedTracks(_ params: GetRecommendedTracksParams = .init()) async throws -> GetRecommendedTracksTypedResponse {
    let response = try await perform(
      .getRecommendedTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRecommendedTracksTypedResponse.self, operation: .getRecommendedTracks)
  }

  @discardableResult
  func getRecommendedTracksWithVersion(_ params: GetRecommendedTracksWithVersionParams) async throws -> GetRecommendedTracksWithVersionTypedResponse {
    let response = try await perform(
      .getRecommendedTracksWithVersion,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRecommendedTracksWithVersionTypedResponse.self, operation: .getRecommendedTracksWithVersion)
  }

  @discardableResult
  func getTrack(_ params: GetTrackParams) async throws -> GetTrackTypedResponse {
    let response = try await perform(
      .getTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackTypedResponse.self, operation: .getTrack)
  }

  @discardableResult
  func getTrackAccessInfo(_ params: GetTrackAccessInfoParams) async throws -> GetTrackAccessInfoTypedResponse {
    let response = try await perform(
      .getTrackAccessInfo,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackAccessInfoTypedResponse.self, operation: .getTrackAccessInfo)
  }

  @discardableResult
  func getTrackCommentCount(_ params: GetTrackCommentCountParams) async throws -> GetTrackCommentCountTypedResponse {
    let response = try await perform(
      .getTrackCommentCount,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackCommentCountTypedResponse.self, operation: .getTrackCommentCount)
  }

  @discardableResult
  func getTrackCommentNotificationSetting(_ params: GetTrackCommentNotificationSettingParams) async throws -> GetTrackCommentNotificationSettingTypedResponse {
    let response = try await perform(
      .getTrackCommentNotificationSetting,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackCommentNotificationSettingTypedResponse.self, operation: .getTrackCommentNotificationSetting)
  }

  @discardableResult
  func getTrackComments(_ params: GetTrackCommentsParams) async throws -> GetTrackCommentsTypedResponse {
    let response = try await perform(
      .getTrackComments,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackCommentsTypedResponse.self, operation: .getTrackComments)
  }

  @discardableResult
  func getTrackRemixParents(_ params: GetTrackRemixParentsParams) async throws -> GetTrackRemixParentsTypedResponse {
    let response = try await perform(
      .getTrackRemixParents,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackRemixParentsTypedResponse.self, operation: .getTrackRemixParents)
  }

  @discardableResult
  func getTrackRemixes(_ params: GetTrackRemixesParams) async throws -> GetTrackRemixesTypedResponse {
    let response = try await perform(
      .getTrackRemixes,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackRemixesTypedResponse.self, operation: .getTrackRemixes)
  }

  @discardableResult
  func getTrackStems(_ params: GetTrackStemsParams) async throws -> GetTrackStemsTypedResponse {
    let response = try await perform(
      .getTrackStems,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackStemsTypedResponse.self, operation: .getTrackStems)
  }

  @discardableResult
  func getTrackTopListeners(_ params: GetTrackTopListenersParams) async throws -> GetTrackTopListenersTypedResponse {
    let response = try await perform(
      .getTrackTopListeners,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrackTopListenersTypedResponse.self, operation: .getTrackTopListeners)
  }

  @discardableResult
  func getTracksWithRecentComments(_ params: GetTracksWithRecentCommentsParams = .init()) async throws -> GetTracksWithRecentCommentsTypedResponse {
    let response = try await perform(
      .getTracksWithRecentComments,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTracksWithRecentCommentsTypedResponse.self, operation: .getTracksWithRecentComments)
  }

  @discardableResult
  func getTrendingTrackIds(_ params: GetTrendingTrackIdsParams = .init()) async throws -> GetTrendingTrackIdsTypedResponse {
    let response = try await perform(
      .getTrendingTrackIds,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingTrackIdsTypedResponse.self, operation: .getTrendingTrackIds)
  }

  @discardableResult
  func getTrendingTracks(_ params: GetTrendingTracksParams = .init()) async throws -> GetTrendingTracksTypedResponse {
    let response = try await perform(
      .getTrendingTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingTracksTypedResponse.self, operation: .getTrendingTracks)
  }

  @discardableResult
  func getTrendingTracksIdsWithVersion(_ params: GetTrendingTracksIdsWithVersionParams) async throws -> GetTrendingTracksIdsWithVersionTypedResponse {
    let response = try await perform(
      .getTrendingTracksIdsWithVersion,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingTracksIdsWithVersionTypedResponse.self, operation: .getTrendingTracksIdsWithVersion)
  }

  @discardableResult
  func getTrendingTracksWithVersion(_ params: GetTrendingTracksWithVersionParams) async throws -> GetTrendingTracksWithVersionTypedResponse {
    let response = try await perform(
      .getTrendingTracksWithVersion,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingTracksWithVersionTypedResponse.self, operation: .getTrendingTracksWithVersion)
  }

  @discardableResult
  func getTrendingUsdcPurchaseTracks(_ params: GetTrendingUsdcPurchaseTracksParams = .init()) async throws -> GetTrendingUsdcPurchaseTracksTypedResponse {
    let response = try await perform(
      .getTrendingUsdcPurchaseTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingUsdcPurchaseTracksTypedResponse.self, operation: .getTrendingUsdcPurchaseTracks)
  }

  @discardableResult
  func getTrendingUsdcPurchaseTracksWithVersion(_ params: GetTrendingUsdcPurchaseTracksWithVersionParams) async throws -> GetTrendingUsdcPurchaseTracksWithVersionTypedResponse {
    let response = try await perform(
      .getTrendingUsdcPurchaseTracksWithVersion,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTrendingUsdcPurchaseTracksWithVersionTypedResponse.self, operation: .getTrendingUsdcPurchaseTracksWithVersion)
  }

  @discardableResult
  func getUndergroundTrendingTracks(_ params: GetUndergroundTrendingTracksParams = .init()) async throws -> GetUndergroundTrendingTracksTypedResponse {
    let response = try await perform(
      .getUndergroundTrendingTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUndergroundTrendingTracksTypedResponse.self, operation: .getUndergroundTrendingTracks)
  }

  @discardableResult
  func getUndergroundTrendingTracksWithVersion(_ params: GetUndergroundTrendingTracksWithVersionParams) async throws -> GetUndergroundTrendingTracksWithVersionTypedResponse {
    let response = try await perform(
      .getUndergroundTrendingTracksWithVersion,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUndergroundTrendingTracksWithVersionTypedResponse.self, operation: .getUndergroundTrendingTracksWithVersion)
  }

  @discardableResult
  func getUsersFromFavorites(_ params: GetUsersFromFavoritesParams) async throws -> GetUsersFromFavoritesTypedResponse {
    let response = try await perform(
      .getUsersFromFavorites,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUsersFromFavoritesTypedResponse.self, operation: .getUsersFromFavorites)
  }

  @discardableResult
  func getUsersFromReposts(_ params: GetUsersFromRepostsParams) async throws -> GetUsersFromRepostsTypedResponse {
    let response = try await perform(
      .getUsersFromReposts,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUsersFromRepostsTypedResponse.self, operation: .getUsersFromReposts)
  }

  @discardableResult
  func inspectTrack(_ params: InspectTrackParams) async throws -> InspectTrackTypedResponse {
    let response = try await perform(
      .inspectTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(InspectTrackTypedResponse.self, operation: .inspectTrack)
  }

  @discardableResult
  func inspectTracks(_ params: InspectTracksParams) async throws -> InspectTracksTypedResponse {
    let response = try await perform(
      .inspectTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(InspectTracksTypedResponse.self, operation: .inspectTracks)
  }

  @discardableResult
  func recordTrackDownload(_ params: RecordTrackDownloadParams) async throws -> RecordTrackDownloadTypedResponse {
    let response = try await perform(
      .recordTrackDownload,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(RecordTrackDownloadTypedResponse.self, operation: .recordTrackDownload)
  }

  @discardableResult
  func repostTrack(_ params: RepostTrackParams) async throws -> RepostTrackTypedResponse {
    let response = try await perform(
      .repostTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(RepostTrackTypedResponse.self, operation: .repostTrack)
  }

  @discardableResult
  func searchTracks(_ params: SearchTracksParams = .init()) async throws -> SearchTracksTypedResponse {
    let response = try await perform(
      .searchTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(SearchTracksTypedResponse.self, operation: .searchTracks)
  }

  @discardableResult
  func shareTrack(_ params: ShareTrackParams) async throws -> ShareTrackTypedResponse {
    let response = try await perform(
      .shareTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ShareTrackTypedResponse.self, operation: .shareTrack)
  }

  @discardableResult
  func streamTrack(_ params: StreamTrackParams) async throws -> StreamTrackTypedResponse {
    let response = try await perform(
      .streamTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(StreamTrackTypedResponse.self, operation: .streamTrack)
  }

  @discardableResult
  func unfavoriteTrack(_ params: UnfavoriteTrackParams) async throws -> UnfavoriteTrackTypedResponse {
    let response = try await perform(
      .unfavoriteTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnfavoriteTrackTypedResponse.self, operation: .unfavoriteTrack)
  }

  @discardableResult
  func unrepostTrack(_ params: UnrepostTrackParams) async throws -> UnrepostTrackTypedResponse {
    let response = try await perform(
      .unrepostTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnrepostTrackTypedResponse.self, operation: .unrepostTrack)
  }

  @discardableResult
  func updateTrack(_ params: UpdateTrackParams) async throws -> UpdateTrackTypedResponse {
    let response = try await perform(
      .updateTrack,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UpdateTrackTypedResponse.self, operation: .updateTrack)
  }

}

public extension TypedUsersAPI {
  @discardableResult
  func addManager(_ params: AddManagerParams) async throws -> AddManagerTypedResponse {
    let response = try await perform(
      .addManager,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(AddManagerTypedResponse.self, operation: .addManager)
  }

  @discardableResult
  func approveGrant(_ params: ApproveGrantParams) async throws -> ApproveGrantTypedResponse {
    let response = try await perform(
      .approveGrant,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(ApproveGrantTypedResponse.self, operation: .approveGrant)
  }

  @discardableResult
  func createGrant(_ params: CreateGrantParams) async throws -> CreateGrantTypedResponse {
    let response = try await perform(
      .createGrant,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateGrantTypedResponse.self, operation: .createGrant)
  }

  @discardableResult
  func createUser(_ params: CreateUserParams) async throws -> CreateUserTypedResponse {
    let response = try await perform(
      .createUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(CreateUserTypedResponse.self, operation: .createUser)
  }

  @discardableResult
  func downloadPurchasesAsCsv(_ params: DownloadPurchasesAsCsvParams) async throws -> DownloadPurchasesAsCsvTypedResponse {
    let response = try await perform(
      .downloadPurchasesAsCsv,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return response
  }

  @discardableResult
  func downloadSalesAsCsv(_ params: DownloadSalesAsCsvParams) async throws -> DownloadSalesAsCsvTypedResponse {
    let response = try await perform(
      .downloadSalesAsCsv,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return response
  }

  @discardableResult
  func downloadSalesAsJson(_ params: DownloadSalesAsJsonParams) async throws -> DownloadSalesAsJsonTypedResponse {
    let response = try await perform(
      .downloadSalesAsJson,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(DownloadSalesAsJsonTypedResponse.self, operation: .downloadSalesAsJson)
  }

  @discardableResult
  func downloadUsdcWithdrawalsAsCsv(_ params: DownloadUsdcWithdrawalsAsCsvParams) async throws -> DownloadUsdcWithdrawalsAsCsvTypedResponse {
    let response = try await perform(
      .downloadUsdcWithdrawalsAsCsv,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return response
  }

  @discardableResult
  func followUser(_ params: FollowUserParams) async throws -> FollowUserTypedResponse {
    let response = try await perform(
      .followUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(FollowUserTypedResponse.self, operation: .followUser)
  }

  @discardableResult
  func getAiAttributedTracksByUserHandle(_ params: GetAiAttributedTracksByUserHandleParams) async throws -> GetAiAttributedTracksByUserHandleTypedResponse {
    let response = try await perform(
      .getAiAttributedTracksByUserHandle,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetAiAttributedTracksByUserHandleTypedResponse.self, operation: .getAiAttributedTracksByUserHandle)
  }

  @discardableResult
  func getAlbumsByUser(_ params: GetAlbumsByUserParams) async throws -> GetAlbumsByUserTypedResponse {
    let response = try await perform(
      .getAlbumsByUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetAlbumsByUserTypedResponse.self, operation: .getAlbumsByUser)
  }

  @discardableResult
  func getAuthorizedApps(_ params: GetAuthorizedAppsParams) async throws -> GetAuthorizedAppsTypedResponse {
    let response = try await perform(
      .getAuthorizedApps,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetAuthorizedAppsTypedResponse.self, operation: .getAuthorizedApps)
  }

  @discardableResult
  func getBulkUsers(_ params: GetBulkUsersParams = .init()) async throws -> GetBulkUsersTypedResponse {
    let response = try await perform(
      .getBulkUsers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetBulkUsersTypedResponse.self, operation: .getBulkUsers)
  }

  @discardableResult
  func getConnectedWallets(_ params: GetConnectedWalletsParams) async throws -> GetConnectedWalletsTypedResponse {
    let response = try await perform(
      .getConnectedWallets,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetConnectedWalletsTypedResponse.self, operation: .getConnectedWallets)
  }

  @discardableResult
  func getFavorites(_ params: GetFavoritesParams) async throws -> GetFavoritesTypedResponse {
    let response = try await perform(
      .getFavorites,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetFavoritesTypedResponse.self, operation: .getFavorites)
  }

  @discardableResult
  func getFollowers(_ params: GetFollowersParams) async throws -> GetFollowersTypedResponse {
    let response = try await perform(
      .getFollowers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetFollowersTypedResponse.self, operation: .getFollowers)
  }

  @discardableResult
  func getFollowing(_ params: GetFollowingParams) async throws -> GetFollowingTypedResponse {
    let response = try await perform(
      .getFollowing,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetFollowingTypedResponse.self, operation: .getFollowing)
  }

  @discardableResult
  func getMutedUsers(_ params: GetMutedUsersParams) async throws -> GetMutedUsersTypedResponse {
    let response = try await perform(
      .getMutedUsers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetMutedUsersTypedResponse.self, operation: .getMutedUsers)
  }

  @discardableResult
  func getMutualFollowers(_ params: GetMutualFollowersParams) async throws -> GetMutualFollowersTypedResponse {
    let response = try await perform(
      .getMutualFollowers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetMutualFollowersTypedResponse.self, operation: .getMutualFollowers)
  }

  @discardableResult
  func getPlaylistsByUser(_ params: GetPlaylistsByUserParams) async throws -> GetPlaylistsByUserTypedResponse {
    let response = try await perform(
      .getPlaylistsByUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPlaylistsByUserTypedResponse.self, operation: .getPlaylistsByUser)
  }

  @discardableResult
  func getPurchasers(_ params: GetPurchasersParams) async throws -> GetPurchasersTypedResponse {
    let response = try await perform(
      .getPurchasers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetPurchasersTypedResponse.self, operation: .getPurchasers)
  }

  @discardableResult
  func getRelatedUsers(_ params: GetRelatedUsersParams) async throws -> GetRelatedUsersTypedResponse {
    let response = try await perform(
      .getRelatedUsers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRelatedUsersTypedResponse.self, operation: .getRelatedUsers)
  }

  @discardableResult
  func getRemixers(_ params: GetRemixersParams) async throws -> GetRemixersTypedResponse {
    let response = try await perform(
      .getRemixers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRemixersTypedResponse.self, operation: .getRemixers)
  }

  @discardableResult
  func getReposts(_ params: GetRepostsParams) async throws -> GetRepostsTypedResponse {
    let response = try await perform(
      .getReposts,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetRepostsTypedResponse.self, operation: .getReposts)
  }

  @discardableResult
  func getSalesAggregate(_ params: GetSalesAggregateParams) async throws -> GetSalesAggregateTypedResponse {
    let response = try await perform(
      .getSalesAggregate,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetSalesAggregateTypedResponse.self, operation: .getSalesAggregate)
  }

  @discardableResult
  func getSubscribers(_ params: GetSubscribersParams) async throws -> GetSubscribersTypedResponse {
    let response = try await perform(
      .getSubscribers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetSubscribersTypedResponse.self, operation: .getSubscribers)
  }

  @discardableResult
  func getSupportedUsers(_ params: GetSupportedUsersParams) async throws -> GetSupportedUsersTypedResponse {
    let response = try await perform(
      .getSupportedUsers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetSupportedUsersTypedResponse.self, operation: .getSupportedUsers)
  }

  @discardableResult
  func getSupporters(_ params: GetSupportersParams) async throws -> GetSupportersTypedResponse {
    let response = try await perform(
      .getSupporters,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetSupportersTypedResponse.self, operation: .getSupporters)
  }

  @discardableResult
  func getTopTrackTags(_ params: GetTopTrackTagsParams) async throws -> GetTopTrackTagsTypedResponse {
    let response = try await perform(
      .getTopTrackTags,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTopTrackTagsTypedResponse.self, operation: .getTopTrackTags)
  }

  @discardableResult
  func getTracksByUser(_ params: GetTracksByUserParams) async throws -> GetTracksByUserTypedResponse {
    let response = try await perform(
      .getTracksByUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTracksByUserTypedResponse.self, operation: .getTracksByUser)
  }

  @discardableResult
  func getTracksByUserHandle(_ params: GetTracksByUserHandleParams) async throws -> GetTracksByUserHandleTypedResponse {
    let response = try await perform(
      .getTracksByUserHandle,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTracksByUserHandleTypedResponse.self, operation: .getTracksByUserHandle)
  }

  @discardableResult
  func getTracksCountByUser(_ params: GetTracksCountByUserParams) async throws -> GetTracksCountByUserTypedResponse {
    let response = try await perform(
      .getTracksCountByUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetTracksCountByUserTypedResponse.self, operation: .getTracksCountByUser)
  }

  @discardableResult
  func getUser(_ params: GetUserParams) async throws -> GetUserTypedResponse {
    let response = try await perform(
      .getUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserTypedResponse.self, operation: .getUser)
  }

  @discardableResult
  func getUserBalanceHistory(_ params: GetUserBalanceHistoryParams) async throws -> GetUserBalanceHistoryTypedResponse {
    let response = try await perform(
      .getUserBalanceHistory,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserBalanceHistoryTypedResponse.self, operation: .getUserBalanceHistory)
  }

  @discardableResult
  func getUserByHandle(_ params: GetUserByHandleParams) async throws -> GetUserByHandleTypedResponse {
    let response = try await perform(
      .getUserByHandle,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserByHandleTypedResponse.self, operation: .getUserByHandle)
  }

  @discardableResult
  func getUserChallenges(_ params: GetUserChallengesParams) async throws -> GetUserChallengesTypedResponse {
    let response = try await perform(
      .getUserChallenges,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserChallengesTypedResponse.self, operation: .getUserChallenges)
  }

  @discardableResult
  func getUserCoin(_ params: GetUserCoinParams) async throws -> GetUserCoinTypedResponse {
    let response = try await perform(
      .getUserCoin,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserCoinTypedResponse.self, operation: .getUserCoin)
  }

  @discardableResult
  func getUserCoins(_ params: GetUserCoinsParams) async throws -> GetUserCoinsTypedResponse {
    let response = try await perform(
      .getUserCoins,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserCoinsTypedResponse.self, operation: .getUserCoins)
  }

  @discardableResult
  func getUserCollectibles(_ params: GetUserCollectiblesParams) async throws -> GetUserCollectiblesTypedResponse {
    let response = try await perform(
      .getUserCollectibles,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserCollectiblesTypedResponse.self, operation: .getUserCollectibles)
  }

  @discardableResult
  func getUserComments(_ params: GetUserCommentsParams) async throws -> GetUserCommentsTypedResponse {
    let response = try await perform(
      .getUserComments,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserCommentsTypedResponse.self, operation: .getUserComments)
  }

  @discardableResult
  func getUserEmailKey(_ params: GetUserEmailKeyParams) async throws -> GetUserEmailKeyTypedResponse {
    let response = try await perform(
      .getUserEmailKey,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserEmailKeyTypedResponse.self, operation: .getUserEmailKey)
  }

  @discardableResult
  func getUserIdsByAddresses(_ params: GetUserIdsByAddressesParams) async throws -> GetUserIdsByAddressesTypedResponse {
    let response = try await perform(
      .getUserIdsByAddresses,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserIdsByAddressesTypedResponse.self, operation: .getUserIdsByAddresses)
  }

  @discardableResult
  func getUserMonthlyTrackListens(_ params: GetUserMonthlyTrackListensParams) async throws -> GetUserMonthlyTrackListensTypedResponse {
    let response = try await perform(
      .getUserMonthlyTrackListens,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserMonthlyTrackListensTypedResponse.self, operation: .getUserMonthlyTrackListens)
  }

  @discardableResult
  func getUserRecommendedTracks(_ params: GetUserRecommendedTracksParams) async throws -> GetUserRecommendedTracksTypedResponse {
    let response = try await perform(
      .getUserRecommendedTracks,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserRecommendedTracksTypedResponse.self, operation: .getUserRecommendedTracks)
  }

  @discardableResult
  func getUserSTrackHistory(_ params: GetUserSTrackHistoryParams) async throws -> GetUserSTrackHistoryTypedResponse {
    let response = try await perform(
      .getUserSTrackHistory,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserSTrackHistoryTypedResponse.self, operation: .getUserSTrackHistory)
  }

  @discardableResult
  func getUserTracksRemixed(_ params: GetUserTracksRemixedParams) async throws -> GetUserTracksRemixedTypedResponse {
    let response = try await perform(
      .getUserTracksRemixed,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetUserTracksRemixedTypedResponse.self, operation: .getUserTracksRemixed)
  }

  @discardableResult
  func muteUser(_ params: MuteUserParams) async throws -> MuteUserTypedResponse {
    let response = try await perform(
      .muteUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(MuteUserTypedResponse.self, operation: .muteUser)
  }

  @discardableResult
  func removeManager(_ params: RemoveManagerParams) async throws -> RemoveManagerTypedResponse {
    let response = try await perform(
      .removeManager,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(RemoveManagerTypedResponse.self, operation: .removeManager)
  }

  @discardableResult
  func revokeGrant(_ params: RevokeGrantParams) async throws -> RevokeGrantTypedResponse {
    let response = try await perform(
      .revokeGrant,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(RevokeGrantTypedResponse.self, operation: .revokeGrant)
  }

  @discardableResult
  func searchUsers(_ params: SearchUsersParams = .init()) async throws -> SearchUsersTypedResponse {
    let response = try await perform(
      .searchUsers,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(SearchUsersTypedResponse.self, operation: .searchUsers)
  }

  @discardableResult
  func subscribeToUser(_ params: SubscribeToUserParams) async throws -> SubscribeToUserTypedResponse {
    let response = try await perform(
      .subscribeToUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(SubscribeToUserTypedResponse.self, operation: .subscribeToUser)
  }

  @discardableResult
  func unfollowUser(_ params: UnfollowUserParams) async throws -> UnfollowUserTypedResponse {
    let response = try await perform(
      .unfollowUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnfollowUserTypedResponse.self, operation: .unfollowUser)
  }

  @discardableResult
  func unmuteUser(_ params: UnmuteUserParams) async throws -> UnmuteUserTypedResponse {
    let response = try await perform(
      .unmuteUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnmuteUserTypedResponse.self, operation: .unmuteUser)
  }

  @discardableResult
  func unsubscribeFromUser(_ params: UnsubscribeFromUserParams) async throws -> UnsubscribeFromUserTypedResponse {
    let response = try await perform(
      .unsubscribeFromUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UnsubscribeFromUserTypedResponse.self, operation: .unsubscribeFromUser)
  }

  @discardableResult
  func updateUser(_ params: UpdateUserParams) async throws -> UpdateUserTypedResponse {
    let response = try await perform(
      .updateUser,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(UpdateUserTypedResponse.self, operation: .updateUser)
  }

  @discardableResult
  func verifyIdToken(_ params: VerifyIdTokenParams) async throws -> VerifyIdTokenTypedResponse {
    let response = try await perform(
      .verifyIdToken,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(VerifyIdTokenTypedResponse.self, operation: .verifyIdToken)
  }

}

public extension TypedWalletAPI {
  @discardableResult
  func getWalletCoins(_ params: GetWalletCoinsParams) async throws -> GetWalletCoinsTypedResponse {
    let response = try await perform(
      .getWalletCoins,
      pathParameters: params.pathParameters(),
      queryItems: try params.queryItems(),
      headers: try params.headerValues(),
      body: try params.encodedBody()
    )
    return try response.decodeTyped(GetWalletCoinsTypedResponse.self, operation: .getWalletCoins)
  }

}
