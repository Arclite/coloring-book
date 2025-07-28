import ProjectDescription

public enum App {
    public static let target = Target.target(
        name: Shared.appName,
        destinations: [.iPhone],
        product: .app,
        bundleId: Shared.bundleID,
        infoPlist: "Products/App/Info.plist",
        sources: [
            "Products/App/Sources/**",
        ],
        resources: .resources([
            "Products/App/Resources/**",
        ]),
        entitlements: "Products/App/\(Shared.appName).entitlements",
        dependencies: [
            .target(API.target),
            .target(Networking.target),
            .target(Root.target),
        ],
        settings: .settings(
            base: [
                "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": "Accent Color",
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "2",
            ],
            debug: [
                "CODE_SIGN_IDENTITY": "Apple Development: Buddy Build (D47V8Y25W5)",
                "PROVISIONING_PROFILE_SPECIFIER": "match Development \(Shared.bundleID)",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "CODE_SIGN_IDENTITY": "Apple Distribution",
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore \(Shared.bundleID)",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
