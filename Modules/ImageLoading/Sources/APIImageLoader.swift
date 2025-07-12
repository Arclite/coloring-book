//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import ICBAPI

struct APIImageLoader: ImageLoader {
    @Injected(\.apiClient) private var apiClient

    func loadImage(prompt: String) async throws -> Image {
        let data = try await apiClient.requestPage(prompt: prompt)
        guard let image = UIImage(data: data).map(Image.init) else {
            throw Error.cannotDecodeImageData
        }

        return image
    }

    enum Error: Swift.Error {
        case cannotDecodeImageData
    }
}
