// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "DocCArchive",
  platforms: [
    .macOS(.v13)
  ],
  products: [
    .library(
      name: "DocCArchive",
      targets: ["DocCArchive"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.10.0"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.8.0"),
    .package(url: "https://github.com/apple/swift-nio", from: "2.0.0"),
  ],
  targets: [
    .target(
      name: "DocCArchive",
      dependencies: [
        "VendoredDocC",
        .product(name: "_NIOFileSystem", package: "swift-nio"),
      ]
    ),
    .target(
      name: "VendoredDocC",
      dependencies: [.product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")],
      exclude: [
        "openapi-merge.json",
        "Assets.json",
        "README.md",
        "RenderNode.spec.json",
        "merged-spec.json",
        "LinkableEntities.json",
        "RenderIndex.spec.json",
        "IndexingRecords.spec.json",
        "Diagnostics.json",
        "Metadata.json",
        "ThemeSettings.spec.json",
        "Benchmark.json",
      ]
    ),
    .testTarget(
      name: "DocCArchiveTests",
      dependencies: ["DocCArchive"],
      resources: [.copy("Fixtures")]
    ),
  ]
)
