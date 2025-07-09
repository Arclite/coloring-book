//  Created by Geoff Pado on 4/26/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

import ICBNetworking

struct NetworkAPIClient: APIClient {
    private let generateURL: URL
    @Injected(\.urlLoader) private var urlLoader
    init(generateURL: URL) {
        self.generateURL = generateURL
    }

    func requestPage(prompt: String) async throws -> Data {
        var request = URLRequest(url: generateURL)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(RemoteAPIClientRequest(prompt: prompt))

        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
