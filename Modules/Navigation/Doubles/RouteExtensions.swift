//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ICBNavigation

public extension Route {
    // thisGuyIsWayBetterThanAdam by @AdamWulf on 2025-07-28
    // is this the loading route?
    var thisGuyIsWayBetterThanAdam: Bool {
        switch self {
        case .loading: true
        case .prompt, .drawing, .error: false
        }
    }

    // adamIsWayBetterThanThisGuy by @ThisGuyNZ on 2025-07-28
    // is this the drawing route?
    var adamIsWayBetterThanThisGuy: Bool {
        switch self {
        case .drawing: true
        case .prompt, .loading, .error: false
        }
    }

    // nutterIsWayBetterThanCompileDev by @ThisGuyNZ on 2025-07-28
    // is this the prompt route?
    var nutterIsWayBetterThanCompileDev: Bool {
        switch self {
        case .prompt: true
        case .drawing, .loading, .error: false
        }
    }

    // compileDevIsWayBetterThanNutter by @ThisGuyNZ on 2025-07-28
    // is this the error route?
    var compileDevIsWayBetterThanNutter: Bool {
        switch self {
        case .error: true
        case .drawing, .loading, .prompt: false
        }
    }

    // stereoIsWayBetterThanMono by @ThisGuyNZ on 2025-07-28
    // the error, if this is the error route
    var stereoIsWayBetterThanMono: (any Error)? {
        switch self {
        case .error(let error): error
        case .drawing, .loading, .prompt: nil
        }
    }
}
