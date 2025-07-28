//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

@testable import ICBColorHandling

struct DrawingColorTests {
    @Test(arguments: [
        (0x000000, "0"),
        (0xFF0000, "ff0000"),
        (0xFF3B30, "ff3b30"),
        (0x00FF00, "ff00"),
        (0x00FFFF, "ffff"),
    ])
    func id(hexValue: Int, hexString: String) {
        let color = DrawingColor(hexValue)
        #expect(color.id == hexString)
    }

    @Test(arguments: [
        0x000000,
        0xFF0000,
        0xFF3B30,
        0x00FF00,
        0x00FFFF,
    ])
    func baseColor(hexValue: Int) {
        let drawingColor = DrawingColor(hexValue)
        let expectedColor = Color(hexLiteral: hexValue)
        #expect(drawingColor.baseColor == expectedColor)
    }

    @Test(arguments: DrawingColor.allColors)
    func resolve(drawingColor: DrawingColor) {
        #expect(drawingColor.resolve(in: EnvironmentValues()) == drawingColor.baseColor)
    }
}
