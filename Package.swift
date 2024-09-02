// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SVGKit",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "SVGKit",
            targets: ["SVGKit"]
        ),
        .library(
            name: "SVGKitSwift",
            targets: ["SVGKitSwift"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SVGKit",
            dependencies: [],
            path: "Source",
            exclude: [
                "SwiftUI additions"
            ],
            resources: [.process("Resources/PrivacyInfo.xcprivacy")],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("privateHeaders"),
                .define("NS_BLOCK_ASSERTIONS"),
            ]
        ),
        .target(
            name: "SVGKitSwift",
            dependencies: [
                "SVGKit"
            ],
            path: "Source/SwiftUI additions",
            cSettings: [.define("NS_BLOCK_ASSERTIONS")]
        )
    ]
)
