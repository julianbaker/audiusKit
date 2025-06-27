import Foundation
import SwiftUI

#if os(iOS) || os(tvOS) || os(visionOS)
  import UIKit
#elseif os(macOS)
  import AppKit
#else
  #error("Unsupported platform: CacheManager image caching is not defined for this OS.")
#endif

/// A manager for caching metadata and images
public actor CacheManager {
  // MARK: - Singleton

  private static var instance: CacheManager?

  public static var shared: CacheManager {
    if let instance = instance {
      return instance
    }

    if instance == nil {
      instance = CacheManager()
    }
    return instance!
  }

  private let metadataCache: LRUCache<String, CacheEntry>
  private let imageCache = NSCache<NSString, SendableImage>()
  private var cacheTimeout: TimeInterval
  private let maxMetadataEntries = 100  // Maximum number of metadata entries to keep

  // Track IDs that should not be purged from cache
  private var protectedTrackIds: Set<String> = []

  // Lazy initialization of track purge stream
  private lazy var trackPurgeStream: (AsyncStream<String>, AsyncStream<String>.Continuation) = {
    AsyncStream<String>.makeStream()
  }()

  private var trackPurgeContinuation: AsyncStream<String>.Continuation? {
    trackPurgeStream.1
  }

  private var isStreamProcessingStarted = false

  private init(cacheTimeout: TimeInterval = 3600) {  // Default 1 hour
    self.cacheTimeout = cacheTimeout
    // Initialize LRU cache with max size
    metadataCache = LRUCache(capacity: maxMetadataEntries)

    // Set image cache limits
    imageCache.countLimit = 100  // Maximum number of images
    imageCache.totalCostLimit = 50 * 1024 * 1024  // 50 MB limit for images
  }

  // MARK: - Initialization

  public static func initialize(cacheTimeout: TimeInterval = 3600) async {
    if instance == nil {
      instance = CacheManager(cacheTimeout: cacheTimeout)
    } else {
      await instance?.updateCacheTimeout(cacheTimeout)
    }
    await instance?.setup()
  }

  private func updateCacheTimeout(_ timeout: TimeInterval) {
    cacheTimeout = timeout
  }

  private func setup() async {
    // Start processing track purge requests lazily
    startStreamProcessingIfNeeded()
  }

  private func startStreamProcessingIfNeeded() {
    guard !isStreamProcessingStarted else { return }
    isStreamProcessingStarted = true

    let stream = trackPurgeStream.0

    Task.detached(priority: .utility) { [weak self] in
      guard let self = self else { return }

      for await trackId in stream {
        await self.processTrackPurgeRequest(trackId)
      }
    }
  }

  // MARK: - Track Protection

  public func protectTrack(_ trackId: String) {
    protectedTrackIds.insert(trackId)
  }

  public func unprotectTrack(_ trackId: String) {
    protectedTrackIds.remove(trackId)
    // Immediately remove the track from cache
    let key = "track_\(trackId)"
    metadataCache.removeValue(forKey: key)
  }

  func requestTrackPurge(_ trackId: String) {
    startStreamProcessingIfNeeded()
    trackPurgeContinuation?.yield(trackId)
  }

  private func processTrackPurgeRequest(_ trackId: String) async {
    let key = "track_\(trackId)"
    if !protectedTrackIds.contains(trackId) {
      metadataCache.removeValue(forKey: key)
    }
  }

  // MARK: - Metadata Caching

  public func cacheMetadata<T: Codable>(_ data: T, forKey key: String) async {
    let entry = CacheEntry(data: data, timestamp: Date())
    metadataCache.setValue(entry, forKey: key)
  }

  public func getCachedMetadata<T: Codable>(forKey key: String) async -> T? {
    guard let entry = metadataCache.getValue(key) else { return nil }

    // Check if cache has expired
    if Date().timeIntervalSince(entry.timestamp) > cacheTimeout {
      metadataCache.removeValue(forKey: key)
      return nil
    }

    return entry.data as? T
  }

  public func removeMetadata(forKey key: String) {
    metadataCache.removeValue(forKey: key)
  }

  // MARK: - Image Caching

  public func cacheImage(_ image: PlatformImage, forKey key: String) {
    let sendableImage = SendableImage(image)
    imageCache.setObject(sendableImage, forKey: key as NSString)
  }

  public func getCachedImage(forKey key: String) -> SendableImage? {
    return imageCache.object(forKey: key as NSString)
  }

  public func removeImage(forKey key: String) {
    imageCache.removeObject(forKey: key as NSString)
  }

  // MARK: - Cache Management

  public func clearAllCaches() {
    metadataCache.removeAll()
    imageCache.removeAllObjects()
    protectedTrackIds.removeAll()
  }

  public func clearExpiredCache() async {
    // Get all keys and check each entry for expiration
    let keys = metadataCache.allKeys
    for key in keys {
      if let entry = metadataCache.getValue(key),
        Date().timeIntervalSince(entry.timestamp) > cacheTimeout
      {
        // Extract track ID from key if it's a track metadata key
        if key.hasPrefix("track_") {
          let trackId = String(key.dropFirst(6))  // Remove "track_" prefix
          // Only remove if track is not protected
          if !protectedTrackIds.contains(trackId) {
            metadataCache.removeValue(forKey: key)
          }
        } else {
          metadataCache.removeValue(forKey: key)
        }
      }
    }
  }

  public func clearCache() {
    metadataCache.removeAll()
    imageCache.removeAllObjects()
    protectedTrackIds.removeAll()
  }
}

