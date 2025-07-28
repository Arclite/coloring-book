// swift-tools-version: 5.9
import PackageDescription

#if TUIST // Apple
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        "FactoryKit": .framework,
        "TelemetryDeck": .framework,
        "ViewInspector": .framework,
    ],
    baseSettings: Shared.settings,
    targetSettings: [
        "FactoryKit": Shared.settings,
        "FactoryTesting": Shared.settings,
        "TelemetryClient": Shared.settings,
        "TelemetryDeck": Shared.settings,
        "ViewInspector": Shared.settings(swiftVersion: "5.0"),
    ]
)
#endif

let package = Package(
    name: "ColoringBook",
    dependencies: [
        .package(url: "git@github.com:hmlongco/Factory.git", from: "2.5.0"),
        .package(url: "git@github.com:TelemetryDeck/SwiftClient.git", from: "2.6.0"),
        .package(url: "git@github.com:nalexn/ViewInspector.git", exact: "0.10.2"),
    ],
)
