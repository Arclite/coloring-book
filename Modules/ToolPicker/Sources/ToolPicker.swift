//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct ToolPicker: View {
    @Binding private(set) var selectedColor: Color
    public init(selectedColor: Binding<Color>) {
        _selectedColor = selectedColor
    }

    public var body: some View {
        VStack {
            ColorButton(color: .red, selectedColor: $selectedColor)
            ColorButton(color: .orange, selectedColor: $selectedColor)
            ColorButton(color: .yellow, selectedColor: $selectedColor)
            ColorButton(color: .green, selectedColor: $selectedColor)
            ColorButton(color: .blue, selectedColor: $selectedColor)
            ColorButton(color: .purple, selectedColor: $selectedColor)
            ColorButton(color: .brown, selectedColor: $selectedColor)
            ColorButton(color: .black, selectedColor: $selectedColor)
        }
    }
}
