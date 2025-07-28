//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public extension Color {
    // MARK: - Hex

    init(hexLiteral hex: Int, alpha: Double = 1.0) {
        let rgb = RGB(hex)

        self.init(red: rgb.red / 255.0,
                  green: rgb.green / 255.0,
                  blue: rgb.blue / 255.0,
                  opacity: alpha)
    }

    init(
        lightHex: Int,
        lightAlpha: Double = 1,
        darkHex: Int,
        darkAlpha: Double = 1
    ) {
        let dynamicColor = DynamicColor(
            lightHex: lightHex,
            lightAlpha: lightAlpha,
            darkHex: darkHex,
            darkAlpha: darkAlpha
        )
        self.init(dynamicColor)
    }
}
