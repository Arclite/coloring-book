import ProjectDescription

public enum PromptView {
    public static let target = Target.moduleTarget(
        name: "PromptView",
        dependencies: [
            .target(ImageLoading.target),
            .target(Navigation.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "PromptView",
        dependencies: [
        ]
    )
}