// MARK: - Cache Entry

private struct CacheEntry {
  let data: Any
  let timestamp: Date
}

// MARK: - LRU Cache Implementation

private class LRUCache<Key: Hashable, Value> {
  private let capacity: Int
  private var cache = [Key: Node]()
  private let head = Node(key: nil, value: nil)
  private let tail = Node(key: nil, value: nil)

  private class Node {
    let key: Key?
    var value: Value?
    var prev: Node?
    var next: Node?

    init(key: Key?, value: Value?) {
      self.key = key
      self.value = value
    }
  }

  init(capacity: Int) {
    self.capacity = capacity
    head.next = tail
    tail.prev = head
  }

  func getValue(_ key: Key) -> Value? {
    guard let node = cache[key] else { return nil }

    // Move to head (most recently used)
    moveToHead(node)
    return node.value
  }

  func setValue(_ value: Value, forKey key: Key) {
    if let existingNode = cache[key] {
      // Update existing node
      existingNode.value = value
      moveToHead(existingNode)
    } else {
      // Create new node
      let newNode = Node(key: key, value: value)
      cache[key] = newNode
      addToHead(newNode)

      // Remove oldest if over capacity
      if cache.count > capacity {
        let tail = removeTail()
        if let tailKey = tail.key {
          cache.removeValue(forKey: tailKey)
        }
      }
    }
  }

  func removeValue(forKey key: Key) {
    if let node = cache[key] {
      cache.removeValue(forKey: key)
      removeNode(node)
    }
  }

  func removeAll() {
    cache.removeAll()
    head.next = tail
    tail.prev = head
  }

  var allKeys: [Key] {
    return Array(cache.keys)
  }

  // MARK: - Private Methods

  private func addToHead(_ node: Node) {
    node.prev = head
    node.next = head.next
    head.next?.prev = node
    head.next = node
  }

  private func removeNode(_ node: Node) {
    node.prev?.next = node.next
    node.next?.prev = node.prev
  }

  private func moveToHead(_ node: Node) {
    removeNode(node)
    addToHead(node)
  }

  private func removeTail() -> Node {
    let lastNode = tail.prev!
    removeNode(lastNode)
    return lastNode
  }
}
