// swift-tools-version: 5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "NiceComponents",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "NiceComponents",
            targets: ["NiceComponents"]),
        .library(
            name: "NiceInit",
            targets: ["NiceInit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            from: "7.6.1"
        ),
        .package(
            url: "https://github.com/apple/swift-syntax.git",
            from: "509.0.0"
        ),
    ],
    targets: [
        .macro(
            name: "NiceInitMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        .target(name: "NiceInit", dependencies: ["NiceInitMacros"]),

        .target(
            name: "NiceComponents",
            dependencies: ["Kingfisher", "NiceInit"]),

    ]
)
