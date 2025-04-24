import ProjectDescription

public enum OpenAI {
    public static let target = Target.moduleTarget(
        name: "OpenAI",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "OpenAI",
        dependencies: [
        ]
    )
}
