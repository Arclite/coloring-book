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
        request.httpBody = try JSONEncoder().encode(RemoteAPIClientRequest(prompt: prompt))

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(RemoteAPIClientResponse.self, from: data)

        guard let imageBase64 = response.images.first?.base64Encoded,
              let imageData = Data(base64Encoded: imageBase64) else {
            throw RemoteAPIClientError.missingImageData
        }

        return imageData
    }
}

struct RemoteAPIClientRequest: Encodable {
    let model = "gpt-image-1"
    let prompt: String
    let n = 1
    let size = "1024x1024"
    let quality = "medium"
    let background = "opaque"
}

struct RemoteAPIClientResponse: Decodable {
    let createdTimestamp: Int
    let images: [Image]
    let usage: Usage

    enum CodingKeys: String, CodingKey {
        case createdTimestamp = "created"
        case images = "data"
        case usage
    }

    struct Image: Decodable {
        let base64Encoded: String

        enum CodingKeys: String, CodingKey {
            case base64Encoded = "b64_json"
        }
    }

    struct Usage: Decodable {
        let totalTokens: Int
        let inputTokens: Int
        let outputTokens: Int

        enum CodingKeys: String, CodingKey {
            case totalTokens = "total_tokens"
            case inputTokens = "input_tokens"
            case outputTokens = "output_tokens"
        }
    }
}

enum RemoteAPIClientError: Error {
    case invalidURL
    case missingImageData
}
