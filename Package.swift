// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatSDKLibrary",
    platforms: [
        .iOS(.v16) // iOS version target
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ChatSDKLibrary",
            targets: ["ChatSDK"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/socketio/socket.io-client-swift", from: "16.0.0"),
        .package(url: "https://github.com/socketio/socket.io-client-swift", branch: "master"),
        .package(url: "https://github.com/stasel/WebRTC", from: "136.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "ChatSDK", path: "./Sources/ChatSDK.xcframework"),
        .target(
            name: "ChatSDKLibrary",
            dependencies: [
                "ChatSDK",
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "WebRTC", package: "WebRTC")
            ]
        )

    ]
)
