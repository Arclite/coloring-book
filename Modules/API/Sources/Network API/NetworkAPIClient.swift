//  Created by Geoff Pado on 4/26/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import ICBNetworking

struct NetworkAPIClient: APIClient {
    private let generateURL: URL
    private let urlLoader: any URLLoader
    init(generateURL: URL, urlLoader: any URLLoader) {
        self.generateURL = generateURL
        self.urlLoader = urlLoader
    }

    func requestPage(prompt: String) async throws -> Data {
        var request = URLRequest(url: generateURL)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(RemoteAPIClientRequest(prompt: prompt))

        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
