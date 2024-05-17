// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ImageUI",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "ImageUI", targets: ["ImageUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", "12.6.0"..<"13.0.0")
    ],
    targets: [
        .target(name: "ImageUI", dependencies: ["Nuke","NukeExtensions"])
    ]
)
