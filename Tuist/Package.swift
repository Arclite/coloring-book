// swift-tools-version: 5.9
import PackageDescription

#if TUIST // Apple
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        "FactoryKit": .framework,
        "TelemetryClient": .framework,
    ],
    baseSettings: Shared.settings
)
#endif

let package = Package(
    name: "ColoringBook",
    dependencies: [
        .package(url: "git@github.com:hmlongco/Factory.git", from: "2.5.0"),
        .package(url: "git@github.com:TelemetryDeck/SwiftClient.git", from: "2.6.0"),
    ],
)
