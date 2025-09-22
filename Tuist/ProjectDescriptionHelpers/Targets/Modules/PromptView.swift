import ProjectDescription

public enum PromptView {
    public static let target = Target.moduleTarget(
        name: "PromptView",
        hasResources: true,

        dependencies: [
            .target(ImageLoading.target),
            .target(Navigation.target),
            .external(FactoryKit.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "PromptView",
        dependencies: [
            .target(ImageLoading.doublesTarget),
            .target(ImageLoading.target),
            .target(Navigation.doublesTarget),
            .target(Navigation.target),
            .external(FactoryKit.target),
            .external(FactoryKit.testTarget),
            .external(ViewInspector.target),
        ]
    )
}
