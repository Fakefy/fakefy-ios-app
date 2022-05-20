// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FakefyDomain",
    products: [
        .library(
            name: "FakefyDomain",
            targets: ["FakefyDomain"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", exact: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble", exact: "9.2.0"),
    ],
    targets: [
        .target(
            name: "FakefyDomain",
            dependencies: []),
        .testTarget(
            name: "FakefyDomainTests",
            dependencies: ["FakefyDomain", "Quick", "Nimble"],
            resources: [.copy("Mock/Files")]),
    ]
)
