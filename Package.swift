// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "NiceComponents",
    platforms: [
        .iOS("15.0"),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "NiceComponents",
            targets: ["NiceComponents"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            from: "7.6.1"
        )
    ],
    targets: [
        .target(
            name: "NiceComponents",
            dependencies: ["Kingfisher"]),
    ]
)
