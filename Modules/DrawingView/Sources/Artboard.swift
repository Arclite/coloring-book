//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import DrawingCanvas
import SwiftUI

public struct Artboard: View {
    private let image: Image
    public init(image: Image) {
        self.image = image
    }

    public var body: some View {
        image.overlay {
            DrawingCanvas()
        }
    }
}
