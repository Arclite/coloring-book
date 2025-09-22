//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import SwiftUI

public struct ImageExportButton: View {
    private let size: CGSize
    private let image: Image
    private let drawing: PKDrawing
    public init(
        size: CGSize,
        image: Image,
        drawing: PKDrawing
    ) {
        self.size = size
        self.image = image
        self.drawing = drawing
    }

    public var body: some View {
        ShareLink(
            item: ReadiedImage(size: size, image: image, drawing: drawing),
            preview: SharePreview(Strings.ImageExportButton.previewTitle)
        )
    }
}
