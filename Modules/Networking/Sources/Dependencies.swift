//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

public extension Container {
    var urlLoader: Factory<any URLLoader> {
        Factory(self) {
            FoundationURLLoader()
        }
    }
}
