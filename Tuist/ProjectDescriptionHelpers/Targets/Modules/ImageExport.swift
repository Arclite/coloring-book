import ProjectDescription

public enum ImageExport {
    public static let target = Target.moduleTarget(
        name: "ImageExport",
        hasResources: true,
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ImageExport",
        dependencies: [
        ]
    )
}
