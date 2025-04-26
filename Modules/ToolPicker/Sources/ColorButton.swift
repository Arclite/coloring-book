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
            color.clipShape(Circle())
        }
    }
}
