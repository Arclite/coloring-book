//  Created by Geoff Pado on 7/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import ICBDrawingView
import ICBNavigation
import ICBNavigationDoubles
import ICBPromptView

@testable import ICBRoot

@MainActor @Suite(.container)
struct RootViewTests {
    @Test func bodyPrompt() throws {
        Container.shared.navigator.register {
            StubNavigator(route: .prompt)
        }

        let view = RootView()

        _ = try view.inspect().find(PromptView.self)
    }

    @Test func bodyLoading() throws {
        Container.shared.navigator.register {
            StubNavigator(route: .loading)
        }

        let view = RootView()

        _ = try view.inspect().find(ViewType.ProgressView.self)
    }

    @Test func bodyDrawing() throws {
        Container.shared.navigator.register {
            let image = Image(systemName: "bolt")
            return StubNavigator(route: .drawing(image))
        }

        let view = RootView()

        _ = try view.inspect().find(DrawingView.self)
    }

    @Test func bodyError() throws {
        Container.shared.navigator.register {
            let error = URLError(.cancelled)
            return StubNavigator(route: .error(error))
        }

        let view = RootView()

        _ = try view.inspect().find(ViewType.Text.self)
    }
}
