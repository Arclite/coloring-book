//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

struct LocalAPIClient: APIClient {
    func requestPage(prompt: String) async throws -> Data {
        guard let url = URL(string: "http://localhost:8008/generate") else {
            throw RemoteAPIClientError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(RemoteAPIClientRequest(prompt: prompt))

        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}

