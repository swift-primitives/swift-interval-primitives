// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-interval-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(
            name: "Interval Primitive",
            targets: ["Interval Primitive"]
        ),

        .library(
            name: "Interval Bound Primitives",
            targets: ["Interval Bound Primitives"]
        ),
        .library(
            name: "Interval Boundary Primitives",
            targets: ["Interval Boundary Primitives"]
        ),
        .library(
            name: "Interval Endpoint Primitives",
            targets: ["Interval Endpoint Primitives"]
        ),

        .library(
            name: "Interval Primitives",
            targets: ["Interval Primitives"]
        ),

        .library(
            name: "Interval Primitives Test Support",
            targets: ["Interval Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-pair-primitives.git",
            branch: "main"
        )
    ],
    targets: [

        .target(
            name: "Interval Primitive",
            dependencies: []
        ),

        .target(
            name: "Interval Bound Primitives",
            dependencies: [
                "Interval Primitive",
                .product(name: "Pair Primitives", package: "swift-pair-primitives"),
            ]
        ),
        .target(
            name: "Interval Boundary Primitives",
            dependencies: [
                "Interval Primitive",
                .product(name: "Pair Primitives", package: "swift-pair-primitives"),
            ]
        ),
        .target(
            name: "Interval Endpoint Primitives",
            dependencies: [
                "Interval Primitive",
                .product(name: "Pair Primitives", package: "swift-pair-primitives"),
            ]
        ),

        .target(
            name: "Interval Primitives",
            dependencies: [
                "Interval Primitive",
                "Interval Bound Primitives",
                "Interval Boundary Primitives",
                "Interval Endpoint Primitives",
                .product(name: "Pair Primitives", package: "swift-pair-primitives"),
            ]
        ),

        .target(
            name: "Interval Primitives Test Support",
            dependencies: [
                "Interval Primitives"
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Interval Primitives Tests",
            dependencies: [
                "Interval Primitives",
                "Interval Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
