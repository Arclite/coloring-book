import ProjectDescription

public enum ColorPicker {
    public static let target = Target.moduleTarget(
        name: "ColorPicker",
        hasResources: true,
        dependencies: [
            .target(ColorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ColorPicker",
        dependencies: [
        ]
    )
}
