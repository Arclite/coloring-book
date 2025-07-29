//  Created by Geoff Pado on 7/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Synchronization

import ICBNavigation

public final class StubNavigator: Navigator, Sendable {
    private let _allRoutes: Mutex<[Route]>
    public var allRoutes: [Route] {
        get { _allRoutes.withLock { $0 } }
    }

    private let _currentRoute: Mutex<Route>
    public var currentRoute: Route {
        get { _currentRoute.withLock { $0 } }
        set {
            _currentRoute.withLock { $0 = newValue }
            _allRoutes.withLock { $0.append(newValue) }
        }
    }

    public init(route: Route) {
        _currentRoute = Mutex(route)
        _allRoutes = Mutex([route])
    }
}
