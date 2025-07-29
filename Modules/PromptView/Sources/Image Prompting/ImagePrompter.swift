//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import FactoryKit

import ICBImageLoading
import ICBNavigation

struct ImagePrompter: Prompter {
    @Injected(\.imageLoader) private var imageLoader

    func fetchImage(forPrompt prompt: String) async {
        let navigator = Container.shared.navigator()
        navigator.currentRoute = .loading

        do {
            let image = try await imageLoader.loadImage(prompt: prompt)
            navigator.currentRoute = .drawing(image)
        } catch {
            navigator.currentRoute = .error(error)
        }
    }
}
