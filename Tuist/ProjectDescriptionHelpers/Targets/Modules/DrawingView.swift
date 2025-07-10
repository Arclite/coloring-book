import ProjectDescription

public enum DrawingView {
    public static let target = Target.moduleTarget(
        name: "DrawingView",
        hasResources: true,
        dependencies: [
            .target(API.target),
            .target(DrawingCanvas.target),
            .target(Navigation.target),
            .target(ToolPicker.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "DrawingView",
        dependencies: [
        ]
    )
}
