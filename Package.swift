// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "AudiusKit",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
    .tvOS(.v17),
    .watchOS(.v10),
  ],
  products: [
    .library(
      name: "AudiusKit",
      targets: ["AudiusKit"])
  ],
  dependencies: [
    // Dependencies will be added as needed
  ],
  targets: [
    .target(
      name: "AudiusKit",
      dependencies: []),
    .testTarget(
      name: "AudiusKitTests",
      dependencies: ["AudiusKit"],
      resources: [
        .process("Fixtures/operation_manifest.json")
      ]),
  ]
)
