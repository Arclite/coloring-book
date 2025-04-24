import ProjectDescription

public enum Networking {
    public static let target = Target.moduleTarget(
        name: "Networking",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Networking",
        dependencies: [
            .target(Networking.doublesTarget),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Networking",
        dependencies: [
        ]
    )
}
