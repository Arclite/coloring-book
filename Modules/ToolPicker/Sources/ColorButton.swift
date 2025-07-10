//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ColorButton: View {
    private let color: Color
    @Binding private var selectedColor: Color
    init(color: Color, selectedColor: Binding<Color>) {
        self.color = color
        _selectedColor = selectedColor
    }

    var body: some View {
        Button {
            selectedColor = color
        } label: {
            if isSelected {
                ZStack {
                    Circle()
                        .inset(by: 10)
                        .fill(color)
                    Circle()
                        .stroke(color, lineWidth: 5)
                }
            } else {
                Circle()
                    .fill(color)
            }
        }
    }

    var isSelected: Bool {
        color == selectedColor
    }
}
