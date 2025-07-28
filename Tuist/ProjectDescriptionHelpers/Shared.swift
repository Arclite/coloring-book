import ProjectDescription

public enum Shared {
    public static let appName = "ColoringBook"
    public static let bundleID = "com.cocoatype.ColoringBook"
    public static func settings(swiftVersion: SettingValue) -> Settings {
        return .settings(base: [
            "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": false,
            "CODE_SIGN_IDENTITY": "",
            "CODE_SIGN_STYLE": "Manual",
            "CURRENT_PROJECT_VERSION": "0",
            "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
            "DEVELOPMENT_TEAM": "287EDDET2B",
            "ENABLE_HARDENED_RUNTIME[sdk=macosx*]": "YES",
            "ENABLE_MODULE_VERIFIER": true,
            "ENABLE_USER_SCRIPT_SANDBOXING": true,
            "IPHONEOS_DEPLOYMENT_TARGET": "18.0",
            "MACOSX_DEPLOYMENT_TARGET": "15.0",
            "WATCHOS_DEPLOYMENT_TARGET": "11.0",
            "MARKETING_VERSION": "999",
            "STRING_CATALOG_GENERATE_SYMBOLS": false,
            "SWIFT_VERSION": swiftVersion,
            "TARGETED_DEVICE_FAMILY": "2",
        ], debug: [
            :
        ], release: [
            "SWIFT_COMPILATION_MODE": "wholemodule",
        ])
    }
    public static let settings: Settings = Self.settings(swiftVersion: "6.0")
}
