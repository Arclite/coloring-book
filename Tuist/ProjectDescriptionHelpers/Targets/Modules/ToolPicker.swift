import ProjectDescription

public enum ToolPicker {
    public static let target = Target.moduleTarget(
        name: "ToolPicker",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ToolPicker",
        dependencies: [
        ]
    )
}
