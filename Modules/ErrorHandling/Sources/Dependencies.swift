//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import FactoryKit

public extension Container {
    var logger: Factory<any Logger> {
        Factory(self) {
            DefaultHandler()
        }
    }
}
