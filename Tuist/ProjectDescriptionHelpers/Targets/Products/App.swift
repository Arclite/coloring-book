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
            .target(Root.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development \(Shared.bundleID)",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore \(Shared.bundleID)",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
