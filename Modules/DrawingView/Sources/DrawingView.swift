//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ToolPicker
import SwiftUI

public struct DrawingView: View {
    private let image: Image
    public init(image: Image) {
        self.image = image
    }

    @State private var selectedColor: Color = .purple
    public var body: some View {
        HStack {
            ToolPicker(selectedColor: $selectedColor)
            Artboard(image: image, color: selectedColor)
        }
    }
}
