// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountdownRing",
    platforms: [
      .iOS(.v13),
      .macOS(.v10_15),
      .tvOS(.v13)
    ],
    products: [
        .library(
            name: "CountdownRing",
            targets: ["CountdownRing"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CountdownRing",
            dependencies: []
        ),
        .testTarget(
            name: "CountdownRingTests",
            dependencies: ["CountdownRing"]
        ),
    ]
)
