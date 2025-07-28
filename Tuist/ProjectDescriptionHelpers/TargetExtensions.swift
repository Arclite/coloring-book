import ProjectDescription

extension Target {
    static let prefix = "ICB"
    static func moduleTarget(
        name: String,
        destinations: Destinations = [.iPhone],
        hasResources: Bool = false,
        usesMaxSwiftVersion: Bool = true,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target.target(
            name: Self.prefix + name,
            destinations: destinations,
            product: .framework,
            bundleId: "\(Shared.bundleID).\(name)",
            sources: ["Modules/\(name)/Sources/**"],
            resources: hasResources ? ["Modules/\(name)/Resources/**"] : nil,
            dependencies: dependencies,
            settings: .settings(
                base: [
                    "CODE_SIGN_IDENTITY": "",
                    "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                    "ENABLE_MODULE_VERIFIER": true,
                    "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": ["gnu11", "gnu++14"],
                ]
            )
        )
    }

    static func moduleTestTarget(
        name: String,
        hasResources: Bool = false,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: Self.prefix + "\(name)Tests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "\(Shared.bundleID).\(name)Tests",
            sources: ["Modules/\(name)/Tests/**"],
            resources: hasResources ? ["Modules/\(name)/TestResources/**"] : nil,
            dependencies: [
                .target(name: Self.prefix + name),
            ] + dependencies
        )
    }

    static func moduleDoublesTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: Self.prefix + "\(name)Doubles",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "\(Shared.bundleID).\(name)Doubles",
            sources: ["Modules/\(name)/Doubles/**"],
            dependencies: [
                .target(name: Self.prefix + name),
                .target(TestHelpers.interfaceTarget),
            ] + dependencies,
            settings: .settings(
                base: [
                    "CODE_SIGN_IDENTITY": "",
                    "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                    "ENABLE_MODULE_VERIFIER": true,
                    "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": ["gnu11", "gnu++14"],
                ],
                defaultSettings: .recommended()
            )
        )
    }
}
