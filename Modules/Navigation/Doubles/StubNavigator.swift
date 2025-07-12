//  Created by Geoff Pado on 7/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ICBNavigation

public class StubNavigator: Navigator {
    public var currentRoute: Route

    public init(route: Route) {
        self.currentRoute = route
    }
}
