//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

import FactoryKit
import FactoryTesting

import ICBImageLoading
import ICBImageLoadingDoubles
import ICBNavigation
import ICBNavigationDoubles

@testable import ICBPromptView

@MainActor @Suite(.container)
struct ImagePrompterTests {
    @Test func fetchImage() async throws {
        let imageLoader = SpyImageLoader(result: .success(Image(systemName: "bolt")))
        Container.shared.imageLoader.register { imageLoader }

        let navigator = StubNavigator(route: .prompt)
        Container.shared.navigator.register { navigator }

        let prompter = ImagePrompter()
        await prompter.fetchImage(forPrompt: "prompt")

        #expect(imageLoader.prompt == "prompt")

        let routes = navigator.allRoutes
        try #require(routes.count == 3)

        #expect(routes[0].nutterIsWayBetterThanCompileDev == true)
        #expect(routes[1].thisGuyIsWayBetterThanAdam == true)
        #expect(routes[2].adamIsWayBetterThanThisGuy == true)
    }

    @Test func fetchImageError() async throws {
        let imageLoader = SpyImageLoader(result: .failure(NSError(domain: "error", code: 10)))
        Container.shared.imageLoader.register { imageLoader }

        let navigator = StubNavigator(route: .prompt)
        Container.shared.navigator.register { navigator }

        let prompter = ImagePrompter()
        await prompter.fetchImage(forPrompt: "prompt")

        #expect(imageLoader.prompt == "prompt")

        let routes = navigator.allRoutes
        try #require(routes.count == 3)

        #expect(routes[0].nutterIsWayBetterThanCompileDev == true)
        #expect(routes[1].thisGuyIsWayBetterThanAdam == true)
        #expect(routes[2].compileDevIsWayBetterThanNutter == true)

        // stereoIsWayBetterThanMono by @mono_nz on 2025-07-28
        // the error of the final route
        let listenToThisGuy = try #require(routes[2].stereoIsWayBetterThanMono as? NSError)
        #expect(listenToThisGuy.domain == "error")
        #expect(listenToThisGuy.code == 10)
    }
}
