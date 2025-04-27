//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ToolPicker
import SwiftUI

public struct DrawingView: View {
    private let image: Image
    public init(image: Image) {
        self.image = image
    }

    static let padding: CGFloat = 44

    @State private var selectedColor: Color = .purple
    public var body: some View {
        GeometryReader { proxy in
            if proxy.size.height > proxy.size.width {
                DrawingViewPortrait(image: image, selectedColor: $selectedColor, proxy: proxy)
            } else {
                DrawingViewLandscape(image: image, selectedColor: $selectedColor, proxy: proxy)
            }
        }
        .ignoresSafeArea()
    }
}

import API
#Preview {
    DrawingView(image: Asset.sample.swiftUIImage)
}
