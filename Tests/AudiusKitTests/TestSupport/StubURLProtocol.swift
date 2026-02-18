import Foundation

final class StubURLProtocol: URLProtocol {
  typealias RequestHandler = @Sendable (URLRequest) throws -> (HTTPURLResponse, Data)

  private static let lock = NSLock()
  private static var requestHandler: RequestHandler?

  static func setHandler(_ handler: @escaping RequestHandler) {
    lock.lock()
    requestHandler = handler
    lock.unlock()
  }

  static func reset() {
    lock.lock()
    requestHandler = nil
    lock.unlock()
  }

  private static func handler() -> RequestHandler? {
    lock.lock()
    defer { lock.unlock() }
    return requestHandler
  }

  override class func canInit(with request: URLRequest) -> Bool {
    true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    request
  }

  override func startLoading() {
    guard let handler = Self.handler() else {
      client?.urlProtocol(self, didFailWithError: URLError(.badServerResponse))
      return
    }

    do {
      let (response, data) = try handler(request)
      client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
      client?.urlProtocol(self, didLoad: data)
      client?.urlProtocolDidFinishLoading(self)
    } catch {
      client?.urlProtocol(self, didFailWithError: error)
    }
  }

  override func stopLoading() {}
}
