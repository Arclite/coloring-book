//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

struct RemoteOpenAIClientResponse: Decodable {
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
