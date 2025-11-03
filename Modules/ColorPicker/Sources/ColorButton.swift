//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBColorHandling

struct ColorButton: View {
    private let color: DrawingColor
    @Binding private var selectedColor: DrawingColor
    init(
        color: DrawingColor,
        selectedColor: Binding<DrawingColor>
    ) {
        self.color = color
        _selectedColor = selectedColor
    }

    var body: some View {
        Button {
            selectedColor = color
        } label: {
            Crayon(color: color.baseColor)
                .offset(x: isSelected ? -60 : -100, y: 0)
        }
    }

    var isSelected: Bool {
        color == selectedColor
    }
}
