// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "FakefyData",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "FakefyData",
            targets: ["FakefyData"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya", exact: "14.0.0"),
        .package(url: "https://github.com/Quick/Quick", exact: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble", exact: "9.2.0"),
        .package(name: "FakefyDomain", path: "FakefyDomain")
    ],
    targets: [
        .target(
            name: "FakefyData",
            dependencies: ["FakefyDomain", "Moya"],
            resources: [.copy("Database")]
        ),
        .testTarget(
            name: "FakefyDataTests",
            dependencies: ["FakefyData", "FakefyDomain", "Quick", "Nimble"],
            resources: [.copy("Mock/Files")])
    ]
)
