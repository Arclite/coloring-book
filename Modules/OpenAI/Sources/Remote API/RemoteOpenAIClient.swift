//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import Networking

struct RemoteOpenAIClient: OpenAIClient {
    private let urlLoader: any URLLoader
    init(
        urlLoader: any URLLoader
    ) {
        self.urlLoader = urlLoader
    }

    func requestPage(prompt: String) async throws -> Data {
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else {
            throw RemoteOpenAIClientError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(RemoteOpenAIClientRequest(prompt: PromptCreator().prompt(from: prompt)))

        let data = try await urlLoader.loadData(for: request)
        let response = try JSONDecoder().decode(RemoteOpenAIClientResponse.self, from: data)

        guard let imageBase64 = response.images.first?.base64Encoded,
              let imageData = Data(base64Encoded: imageBase64) else {
            throw RemoteOpenAIClientError.missingImageData
        }

        return imageData
    }
}
