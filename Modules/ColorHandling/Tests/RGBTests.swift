//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import ICBColorHandling

struct RGBTests {
    @Test(arguments: [
        (0xFF0000, 255, 0, 0),
        (0x00FF00, 0, 255, 0),
        (0x0000FF, 0, 0, 255),
    ])
    func initWithHex(
        value: Int,
        expectedRed: Double,
        expectedGreen: Double,
        expectedBlue: Double
    ) {
        let rgb = RGB(hex: value)
        #expect(abs(rgb.red - expectedRed) <= 0.001)
        #expect(abs(rgb.green - expectedGreen) < 0.001)
        #expect(abs(rgb.blue - expectedBlue) < 0.001)
    }
}
