# Architecture

## Overview

AudiusKit is designed with a focus on thread safety, performance, and ease of use. The architecture follows modern Swift best practices and leverages Swift's concurrency features.

## Core Components

### AudiusAPIClient

The main API client is implemented as an actor to ensure thread safety. Key features:

- Singleton pattern with thread-safe initialization
- Automatic host discovery and management
- Network monitoring
- Comprehensive error handling
- Async/await support throughout

### CacheManager

Manages caching of metadata and images:

- LRU cache for metadata with configurable size limit
- NSCache for images with memory limits
- Track protection system
- Automatic cache expiration
- Thread-safe operations

### SendableImage

A thread-safe wrapper for platform images:

- Cross-platform support (iOS/macOS)
- Proper equality comparison
- Thread-safe access

## Data Flow

1. **API Requests**:
   - Client makes request through AudiusAPIClient
   - Network monitoring ensures connection availability
   - Host discovery finds available API endpoints
   - Response is parsed and cached

2. **Caching**:
   - Metadata is stored in LRU cache
   - Images are stored in NSCache
   - Protected tracks are prevented from purging
   - Automatic cleanup of expired items

3. **Error Handling**:
   - Comprehensive error types
   - Detailed error messages
   - Proper error propagation

## Thread Safety

- Actors for shared mutable state
- Sendable conformance where needed
- Proper synchronization for cache access
- Thread-safe image handling

## Performance Considerations

- **Efficient caching strategies**: Optimized LRU cache using doubly-linked list for O(1) operations
- **Memory management for images**: NSCache with size limits and automatic purging
- **Network request optimization**: Background host discovery and pre-warming
- **Automatic host failover**: Resilient host discovery with fallback mechanisms
- **Non-blocking initialization**: Singleton pattern optimized to prevent main thread blocking
- **Lazy resource allocation**: Background tasks and streams created only when needed
- **Optimized network monitoring**: Asynchronous setup on utility queue 