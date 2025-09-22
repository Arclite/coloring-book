//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import SwiftUI

struct ReadiedImage: Transferable {
    let size: CGSize
    let image: Image
    let drawingOrigin: CGPoint
    let drawingData: Data

    init(size: CGSize, image: Image, drawing: PKDrawing) {
        self.size = size
        self.image = image
        self.drawingOrigin = CGPoint(
            x: drawing.bounds.origin.x,
            y: size.height - (drawing.bounds.origin.y + drawing.bounds.size.height)
        )
        self.drawingData = drawing.dataRepresentation()
    }

    var drawing: PKDrawing {
        get throws {
            return try PKDrawing(data: drawingData)
        }
    }

    // MARK: Transferable

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .png) { @MainActor export in
            return try await ExportRenderer().render(export)
        }
    }
}
