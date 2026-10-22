// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "CourseTesting",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "CourseLib", targets: ["CourseLib"]),
    ],
    targets: [
        .target(name: "CourseLib"),
        .testTarget(
            name: "CourseTests",
            dependencies: ["CourseLib"]
        ),
    ]
)
