import Foundation
import SwiftUI

#if os(iOS) || os(tvOS) || os(visionOS)
  import UIKit
  public typealias PlatformImage = UIImage
#elseif os(macOS)
  import AppKit
  public typealias PlatformImage = NSImage
#else
  #error("Unsupported platform: PlatformImage is not defined for this OS.")
#endif

/// A thread-safe wrapper for PlatformImage that can be used across actor boundaries
@objc public final class SendableImage: NSObject, @unchecked Sendable {
  public let image: PlatformImage

  public init(_ image: PlatformImage) {
    self.image = image
    super.init()
  }

  public override func isEqual(_ object: Any?) -> Bool {
    guard let other = object as? SendableImage else { return false }

    #if os(iOS) || os(tvOS) || os(visionOS)
      return self.image.pngData() == other.image.pngData()
    #elseif os(macOS)
      return self.image.tiffRepresentation == other.image.tiffRepresentation
    #else
      return false
    #endif
  }
}
