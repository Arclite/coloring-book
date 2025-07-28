//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

@testable import ICBColorHandling

struct ColorExtensionsTests {
    @Test func initStatic() {
        let color = Color(hexLiteral: 0xFF0000, alpha: 0.6)
        let resolved = color.resolve(in: EnvironmentValues())

        #expect(abs(resolved.red - 1) <= 0.001)
        #expect(abs(resolved.green - 0) <= 0.001)
        #expect(abs(resolved.blue - 0) <= 0.001)
        #expect(abs(resolved.opacity - 0.6) <= 0.001)
    }

    @Test func initDynamicLight() {
        let color = Color(
            lightHex: 0x00FF00,
            lightAlpha: 0.8,
            darkHex: 0x0000FF,
            darkAlpha: 0.4
        )
        var environment = EnvironmentValues()
        environment.colorScheme = .light
        let resolved = color.resolve(in: environment)

        #expect(abs(resolved.red - 0x00) <= 0.001)
        #expect(abs(resolved.green - 0xFF) <= 0.001)
        #expect(abs(resolved.blue - 0x00) <= 0.001)
        #expect(abs(resolved.opacity - 0.8) <= 0.001)
    }

    @Test func initDynamicDark() {
        let color = Color(
            lightHex: 0x00FF00,
            lightAlpha: 0.8,
            darkHex: 0x0000FF,
            darkAlpha: 0.4
        )
        var environment = EnvironmentValues()
        environment.colorScheme = .dark
        let resolved = color.resolve(in: environment)

        #expect(abs(resolved.red - 0x00) <= 0.001)
        #expect(abs(resolved.green - 0x00) <= 0.001)
        #expect(abs(resolved.blue - 0xFF) <= 0.001)
        #expect(abs(resolved.opacity - 0.4) <= 0.001)
    }
}
