import ProjectDescription

public enum DrawingLayout {
    public static let target = Target.moduleTarget(
        name: "DrawingLayout",
        dependencies: [
            .target(ColorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "DrawingLayout",
        dependencies: [
        ]
    )
}
