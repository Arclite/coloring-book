import ProjectDescription

public enum DesignSystem {
    public static let target = Target.moduleTarget(
        name: "DesignSystem",
        dependencies: [
            .target(ColorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "DesignSystem",
        dependencies: [
        ]
    )
}
