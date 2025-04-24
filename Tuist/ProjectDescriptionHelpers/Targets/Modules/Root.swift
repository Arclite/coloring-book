import ProjectDescription

public enum Root {
    public static let target = Target.moduleTarget(
        name: "Root",
        destinations: [.iPhone, .appleWatch, .mac],
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Root",
        dependencies: [
        ]
    )
}
