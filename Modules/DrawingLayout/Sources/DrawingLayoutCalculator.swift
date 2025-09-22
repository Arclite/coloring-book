//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics

import ICBColorHandling

public struct DrawingLayoutCalculator {
    public init() {}

    public func layout(in size: CGSize) -> DrawingLayout {
        let parentRect = CGRect(
            origin: .zero,
            size: CGSize(width: size.width, height: size.height)
        )

        let insetRect = parentRect.insetBy(dx: 44, dy: 11)
        let colorsCount = CGFloat(DrawingColor.allColors.count)
        let toolPickerDimension = insetRect.maximumDimension / colorsCount
        let edge: CGRectEdge = (insetRect.size.height > insetRect.size.width) ? .maxYEdge : .minXEdge

        let (toolFrame, imageContainerFrame) = insetRect.divided(atDistance: toolPickerDimension, from: edge)

        let imageFrame = imageContainerFrame.inscribedSquare
        return DrawingLayout(imageFrame: imageFrame, toolFrame: toolFrame)
    }
}
