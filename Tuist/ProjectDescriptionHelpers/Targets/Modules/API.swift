import ProjectDescription

public enum API {
    public static let target = Target.moduleTarget(
        name: "API",
        dependencies: [
            .target(Networking.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "API",
        dependencies: [
        ]
    )
}
