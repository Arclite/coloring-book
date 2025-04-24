//  Created by Geoff Pado on 4/23/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import Networking

public enum OpenAI {
    public static func client(urlLoader: any URLLoader) -> any OpenAIClient {
        return RemoteOpenAIClient(urlLoader: urlLoader)
    }
}
