//  Created by Geoff Pado on 7/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

@testable import ICBLogging

@Suite(.container)
struct DependenciesTests {
    @Test func logger() {
        #expect(Container.shared.logger() is TelemetryLogger)
    }
}
