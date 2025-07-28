//  Created by Geoff Pado on 4/26/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBColorHandling
import ICBColorPicker

struct DrawingViewLandscape: View {
    @Binding private var selectedColor: DrawingColor
    private let image: Image
    private let proxy: GeometryProxy
    init(image: Image, selectedColor: Binding<DrawingColor>, proxy: GeometryProxy) {
        self.image = image
        _selectedColor = selectedColor
        self.proxy = proxy
    }

    var body: some View {
        let imageWidth = proxy.size.height - DrawingView.padding * 2
        Artboard(image: image, style: selectedColor)
            .frame(width: imageWidth, height: imageWidth)
            .position(
                x: proxy.size.width - (imageWidth / 2) - DrawingView.padding,
                y: proxy.size.height / 2
            )

        let toolPickerHeight = (proxy.size.height - DrawingView.padding * 2)
        let toolPickerWidth = toolPickerHeight / CGFloat(DrawingColor.allColors.count)
        ColorPicker(selectedColor: $selectedColor, layout: .vertical)
            .frame(
                width: toolPickerWidth,
                height: toolPickerHeight
            )
            .position(
                x: toolPickerWidth / 2 + DrawingView.padding,
                y: proxy.size.height / 2
            )
    }
}
