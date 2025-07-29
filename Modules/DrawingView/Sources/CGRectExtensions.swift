//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics

extension CGRect {
    var minimumDimension: CGFloat { min(size.width, size.height) }
    var maximumDimension: CGFloat { max(size.width, size.height) }
}
