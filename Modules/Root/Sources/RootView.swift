//  Created by Geoff Pado on 12/25/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import ICBDrawingView
import ICBNavigation
import ICBPromptView

public struct RootView: View {
    private let imageLoader = APIImageLoader()
    public init() {}

    @Injected(\.navigator) private var navigator
    public var body: some View {
        switch navigator.currentRoute {
        case .prompt:
            PromptView { prompt in
                navigator.currentRoute = .loading
                Task {
                    do {
                        let image = try await imageLoader.loadImage(prompt: prompt)
                        navigator.currentRoute = .drawing(image)
                    } catch {
                        navigator.currentRoute = .error(error)
                    }
                }
            }
        case .loading:
            ProgressView()
        case .drawing(let image):
            DrawingView(image: image)
        case .error(let error):
            Text(String(describing: error))
        }
    }

    enum ViewState {
        case prompt
        case loading
        case drawing(Image)
        case error(Error)
    }
}

#Preview {
    RootView()
}
