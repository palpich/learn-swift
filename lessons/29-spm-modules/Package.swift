// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SPMModules",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "Greeter", targets: ["Greeter"]),
        .executable(name: "App", targets: ["App"]),
    ],
    targets: [
        .target(name: "Greeter"),
        .target(name: "Toolkit"),
        .executableTarget(
            name: "App",
            dependencies: ["Greeter"]
        ),
    ]
)
