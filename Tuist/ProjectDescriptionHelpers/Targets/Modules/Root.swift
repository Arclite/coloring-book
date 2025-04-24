import ProjectDescription

public enum Root {
    public static let target = Target.moduleTarget(
        name: "Root",
        destinations: [.iPhone],
        dependencies: [
            .target(API.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Root",
        dependencies: [
        ]
    )
}
