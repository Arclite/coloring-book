//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import ICBNavigation

struct CloseButton: View {
    @Injected(\.navigator) private var navigator
    var body: some View {
        Button {
            navigator.currentRoute = .prompt
        } label: {
            Image(systemName: "xmark")
        }
        .accessibilityLabel(
            ICBDrawingViewStrings.CloseButton.accesibilityLabel
        )
    }
}
