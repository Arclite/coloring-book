// swift-tools-version: 5.9
import PackageDescription

#if TUIST // Apple
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        "TelemetryClient": .framework,
    ],
    baseSettings: Shared.settings,
    targetSettings: [
        :
    ]
)
#endif

let package = Package(
    name: "ColoringBook",
    dependencies: [
        .package(url: "git@github.com:TelemetryDeck/SwiftClient.git", from: "2.6.0"),
    ],
)
