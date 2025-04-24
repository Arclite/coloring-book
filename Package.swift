// swift-tools-version: 6.0
@preconcurrency import PackageDescription

let platformProducts: [PackageDescription.Product]
let platformDependencies: [PackageDescription.Package.Dependency]
let platformTargets: [PackageDescription.Target]

platformProducts = [
    .executable(
        name: "ColoringBookServer",
        targets: [
            "ColoringBookServer",
        ]
    ),
]
platformDependencies = [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
]
platformTargets = [
    .executableTarget(
        name: "ColoringBookServer",
        dependencies: [
            .product(name: "Hummingbird", package: "hummingbird"),
            .target(name: "Networking"),
            .target(name: "OpenAI"),
        ],
        path: "Products/Server"
    ),
    .target(
        name: "Networking",
        dependencies: [
        ],
        path: "Modules/Networking",
        sources: ["Sources"]
    ),
    .target(
        name: "NetworkingDoubles",
        dependencies: [
            .target(name: "Networking"),
        ],
        path: "Modules/Networking",
        sources: ["Doubles"]
    ),
    .testTarget(
        name: "NetworkingTests", 
        dependencies: [
            .target(name: "Networking"),
            .target(name: "NetworkingDoubles"),
        ],
        path: "Modules/Networking",
        sources: ["Tests"]
    ),
    .target(
        name: "OpenAI",
        dependencies: [
            .target(name: "Networking"),
        ],
        path: "Modules/OpenAI",
        sources: ["Sources"]
    ),
    .testTarget(
        name: "OpenAITests", 
        dependencies: [
            .target(name: "OpenAI"),
        ],
        path: "Modules/OpenAI",
        sources: ["Tests"]
    ),
]

let package = Package(
    name: "ColoringBook",
    platforms: [.macOS(.v15)],
    products: platformProducts,
    dependencies: platformDependencies,
    targets: platformTargets
)
