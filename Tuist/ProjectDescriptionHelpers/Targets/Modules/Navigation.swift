import ProjectDescription

public enum Navigation {
    public static let target = Target.moduleTarget(
        name: "Navigation",
        dependencies: [
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Navigation",
        dependencies: [
        ]
    )
}
