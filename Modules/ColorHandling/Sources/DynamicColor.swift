//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct DynamicColor: Hashable, ShapeStyle {
    private let lightRGB: RGB
    private let lightAlpha: Double
    private let darkRGB: RGB
    private let darkAlpha: Double

    public init(
        lightHex: Int,
        lightAlpha: Double = 1,
        darkHex: Int,
        darkAlpha: Double = 1
    ) {
        self.lightRGB = RGB(lightHex)
        self.lightAlpha = lightAlpha
        self.darkRGB = RGB(darkHex)
        self.darkAlpha = darkAlpha
    }

    public func resolve(in environment: EnvironmentValues) -> Color.Resolved {
        switch environment.colorScheme {
        case .light:
            Color.Resolved(lightRGB, alpha: lightAlpha)
        case .dark:
            Color.Resolved(darkRGB, alpha: darkAlpha)
        @unknown default:
            Color.Resolved(lightRGB, alpha: lightAlpha)
        }
    }
}

extension Color.Resolved {
    init(_ rgb: RGB, alpha: Double) {
        self.init(
            red: Float(rgb.red),
            green: Float(rgb.green),
            blue: Float(rgb.blue),
            opacity: Float(alpha)
        )
    }
}
