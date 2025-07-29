import ProjectDescription

public enum ImageLoading {
    public static let target = Target.moduleTarget(
        name: "ImageLoading",
        dependencies: [
            .target(API.target),
            .external(FactoryKit.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ImageLoading",
        dependencies: [
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "ImageLoading",
        dependencies: [
        ]
    )
}
