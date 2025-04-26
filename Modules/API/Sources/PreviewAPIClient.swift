//  Created by Geoff Pado on 4/26/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

public struct PreviewAPIClient: APIClient {
    public init() {}

    public func requestPage(prompt: String) async throws -> Data {
        guard let pngData = Asset.sample.image.pngData() else {
            throw Error.missingSampleImagePNGData
        }
        return pngData
    }

    private enum Error: Swift.Error {
        case missingSampleImagePNGData
    }
}
