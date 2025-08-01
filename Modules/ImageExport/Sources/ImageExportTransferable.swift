//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import SwiftUI

struct ImageExportTransferable: Transferable {
    private let image: Image
    private let drawingData: Data

    init(image: Image, drawing: PKDrawing) {
        self.image = image
        self.drawingData = drawing.dataRepresentation()
    }

    // MARK: Transferable

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .png) { export in
            export.drawingData
        }
    }
}
