//  Created by Geoff Pado on 7/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public protocol ImageLoader: Sendable {
    func loadImage(prompt: String) async throws -> Image
}
