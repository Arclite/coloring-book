//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import ICBNetworking

public enum API {
    public static func client(urlLoader: any URLLoader) -> any APIClient {
        switch ProcessInfo.processInfo.environment["API_TYPE"] {
        case "local":
            return LocalAPIClient(urlLoader: urlLoader)
        case "preview":
            return PreviewAPIClient()
        default:
            return RemoteAPIClient(urlLoader: urlLoader)
        }
    }
}

