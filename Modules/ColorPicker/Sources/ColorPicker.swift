//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBColorHandling

public struct ColorPicker: View {
    @Binding private(set) var selectedColor: DrawingColor
    private let layout: Layout
    public init(
        selectedColor: Binding<DrawingColor>,
        layout: Layout
    ) {
        _selectedColor = selectedColor
        self.layout = layout
    }

    public var body: some View {
        let colors: () -> some View = {
            ForEach(DrawingColor.allColors) {
                ColorButton(
                    color: $0,
                    selectedColor: $selectedColor
                )
            }
        }

        switch layout {
        case .horizontal:
            HStack(spacing: 4, content: colors)
        case .vertical:
            VStack(spacing: 4, content: colors)
        }
    }

    public enum Layout {
        case horizontal, vertical
    }
}
