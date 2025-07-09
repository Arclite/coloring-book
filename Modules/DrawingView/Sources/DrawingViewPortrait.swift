//  Created by Geoff Pado on 4/26/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBToolPicker

struct DrawingViewPortrait: View {
    @Binding private var selectedColor: Color
    private let image: Image
    private let proxy: GeometryProxy
    init(image: Image, selectedColor: Binding<Color>, proxy: GeometryProxy) {
        self.image = image
        _selectedColor = selectedColor
        self.proxy = proxy
    }

    var body: some View {
        let imageWidth = proxy.size.width - DrawingView.padding * 2
        Artboard(image: image, color: selectedColor)
            .frame(width: imageWidth, height: imageWidth)
            .offset(x: DrawingView.padding, y: DrawingView.padding)

        let toolPickerHeight = (proxy.size.width - DrawingView.padding * 2) / CGFloat(ToolPicker.colors.count)
        ToolPicker(selectedColor: $selectedColor, layout: .horizontal)
            .frame(
                width: proxy.size.width - DrawingView.padding * 2,
                height: toolPickerHeight
            )
            .position(
                x: proxy.size.width / 2,
                y: proxy.size.height - toolPickerHeight / 2 - DrawingView.padding
            )
    }
}
