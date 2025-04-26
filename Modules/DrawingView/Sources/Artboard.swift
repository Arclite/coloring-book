//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import DrawingCanvas
import SwiftUI

struct Artboard: View {
    private let image: Image
    private let color: Color
    init(image: Image, color: Color) {
        self.image = image
        self.color = color
    }

    var body: some View {
        image.overlay {
            DrawingCanvas(color: color)
        }
    }
}
