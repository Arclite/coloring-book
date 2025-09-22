//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import ICBDesignSystem
import ICBDrawingCanvas

struct Artboard: View {
    private let image: Image
    init(image: Image) {
        self.image = image
    }

    var body: some View {
        image
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}
