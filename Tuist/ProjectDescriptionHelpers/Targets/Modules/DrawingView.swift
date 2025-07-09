import ProjectDescription

public enum DrawingView {
    public static let target = Target.moduleTarget(
        name: "DrawingView",
        dependencies: [
            .target(API.target),
            .target(DrawingCanvas.target),
            .target(ToolPicker.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "DrawingView",
        dependencies: [
        ]
    )
}
