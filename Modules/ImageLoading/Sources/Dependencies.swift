//  Created by Geoff Pado on 7/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import FactoryKit

public extension Container {
    var imageLoader: Factory<any ImageLoader> {
        Factory(self) {
            APIImageLoader()
        }
    }
}
