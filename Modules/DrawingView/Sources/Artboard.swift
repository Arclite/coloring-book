//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBDesignSystem
import ICBDrawingCanvas

struct Artboard<ColorStyle: ShapeStyle>: View where ColorStyle.Resolved == Color {
    private let image: Image
    private let style: ColorStyle
    init(image: Image, style: ColorStyle) {
        self.image = image
        self.style = style
    }

    var body: some View {
        image
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                DrawingCanvas(style: style)
            }
            .clipShape(RoundedRectangle(cornerRadius: 11))
            .shadow(color: .canvasShadow, radius: 20)
    }
}
