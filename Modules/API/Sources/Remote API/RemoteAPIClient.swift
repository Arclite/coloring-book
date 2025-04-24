//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

struct RemoteAPIClient: APIClient {
    func requestPage(prompt: String) async throws -> Data {
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else {
            throw RemoteAPIClientError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(RemoteAPIClientRequest(prompt: PromptCreator().prompt(from: prompt)))

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(RemoteAPIClientResponse.self, from: data)

        guard let imageBase64 = response.images.first?.base64Encoded,
              let imageData = Data(base64Encoded: imageBase64) else {
            throw RemoteAPIClientError.missingImageData
        }

        return imageData
    }
}
