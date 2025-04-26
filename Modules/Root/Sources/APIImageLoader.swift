//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import API
import SwiftUI

struct APIImageLoader {
    private let apiClient: APIClient
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func loadImage(prompt: String) async throws -> Image {
        let data = try await apiClient.requestPage(prompt: prompt)
        guard let image = UIImage(data: data).map(Image.init) else {
            throw APIImageLoaderError.cannotDecodeImageData
        }

        return image
    }
}

enum APIImageLoaderError: Error {
    case cannotDecodeImageData
}
