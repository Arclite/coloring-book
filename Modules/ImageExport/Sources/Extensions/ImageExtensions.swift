//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

extension Image {
    @MainActor
    var cgImage: CGImage? {
        let renderer = ImageRenderer(content: self)
        return renderer.cgImage
    }
}
