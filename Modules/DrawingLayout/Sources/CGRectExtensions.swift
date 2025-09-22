//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics

extension CGRect {
    var minimumDimension: CGFloat { min(size.width, size.height) }
    var maximumDimension: CGFloat { max(size.width, size.height) }

    var inscribedSquare: CGRect {
        let minimumDimension = self.minimumDimension
        if width > height {
            return CGRect(
                x: (width - minimumDimension) / 2 + origin.x,
                y: origin.y,
                width: minimumDimension,
                height: minimumDimension
            )
        } else {
            return CGRect(
                x: origin.x,
                y: (height - minimumDimension) / 2 + origin.y,
                width: minimumDimension,
                height: minimumDimension
            )
        }
    }
}
