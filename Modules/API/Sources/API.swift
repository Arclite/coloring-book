//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

public enum API {
    public static func client() -> any APIClient {
        if ProcessInfo.processInfo.environment["USE_LOCALHOST"] != nil {
            return LocalAPIClient()
        } else {
            return RemoteAPIClient()
        }
    }
}
