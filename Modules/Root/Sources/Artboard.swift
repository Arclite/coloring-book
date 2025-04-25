//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct Artboard: View {
    private let image: Image
    init(image: Image) {
        self.image = image
    }

    var body: some View {
        image.overlay {
            DrawingCanvas()
        }
    }
}
