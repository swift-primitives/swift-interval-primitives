// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-interval-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        // MARK: - Namespace
        .library(
            name: "Interval Primitive",
            targets: ["Interval Primitive"]
        ),

        // MARK: - Sub-namespace targets
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

        // MARK: - Umbrella
        .library(
            name: "Interval Primitives",
            targets: ["Interval Primitives"]
        ),

        // MARK: - Test Support
        .library(
            name: "Interval Primitives Test Support",
            targets: ["Interval Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-pair-primitives.git", branch: "main"),
    ],
    targets: [
        // MARK: - Namespace
        .target(
            name: "Interval Primitive",
            dependencies: []
        ),

        // MARK: - Sub-namespace targets (per [MOD-031])
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

        // MARK: - Umbrella
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

        // MARK: - Test Support
        .target(
            name: "Interval Primitives Test Support",
            dependencies: [
                "Interval Primitives",
            ],
            path: "Tests/Support"
        ),

        // MARK: - Tests
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
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
