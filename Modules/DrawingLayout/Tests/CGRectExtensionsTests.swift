//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics
import Testing

@testable import ICBDrawingLayout

struct CGRectExtensionsTests {
    @Test func inscribedSquare() {
        let originalRect = CGRect(x: 44, y: 11, width: 944, height: 1215.2)
        let expectedRect = CGRect(x: 44, y: 146.6, width: 944, height: 944)

        #expect(originalRect.inscribedSquare.isApproximatelyEqual(to: expectedRect) == true)
    }
}

private extension CGRect {
    func isApproximatelyEqual(to otherRect: CGRect) -> Bool {
        abs(otherRect.origin.x - origin.x) < 0.0001
        && abs(otherRect.origin.y - origin.y) < 0.0001
        && abs(otherRect.width - width) < 0.0001
        && abs(otherRect.height - height) < 0.0001
    }
}
