//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Synchronization

import ICBImageLoading

public final class SpyImageLoader: ImageLoader {
    private let result: Result<Image, any Error>
    public init(result: Result<Image, any Error>) {
        self.result = result
    }

    public func loadImage(prompt: String) async throws -> Image {
        self.prompt = prompt
        return try result.get()
    }

    private let _prompt = Mutex<String?>(nil)
    public var prompt: String? {
        get { _prompt.withLock { $0 } }
        set { _prompt.withLock { $0 = newValue } }
    }
}
