// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "PostsCore",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .library(name: "PostsCore", targets: ["PostsCore"]),
    ],
    targets: [
        .target(name: "PostsCore"),
        .testTarget(
            name: "PostsCoreTests",
            dependencies: ["PostsCore"]
        ),
    ]
)
