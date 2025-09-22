//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import UIKit

extension PKDrawing {
    var cgImage: CGImage? {
        image(from: bounds, scale: 1).cgImage
    }
}
