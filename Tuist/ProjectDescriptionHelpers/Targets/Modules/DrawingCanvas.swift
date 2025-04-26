import ProjectDescription

public enum DrawingCanvas {
    public static let target = Target.moduleTarget(
        name: "DrawingCanvas",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "DrawingCanvas",
        dependencies: [
        ]
    )
}
