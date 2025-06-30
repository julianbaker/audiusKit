import Foundation
import Network
import OSLog

/// A client for interacting with the Audius API
public actor AudiusAPIClient {
  // MARK: - Singleton

  private static var instance: AudiusAPIClient?
  private static let instanceLock = NSLock()
  private static var configuredAppName: String?

  /// Call this before initialize() to set a custom app name for API attribution.
  public static func configure(appName: String) {
    configuredAppName = appName
  }

  public static var shared: AudiusAPIClient {
    if let instance = instance {
      return instance
    }

    instanceLock.lock()
    defer { instanceLock.unlock() }

    if instance == nil {
      let appName = configuredAppName ?? "AudiusKit"
      instance = AudiusAPIClient(appName: appName)
    }
    return instance!
  }

  private static var isInitialized = false
  private static let initializationLock = NSLock()

  // MARK: - Properties

  private let session: URLSession
  private let decoder: JSONDecoder
  private let appName: String
  private let logger = Logger(subsystem: "com.audiusswift.client", category: "networking")
  private let monitor = NWPathMonitor()
  private var networkUpdateTask: Task<Void, Never>?

  // Break circular dependency by making this lazy
  private var cacheManager: CacheManager {
    CacheManager.shared
  }

  // Track which items are in the queue to protect from cache purging
  private var queuedTrackIds: Set<String> = []

  private var isNetworkAvailable = false
  private var currentInterface: NWInterface.InterfaceType?
  private var host: String?
  private var lastHostRefresh: Date?
  private let hostRefreshInterval: TimeInterval = 300  // 5 minutes
  private let discoveryURL = URL(string: "https://api.audius.co")!

  // MARK: - Response Models

  private struct ApiResponse<T: Codable>: Codable {
    let data: T
  }

  private struct TracksResponse: Codable {
    let data: [Track]
  }

  private struct TrackResponse: Codable {
    let data: Track
  }

  private struct UsersResponse: Codable {
    let data: [Track.User]
  }

  private struct UserResponse: Codable {
    let data: Track.User
  }

  private struct HostResponse: Codable {
    let data: [String]
  }

  private struct UserIdFromWalletResponse: Codable {
    let data: UserIdFromWallet
  }

  private init(session: URLSession = .shared, appName: String = "AudiusKit") {
    self.session = session
    self.decoder = JSONDecoder()
    self.decoder.dateDecodingStrategy = .iso8601
    self.appName = appName
  }

  // MARK: - Initialization

  public static func initialize() async throws {
    // Check if already initialized without blocking
    if isInitialized { return }

    // Use async-safe initialization pattern
    try await withCheckedThrowingContinuation { continuation in
      initializationLock.lock()
      defer { initializationLock.unlock() }

      // Double-check after acquiring lock
      if isInitialized {
        continuation.resume()
        return
      }

      let client = Self.shared
      Task {
        do {
          try await client.setup()
          isInitialized = true
          continuation.resume()
        } catch {
          continuation.resume(throwing: error)
        }
      }
    }
  }

  private func setup() async throws {
    // Start network monitoring on background queue first
    let monitorQueue = DispatchQueue(label: "com.audiusswift.networkmonitor", qos: .utility)

    await withCheckedContinuation { continuation in
      monitor.pathUpdateHandler = { [weak self] path in
        guard let self = self else { return }
        Task {
          await self.handleNetworkPathUpdate(path)
        }
      }

      // Start monitoring asynchronously
      DispatchQueue.global(qos: .utility).async {
        self.monitor.start(queue: monitorQueue)
        continuation.resume()
      }
    }

    // Set initial network state
    let currentPath = monitor.currentPath
    isNetworkAvailable = currentPath.status == .satisfied
    currentInterface = currentPath.availableInterfaces.first?.type

    // Pre-warm host discovery in background if network is available
    if isNetworkAvailable {
      Task.detached(priority: .utility) { [weak self] in
        try? await self?.preWarmHostDiscovery()
      }
    }

    if isNetworkAvailable {
      logger.info("Network connection is available at initialization")
    } else {
      logger.notice("Network connection is not available at initialization")
    }
  }

  private func preWarmHostDiscovery() async throws {
    guard host == nil else { return }
    do {
      let discoveredHost = try await discoverHost()
      host = discoveredHost
      lastHostRefresh = Date()
      logger.info("Pre-warmed host discovery: \(discoveredHost)")
    } catch {
      logger.notice("Failed to pre-warm host discovery: \(error.localizedDescription)")
    }
  }

  deinit {
    networkUpdateTask?.cancel()
    monitor.cancel()
  }

  // MARK: - Host Discovery

  private func discoverHost() async throws -> String {
    logger.info("Starting host discovery from \(self.discoveryURL)")

    guard isNetworkAvailable else {
      logger.error("Cannot discover host - network is unavailable")
      throw AudiusAPIError.networkError(
        NSError(
          domain: "com.audiusswift.client", code: -1,
          userInfo: [NSLocalizedDescriptionKey: "No network connection available"]))
    }

    do {
      logger.debug("Making request to discovery endpoint")
      let (data, response) = try await session.data(from: discoveryURL)
      logger.debug("Received response from discovery endpoint")

      guard let httpResponse = response as? HTTPURLResponse else {
        logger.error("Invalid response type from discovery endpoint")
        throw AudiusAPIError.invalidResponse
      }

      logger.debug("Discovery endpoint status code: \(httpResponse.statusCode)")
      logger.debug("Discovery endpoint headers: \(httpResponse.allHeaderFields)")

      guard (200...299).contains(httpResponse.statusCode) else {
        logger.error("Discovery endpoint returned error status: \(httpResponse.statusCode)")
        throw AudiusAPIError.apiError("HTTP \(httpResponse.statusCode)")
      }

      let dataString = String(data: data, encoding: .utf8) ?? "Unable to decode response"
      logger.debug("Discovery endpoint raw response: \(dataString)")

      let hostResponse = try decoder.decode(HostResponse.self, from: data)
      logger.debug("Decoded host response with \(hostResponse.data.count) hosts")
      logger.debug("Available hosts: \(hostResponse.data)")

      guard let host = hostResponse.data.first else {
        logger.error("No hosts available in response")
        throw AudiusAPIError.noHostsAvailable
      }

      logger.info("Successfully discovered host: \(host)")
      return host

    } catch let error as DecodingError {
      logger.error("Failed to decode host response: \(error.localizedDescription)")
      switch error {
      case .dataCorrupted(let context):
        logger.error("Data corrupted: \(context.debugDescription)")
      case .keyNotFound(let key, let context):
        logger.error("Key not found: \(key.stringValue) - \(context.debugDescription)")
      case .typeMismatch(let type, let context):
        logger.error("Type mismatch: \(type) - \(context.debugDescription)")
      case .valueNotFound(let type, let context):
        logger.error("Value not found: \(type) - \(context.debugDescription)")
      @unknown default:
        logger.error("Unknown decoding error: \(error.localizedDescription)")
      }
      throw AudiusAPIError.decodingError(error)
    } catch {
      logger.error("Host discovery failed: \(error.localizedDescription)")
      throw AudiusAPIError.networkError(error)
    }
  }

  private func getHost() async throws -> String {
    // Check if we need to refresh the host
    if let lastRefresh = lastHostRefresh,
      Date().timeIntervalSince(lastRefresh) > hostRefreshInterval
    {
      logger.info("Host refresh interval exceeded, discovering new host")
      host = nil
    }

    if let existingHost = host {
      logger.debug("Using cached host: \(existingHost)")
      return existingHost
    }

    logger.info("No cached host available, discovering new host")
    let discoveredHost = try await discoverHost()
    host = discoveredHost
    lastHostRefresh = Date()
    return discoveredHost
  }

  // MARK: - Private Methods

  private func constructURL(path: String, queryItems: [URLQueryItem] = []) async throws -> URL {
    let host = try await getHost()
    logger.debug("Constructing URL with host: \(host)")

    var components = URLComponents(string: "\(host)/v1/\(path)")
    logger.debug("Base URL components: \(String(describing: components))")

    // Always include app_name
    var allQueryItems = queryItems
    allQueryItems.append(URLQueryItem(name: "app_name", value: appName))
    components?.queryItems = allQueryItems
    logger.debug("Final query items: \(String(describing: allQueryItems))")

    guard let url = components?.url else {
      logger.error("Failed to construct URL for path: \(path)")
      throw AudiusAPIError.invalidURL
    }

    logger.debug("Final constructed URL: \(url)")
    return url
  }

  private func fetch<T: Decodable>(url: URL) async throws -> T {
    logger.debug("Starting fetch request for URL: \(url)")

    do {
      let (data, response) = try await session.data(from: url)
      logger.debug("Received response with data length: \(data.count)")

      guard let httpResponse = response as? HTTPURLResponse else {
        logger.error("Invalid response type")
        throw AudiusAPIError.invalidResponse
      }

      logger.debug("Response status code: \(httpResponse.statusCode)")
      logger.debug("Response headers: \(httpResponse.allHeaderFields)")

      if httpResponse.statusCode == 404 {
        logger.error("Host unavailable: \(url.host ?? "unknown")")
        throw AudiusAPIError.hostUnavailable(url.host ?? "unknown")
      }

      guard (200...299).contains(httpResponse.statusCode) else {
        logger.error("Error status code: \(httpResponse.statusCode)")
        throw AudiusAPIError.apiError("HTTP \(httpResponse.statusCode)")
      }

      do {
        let decoded = try decoder.decode(T.self, from: data)
        logger.info("Successfully decoded response")
        return decoded
      } catch let error as DecodingError {
        logger.error("Decoding error: \(error.localizedDescription)")
        switch error {
        case .dataCorrupted(let context):
          logger.error("Data corrupted: \(context.debugDescription)")
        case .keyNotFound(let key, let context):
          logger.error("Key not found: \(key.stringValue) - \(context.debugDescription)")
        case .typeMismatch(let type, let context):
          logger.error("Type mismatch: \(type) - \(context.debugDescription)")
        case .valueNotFound(let type, let context):
          logger.error("Value not found: \(type) - \(context.debugDescription)")
        @unknown default:
          logger.error("Unknown decoding error: \(error.localizedDescription)")
        }
        throw AudiusAPIError.decodingError(error)
      }
    } catch let error as AudiusAPIError {
      logger.error("AudiusAPIError: \(error.localizedDescription)")
      throw error
    } catch {
      logger.error("Network error: \(error.localizedDescription)")
      throw AudiusAPIError.networkError(error)
    }
  }

  // MARK: - Public Methods

  /// Fetches trending tracks with pagination support
  /// - Parameters:
  ///   - genre: Optional genre to filter tracks by
  ///   - timeRange: Optional time range to calculate trending over (default: week)
  ///   - offset: Number of tracks to skip (for pagination)
  ///   - limit: Maximum number of tracks to return (default: 20)
  ///   - forceRefresh: Whether to bypass cache
  /// - Returns: Array of Track objects
  public func fetchTrendingTracks(
    genre: String? = nil,
    timeRange: TimeRange = .week,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track] {
    // Defensive: treat negative offset/limit as zero
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    try await ensureInitialized()
    let cacheKey =
      "trending_tracks_\(genre ?? "all")_\(timeRange.rawValue)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cachedTracks: [Track] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cachedTracks
      }
    }
    logger.info(
      "Fetching trending tracks (genre: \(genre ?? "none"), time: \(timeRange.rawValue), offset: \(safeOffset), limit: \(safeLimit))"
    )
    var queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
      URLQueryItem(name: "time", value: timeRange.rawValue),
    ]
    if let genre = genre {
      queryItems.append(URLQueryItem(name: "genre", value: genre))
    }
    let url = try await constructURL(path: "tracks/trending", queryItems: queryItems)
    logger.debug("Requesting trending tracks from URL: \(url)")
    let response: TracksResponse = try await fetch(url: url)
    let limitedTracks = Array(response.data.prefix(safeLimit))
    await cacheManager.cacheMetadata(limitedTracks, forKey: cacheKey)
    return limitedTracks
  }

  /// Fetches trending tracks with optional genre and time range filtering (legacy, no offset)
  /// - Parameters:
  ///   - genre: Optional genre to filter tracks by
  ///   - timeRange: Optional time range to calculate trending over (default: week)
  ///   - limit: Maximum number of tracks to return (default: 20)
  ///   - forceRefresh: Whether to bypass cache
  /// - Returns: Array of Track objects
  public func fetchTrendingTracks(
    genre: String? = nil,
    timeRange: TimeRange = .week,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track] {
    return try await fetchTrendingTracks(
      genre: genre,
      timeRange: timeRange,
      offset: 0,
      limit: limit,
      forceRefresh: forceRefresh
    )
  }

  /// Fetches details for a specific track
  /// - Parameter id: The track identifier
  /// - Returns: A Track object
  public func fetchTrack(id: String, forceRefresh: Bool = false) async throws -> Track {
    let cacheKey = "track_\(id)"

    if !forceRefresh {
      if let cachedTrack: Track = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cachedTrack
      }
    }

    logger.info("Fetching track details for ID: \(id)")

    let url = try await constructURL(path: "tracks/\(id)")
    logger.debug("Requesting track details from URL: \(url)")
    let response: TrackResponse = try await fetch(url: url)

    // Cache the result
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)

    return response.data
  }

  /// Searches for tracks matching the query
  /// - Parameters:
  ///   - query: Search query string
  ///   - limit: Maximum number of tracks to return (default: 20)
  /// - Returns: Array of Track objects
  public func searchTracks(query: String, limit: Int = 20) async throws -> [Track] {
    logger.info("Searching tracks with query: \(query), limit: \(limit)")

    let queryItems = [
      URLQueryItem(name: "query", value: query),
      URLQueryItem(name: "limit", value: String(limit)),
    ]

    let url = try await constructURL(path: "tracks/search", queryItems: queryItems)
    logger.debug("Requesting search results from URL: \(url)")
    let response: TracksResponse = try await fetch(url: url)
    return response.data
  }

  /// Fetches the streaming URL for a track
  /// - Parameter trackId: The track identifier
  /// - Returns: The streaming URL as a string
  public func fetchStreamUrl(trackId: String) async throws -> String {
    logger.info("Fetching stream URL for track ID: \(trackId)")

    let url = try await constructURL(path: "tracks/\(trackId)/stream")

    // Verify the stream URL is valid with a HEAD request
    var request = URLRequest(url: url)
    request.httpMethod = "HEAD"

    let (_, response) = try await session.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
      logger.error("Invalid response type")
      throw AudiusAPIError.invalidResponse
    }

    guard (200...299).contains(httpResponse.statusCode) else {
      logger.error("Stream URL returned error status: \(httpResponse.statusCode)")
      throw AudiusAPIError.apiError("HTTP \(httpResponse.statusCode)")
    }

    return url.absoluteString
  }

  // MARK: - Users

  /// Fetches details for a specific user
  /// - Parameter userId: The user identifier
  /// - Returns: A User object
  public func fetchUserProfile(userId: String, forceRefresh: Bool = false) async throws
    -> Track.User
  {
    let cacheKey = "user_\(userId)"

    if !forceRefresh {
      if let cachedUser: Track.User = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cachedUser
      }
    }

    logger.info("Fetching user profile for ID: \(userId)")

    let url = try await constructURL(path: "users/\(userId)")
    logger.debug("Requesting user profile from URL: \(url)")
    let response: UserResponse = try await fetch(url: url)

    // Cache the result
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)

    return response.data
  }

  /// Fetches tracks for a specific user with pagination
  /// - Parameters:
  ///   - userId: The user identifier
  ///   - offset: Number of tracks to skip (for pagination)
  ///   - limit: Maximum number of tracks to return (default: 20)
  ///   - forceRefresh: Whether to bypass cache
  /// - Returns: Array of Track objects
  public func fetchUserTracks(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "user_tracks_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cachedTracks: [Track] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cachedTracks
      }
    }
    logger.info(
      "Fetching tracks for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/tracks", queryItems: queryItems)
    logger.debug("Requesting user tracks from URL: \(url)")
    let response: TracksResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches followers for a user with pagination
  /// - Parameters:
  ///   - userId: The user identifier
  ///   - offset: Number of users to skip (for pagination)
  ///   - limit: Maximum number of users to return (default: 20)
  ///   - forceRefresh: Whether to bypass cache
  /// - Returns: Array of User objects
  public func fetchFollowers(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track.User] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "followers_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track.User] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching followers for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/followers", queryItems: queryItems)
    logger.debug("Requesting followers from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches users that the given user is following with pagination
  /// - Parameters:
  ///   - userId: The user identifier
  ///   - offset: Number of users to skip (for pagination)
  ///   - limit: Maximum number of users to return (default: 20)
  ///   - forceRefresh: Whether to bypass cache
  /// - Returns: Array of User objects
  public func fetchFollowing(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track.User] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "following_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track.User] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching following for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/following", queryItems: queryItems)
    logger.debug("Requesting following from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches supporters for a user with pagination
  public func fetchSupporters(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track.User] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "supporters_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track.User] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching supporters for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/supporters", queryItems: queryItems)
    logger.debug("Requesting supporters from URL: \(url)")
    do {
      let response: UsersResponse = try await fetch(url: url)
      await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
      return response.data
    } catch {
      logger.error("Decoding error or malformed data for supporters: \(error.localizedDescription)")
      // Defensive: return empty array if API returns malformed data
      return []
    }
  }

  /// Fetches users that the given user is supporting with pagination
  public func fetchSupporting(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track.User] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "supporting_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track.User] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching supporting for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/supporting", queryItems: queryItems)
    logger.debug("Requesting supporting from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches mutual followers for a user with pagination
  public func fetchMutuals(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track.User] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "mutuals_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track.User] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching mutuals for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/mutuals", queryItems: queryItems)
    logger.debug("Requesting mutuals from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches playlists for a user with pagination
  public func fetchUserPlaylists(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "playlists_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching playlists for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/playlists", queryItems: queryItems)
    logger.debug("Requesting playlists from URL: \(url)")
    let response: TracksResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches reposts for a user with pagination
  public func fetchUserReposts(
    userId: String,
    offset: Int = 0,
    limit: Int = 20,
    forceRefresh: Bool = false
  ) async throws -> [Track] {
    let safeOffset = max(0, offset)
    let safeLimit = max(0, limit)
    if safeLimit == 0 { return [] }
    let cacheKey = "reposts_\(userId)_\(safeOffset)_\(safeLimit)"
    if !forceRefresh {
      if let cached: [Track] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    logger.info(
      "Fetching reposts for user ID: \(userId), offset: \(safeOffset), limit: \(safeLimit)")
    let queryItems = [
      URLQueryItem(name: "limit", value: String(safeLimit)),
      URLQueryItem(name: "offset", value: String(safeOffset)),
    ]
    let url = try await constructURL(path: "users/\(userId)/reposts", queryItems: queryItems)
    logger.debug("Requesting reposts from URL: \(url)")
    do {
      let response: TracksResponse = try await fetch(url: url)
      await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
      return response.data
    } catch {
      logger.error("Decoding error or malformed data for reposts: \(error.localizedDescription)")
      // Defensive: return empty array if API returns malformed data
      return []
    }
  }

  /// Fetches the follower count for a user
  /// - Parameter userId: The user identifier
  /// - Returns: The number of followers
  public func fetchFollowerCount(userId: String) async throws -> Int {
    logger.info("Fetching follower count for user ID: \(userId)")

    let url = try await constructURL(path: "users/\(userId)/followers")
    logger.debug("Requesting followers from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    return response.data.count
  }

  /// Fetches the following count for a user
  /// - Parameter userId: The user identifier
  /// - Returns: The number of users being followed
  public func fetchFollowingCount(userId: String) async throws -> Int {
    logger.info("Fetching following count for user ID: \(userId)")

    let url = try await constructURL(path: "users/\(userId)/following")
    logger.debug("Requesting following from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    return response.data.count
  }

  /// Fetches a user ID from an associated wallet address
  /// - Parameter associatedWallet: The wallet address
  /// - Returns: The user ID as a String, or nil if not found
  public func fetchUserIdFromWallet(associatedWallet: String) async throws -> String? {
    let queryItems = [URLQueryItem(name: "associated_wallet", value: associatedWallet)]
    let url = try await constructURL(path: "users/id", queryItems: queryItems)
    logger.debug("Requesting user ID from wallet from URL: \(url)")
    let response: UserIdFromWalletResponse = try await fetch(url: url)
    return response.data.userId
  }

  /// Searches for users matching the query
  /// - Parameter query: Search query string
  /// - Returns: Array of User objects
  public func searchUsers(query: String, limit: Int = 20) async throws -> [Track.User] {
    let queryItems = [
      URLQueryItem(name: "query", value: query),
      URLQueryItem(name: "limit", value: String(limit)),
    ]
    let url = try await constructURL(path: "users/search", queryItems: queryItems)
    logger.debug("Requesting user search from URL: \(url)")
    let response: UsersResponse = try await fetch(url: url)
    return response.data
  }

  // MARK: - Queue Management

  /// Marks a track as queued to prevent it from being purged from the cache
  /// - Parameter trackId: The track identifier
  public func markTrackAsQueued(_ trackId: String) {
    queuedTrackIds.insert(trackId)
    Task {
      await cacheManager.protectTrack(trackId)
    }
    logger.debug("Marked track \(trackId) as queued")
  }

  /// Removes a track from the queue, allowing it to be purged from the cache
  /// - Parameter trackId: The track identifier
  public func unmarkTrackAsQueued(_ trackId: String) {
    queuedTrackIds.remove(trackId)
    Task {
      await cacheManager.unprotectTrack(trackId)
    }
    logger.debug("Unmarked track \(trackId) from queue")
  }

  // MARK: - Helper Methods

  private func ensureInitialized() async throws {
    // Ensure the client is properly initialized
    try await Self.initialize()

    // Just log the network state, don't throw errors
    if !isNetworkAvailable {
      logger.notice("Network connection may not be available")
    }
  }

  private func handleNetworkPathUpdate(_ path: NWPath) async {
    let wasAvailable = isNetworkAvailable
    isNetworkAvailable = path.status == .satisfied
    currentInterface = path.availableInterfaces.first?.type

    // Only log when status changes to avoid spam
    if wasAvailable != isNetworkAvailable {
      if isNetworkAvailable {
        logger.info("Network connection became available")
        if let host = host {
          logger.info("Current API host: \(host)")
        } else {
          logger.notice("No API host cached, will discover on next request")
        }
      } else {
        logger.error("Network connection became unavailable")
      }
    }
  }

  // MARK: - Playlists (Bulk & Permalink)
  /// Fetches multiple playlists by an array of IDs
  /// - Parameter ids: Array of playlist IDs
  /// - Returns: Array of Playlist objects
  public func fetchPlaylists(ids: [String], forceRefresh: Bool = false) async throws -> [Playlist] {
    guard !ids.isEmpty else { return [] }
    let cacheKey = "playlists_bulk_\(ids.joined(separator: ","))"
    if !forceRefresh {
      if let cached: [Playlist] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    let queryItems = ids.map { URLQueryItem(name: "id", value: $0) }
    let url = try await constructURL(path: "playlists", queryItems: queryItems)
    logger.debug("Requesting bulk playlists from URL: \(url)")
    let response: PlaylistsResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches a playlist by handle and slug (permalink)
  /// - Parameters:
  ///   - handle: The user's handle
  ///   - slug: The playlist slug
  /// - Returns: Playlist object
  public func fetchPlaylistByPermalink(handle: String, slug: String, forceRefresh: Bool = false)
    async throws -> Playlist?
  {
    let cacheKey = "playlist_permalink_\(handle)_\(slug)"
    if !forceRefresh {
      if let cached: Playlist = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    let path = "playlists/by_permalink/\(handle)/\(slug)"
    let url = try await constructURL(path: path)
    logger.debug("Requesting playlist by permalink from URL: \(url)")
    let response: PlaylistResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  // MARK: - Tracks (Bulk)
  /// Fetches multiple tracks by an array of IDs
  /// - Parameter ids: Array of track IDs
  /// - Returns: Array of Track objects
  public func fetchTracks(ids: [String], forceRefresh: Bool = false) async throws -> [Track] {
    guard !ids.isEmpty else { return [] }
    let cacheKey = "tracks_bulk_\(ids.joined(separator: ","))"
    if !forceRefresh {
      if let cached: [Track] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    let queryItems = ids.map { URLQueryItem(name: "id", value: $0) }
    let url = try await constructURL(path: "tracks", queryItems: queryItems)
    logger.debug("Requesting bulk tracks from URL: \(url)")
    let response: TracksResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }

  /// Fetches multiple tracks by an array of permalinks
  /// - Parameter permalinks: Array of track permalinks
  /// - Returns: Array of Track objects
  public func fetchTracksByPermalinks(permalinks: [String], forceRefresh: Bool = false) async throws
    -> [Track]
  {
    guard !permalinks.isEmpty else { return [] }
    let cacheKey = "tracks_bulk_permalinks_\(permalinks.joined(separator: ","))"
    if !forceRefresh {
      if let cached: [Track] = await cacheManager.getCachedMetadata(forKey: cacheKey) {
        return cached
      }
    }
    let queryItems = permalinks.map { URLQueryItem(name: "permalink", value: $0) }
    let url = try await constructURL(path: "tracks", queryItems: queryItems)
    logger.debug("Requesting bulk tracks by permalinks from URL: \(url)")
    let response: TracksResponse = try await fetch(url: url)
    await cacheManager.cacheMetadata(response.data, forKey: cacheKey)
    return response.data
  }
}

// MARK: - Network Path Extensions
extension NWPath {
  fileprivate func gatherProperties() -> [String] {
    var properties: [String] = []

    if isExpensive {
      properties.append("expensive")
    }
    if isConstrained {
      properties.append("constrained")
    }
    if usesInterfaceType(.wifi) {
      properties.append("wifi")
    }
    if usesInterfaceType(.cellular) {
      properties.append("cellular")
    }
    if usesInterfaceType(.wiredEthernet) {
      properties.append("wired")
    }

    return properties
  }
}
