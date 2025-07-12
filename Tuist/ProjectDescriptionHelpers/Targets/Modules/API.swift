import ProjectDescription

public enum API {
    public static let target = Target.moduleTarget(
        name: "API",
        hasResources: true,
        dependencies: [
            .target(Networking.target),
            .external(FactoryKit.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "API",
        dependencies: [
        ]
    )
}
