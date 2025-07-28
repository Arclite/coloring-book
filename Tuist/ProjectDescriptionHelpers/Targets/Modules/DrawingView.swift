import ProjectDescription

public enum DrawingView {
    public static let target = Target.moduleTarget(
        name: "DrawingView",
        hasResources: true,
        dependencies: [
            .target(API.target),
            .target(ColorPicker.target),
            .target(DrawingCanvas.target),
            .target(Navigation.target),
            .external(FactoryKit.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "DrawingView",
        dependencies: [
        ]
    )
}
