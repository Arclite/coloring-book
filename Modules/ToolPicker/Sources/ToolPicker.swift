//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct ToolPicker: View {
    @Binding private(set) var selectedColor: SwiftUI.Color
    private let layout: Layout
    public init(
        selectedColor: Binding<SwiftUI.Color>,
        layout: Layout
    ) {
        _selectedColor = selectedColor
        self.layout = layout
    }

    public var body: some View {
        switch layout {
        case .horizontal:
            HStack(spacing: 4, content: { colors() })
        case .vertical:
            VStack(spacing: 4, content: { colors() })
        }
    }

    @ViewBuilder
    private func colors() -> some View {
        ForEach(Self.colors) {
            ColorButton(
                color: $0.color,
                selectedColor: $selectedColor
            )
        }
    }

    public static let colors: [Color] = [
        .init(color: .red),
        .init(color: .orange),
        .init(color: .yellow),
        .init(color: .green),
        .init(color: .blue),
        .init(color: .purple),
        .init(color: .brown),
        .init(color: .black),
    ]

    public enum Layout {
        case horizontal, vertical
    }

    public struct Color: Identifiable {
        let color: SwiftUI.Color
        init(color: SwiftUI.Color) {
            self.color = color
        }

        public var id: String { color.description }
    }
}
