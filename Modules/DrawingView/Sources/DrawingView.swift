//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBColorHandling
import ICBColorPicker
import ICBDesignSystem

public struct DrawingView: View {
    private let image: Image
    public init(image: Image) {
        self.image = image
    }

    static let padding: CGFloat = 0

    @State private var selectedColor = DrawingColor.allColors[0]
    public var body: some View {
        VStack(spacing: 0) {
            GeometryReader { proxy in
                let (toolPickerFrame, imageFrame) = layoutFrames(in: proxy.size)
                let imageWidth = imageFrame.minimumDimension

                Artboard(image: image, style: selectedColor)
                    .frame(width: imageWidth, height: imageWidth)
                    .position(
                        x: imageFrame.midX,
                        y: imageFrame.midY
                    )

                ColorPicker(
                    selectedColor: $selectedColor,
                    layout: pickerLayout(in: proxy.size)
                )
                .frame(
                    width: toolPickerFrame.width,
                    height: toolPickerFrame.height
                )
                .position(
                    x: toolPickerFrame.midX,
                    y: toolPickerFrame.midY
                )
            }
        }.background(Color.background)
    }

    private func pickerLayout(in size: CGSize) -> ICBColorPicker.ColorPicker.Layout {
        return (size.height > size.width ? .horizontal : .vertical)
    }

    private func layoutFrames(in size: CGSize) -> (CGRect, CGRect) {
        let parentRect = CGRect(
            origin: .zero,
            size: CGSize(width: size.width, height: size.height)
        )

        let insetRect = parentRect.insetBy(dx: 44, dy: 11)
        let colorsCount = CGFloat(DrawingColor.allColors.count)
        let toolPickerDimension = insetRect.maximumDimension / colorsCount
        let edge: CGRectEdge = (insetRect.size.height > insetRect.size.width) ? .maxYEdge : .minXEdge

        return insetRect.divided(atDistance: toolPickerDimension, from: edge)
    }
}

import ICBAPI
#Preview {
    DrawingView(image: Asset.sample.swiftUIImage)
}
