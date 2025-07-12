import ProjectDescription

struct ExternalDependency {
    let name: String
}

extension TargetDependency {
    static func external(_ dependency: ExternalDependency) -> TargetDependency {
        return TargetDependency.external(name: dependency.name)
    }
}
