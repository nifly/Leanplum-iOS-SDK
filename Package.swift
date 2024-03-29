// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Leanplum",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Leanplum", targets: ["LeanplumTargetWrapper"]),
        .library(name: "LeanplumLocation", targets: ["LeanplumLocation"])
    ],
    dependencies: [
        .package(url: "https://github.com/CleverTap/clevertap-ios-sdk", from: "6.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "Leanplum",
            url: "https://github.com/nifly/Leanplum-iOS-SDK/releases/download/v6.3.0/Leanplum.xcframework.zip",
            checksum: "dfc479c926bb35e02ac27a79c7540b48304e2dac944e4309e64c516fae79cbd7"
        ),
        .target(
            name: "LeanplumLocation",
            dependencies: ["Leanplum"],
            path: "LeanplumSDKLocation",
            publicHeadersPath: "LeanplumSDKLocation/include"
        ),
        .target(name: "LeanplumTargetWrapper",
                dependencies: ["Leanplum", .product(name: "CleverTapSDK", package: "clevertap-ios-sdk")],
                path: "LeanplumTargetWrapper"
               )
    ]
)
