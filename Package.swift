// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "NiceComponents",
    platforms: [
        .iOS(.v13),
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
            from: "6.2.1"
        )
    ],
    targets: [
        .target(
            name: "NiceComponents",
            dependencies: ["Kingfisher"]),
    ]
)
