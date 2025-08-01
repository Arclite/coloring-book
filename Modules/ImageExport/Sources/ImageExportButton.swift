//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import SwiftUI

public struct ImageExportButton: View {
    private let image: Image
    private let drawing: PKDrawing
    public init(image: Image, drawing: PKDrawing) {
        self.image = image
        self.drawing = drawing
    }

    public var body: some View {
        ShareLink(
            item: ImageExportTransferable(image: image, drawing: drawing),
            preview: SharePreview(Strings.ImageExportButton.previewTitle)
        )
    }
}
