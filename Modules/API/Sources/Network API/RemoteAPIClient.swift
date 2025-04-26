//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import Networking

struct RemoteAPIClient: APIClient {
    private let networkClient: NetworkAPIClient
    init(urlLoader: any URLLoader) {
        guard let url = URL(string: "https://polaris.cocoatype.com/generate") else {
            fatalError("Invalid remote API client URL")
        }

        networkClient = NetworkAPIClient(generateURL: url, urlLoader: urlLoader)
    }

    func requestPage(prompt: String) async throws -> Data {
        try await networkClient.requestPage(prompt: prompt)
    }
}
