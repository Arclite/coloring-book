//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

enum ExportError: Error {
    case cannotCreateContext
    case cannotCreateDrawingCGImage
    case cannotCreateGeneratedCGImage
    case cannotCreateImageDestination
    case cannotCreateImageFromContext
    case cannotFinalizeImageDestination
}
