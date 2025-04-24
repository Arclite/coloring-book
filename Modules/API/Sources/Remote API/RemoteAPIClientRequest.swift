//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

struct RemoteAPIClientRequest: Encodable {
    let model = "gpt-image-1"
    let prompt: String
    let n = 1
    let size = "1024x1024"
    let quality = "medium"
    let background = "opaque"
}
