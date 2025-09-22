//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics

public struct DrawingLayout {
    public let imageFrame: CGRect
    public let toolFrame: CGRect

    init(imageFrame: CGRect, toolFrame: CGRect) {
        self.imageFrame = imageFrame
        self.toolFrame = toolFrame
    }
}
