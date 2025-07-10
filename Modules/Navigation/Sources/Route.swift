//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public enum Route {
    case prompt
    case loading
    case drawing(Image)
    case error(Error)
}
