//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import SwiftUI

import ICBColorHandling
import ICBColorPicker
import ICBDesignSystem
import ICBDrawingCanvas
import ICBDrawingLayout
import ICBImageExport

public struct DrawingView: View {
    private let image: Image
    @State private var drawing: PKDrawing

    public init(image: Image) {
        self.image = image
        self.drawing = PKDrawing()
    }

    static let padding: CGFloat = 0

    @State private var selectedColor = DrawingColor.allColors[0]
    public var body: some View {
        GeometryReader { proxy in
            let layout = DrawingLayoutCalculator()
                .layout(in: proxy.size)

            Artboard(image: image)
                .frame(
                    width: layout.imageFrame.width,
                    height: layout.imageFrame.height
                )
                .position(
                    x: layout.imageFrame.midX,
                    y: layout.imageFrame.midY
                )

            DrawingCanvas(style: selectedColor, drawing: $drawing)
                .border(Color.red, width: 5)
                .frame(
                    width: layout.imageFrame.width,
                    height: layout.imageFrame.height
                )
                .position(
                    x: layout.imageFrame.midX,
                    y: layout.imageFrame.midY
                )

            ImageExportButton(size: proxy.size, image: image, drawing: drawing)

            ColorPicker(
                selectedColor: $selectedColor,
                layout: pickerLayout(in: proxy.size)
            )
            .border(Color.blue)
            .frame(
                width: layout.toolFrame.width,
                height: layout.toolFrame.height
            )
            .position(
                x: layout.toolFrame.midX,
                y: layout.toolFrame.midY
            )
        }
    }

    private func pickerLayout(in size: CGSize) -> ICBColorPicker.ColorPicker.Layout {
        return (size.height > size.width ? .horizontal : .vertical)
    }
}

import ICBAPI
#Preview {
    DrawingView(image: Asset.sample.swiftUIImage)
}
