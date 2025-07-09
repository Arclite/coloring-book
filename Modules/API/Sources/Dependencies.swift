//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

public extension Container {
    var apiClient: Factory<any APIClient> {
        Factory(self) {
            let environment = ProcessInfo.processInfo.environment
            guard environment["XCODE_RUNNING_FOR_PREVIEWS"] == nil else {
                return PreviewAPIClient()
            }

            switch environment["API_TYPE"] {
            case "local":
                return LocalAPIClient()
            case "preview":
                return PreviewAPIClient()
            default:
                return RemoteAPIClient()
            }
        }
    }
}
