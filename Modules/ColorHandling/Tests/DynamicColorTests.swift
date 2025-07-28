//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

@testable import ICBColorHandling

struct DynamicColorTests {
    @Test func resolveLight() {
        let dynamicColor = DynamicColor(lightHex: 0xFFFFFF, darkHex: 0x000000)
        var environment = EnvironmentValues()
        environment.colorScheme = .light
        let resolved = dynamicColor.resolve(in: environment)
        #expect(abs(resolved.red - 0xFF) <= 0.001)
        #expect(abs(resolved.green - 0xFF) <= 0.001)
        #expect(abs(resolved.blue - 0xFF) <= 0.001)
    }

    @Test func resolveDark() {
        let dynamicColor = DynamicColor(lightHex: 0xFFFFFF, darkHex: 0x000000)
        var environment = EnvironmentValues()
        environment.colorScheme = .dark
        let resolved = dynamicColor.resolve(in: environment)
        #expect(abs(resolved.red - 0x00) <= 0.001)
        #expect(abs(resolved.green - 0x00) <= 0.001)
        #expect(abs(resolved.blue - 0x00) <= 0.001)
    }
}
