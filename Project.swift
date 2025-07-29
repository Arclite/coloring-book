import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Shared.appName,
    organizationName: "Cocoatype, LLC",
    settings: Shared.settings,
    targets: [
        // products
        App.target,
        // modules
        API.target,
        ColorHandling.target,
        ColorPicker.target,
        DesignSystem.target,
        DrawingCanvas.target,
        DrawingView.target,
        ErrorHandling.target,
        ImageLoading.target,
        Logging.target,
        Navigation.target,
        Networking.target,
        PromptView.target,
        Root.target,
        // doubles
        ErrorHandling.doublesTarget,
        Logging.doublesTarget,
        Navigation.doublesTarget,
        Networking.doublesTarget,
        // test helpers
        TestHelpers.target,
        TestHelpers.interfaceTarget,
        // tests
        API.testTarget,
        ColorHandling.testTarget,
        ColorPicker.testTarget,
        DesignSystem.testTarget,
        DrawingCanvas.testTarget,
        DrawingView.testTarget,
        ErrorHandling.testTarget,
        ImageLoading.testTarget,
        Logging.testTarget,
        Navigation.testTarget,
        Networking.testTarget,
        PromptView.testTarget,
        Root.testTarget,
    ],
    schemes: [
        .scheme(
            name: Shared.appName,
            buildAction: .buildAction(targets: [
                .target(App.target.name),
            ]),
            testAction: .testPlans([
                "\(Shared.appName).xctestplan",
            ]),
            runAction: .runAction(
                arguments: .arguments(
                    environmentVariables: [
                        "API_TYPE": .environmentVariable(value: "preview", isEnabled: false),
                    ],
                    launchArguments: [
                        .launchArgument(name: "-com.apple.CoreData.SQLDebug 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.CloudKitDebug 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.Logging.stderr 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.ConcurrencyDebug 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.MigrationDebug 0", isEnabled: true),
                    ]
                ),
                options: .options(
                )
            )
        ),
    ],
    fileHeaderTemplate: "  Created by ___FULLUSERNAME___ on ___DATE___.\n//  ___COPYRIGHT___"
)
