//  Created by Geoff Pado on 12/25/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import ICBDrawingView
import ICBNavigation
import ICBPromptView

public struct RootView: View {
    public init() {}

    @Injected(\.navigator) private var navigator
    public var body: some View {
        switch navigator.currentRoute {
        case .prompt:
            PromptView()
        case .loading:
            ProgressView()
        case .drawing(let image):
            DrawingView(image: image)
        case .error(let error):
            Text(String(describing: error))
        }
    }
}

#Preview {
    RootView()
}
