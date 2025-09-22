import ProjectDescription

public enum ImageExport {
    public static let target = Target.moduleTarget(
        name: "ImageExport",
        hasResources: true,
        dependencies: [
            .target(DrawingLayout.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ImageExport",
        dependencies: [
        ]
    )
}
