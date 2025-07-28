//  Created by Geoff Pado on 5/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Synchronization

import ICBLogging
import TestHelpersInterface

public final class SpyLogger: Logger {
    public init() {}

    private let _loggedEvents = Mutex([Event]())
    public var loggedEvents: [Event] {
        get {
            return _loggedEvents.withLock { $0 }
        }
        set {
            _loggedEvents.withLock { $0 = newValue }
        }
    }

    public func log(_ event: Event) {
        loggedEvents.append(event)
    }
}
