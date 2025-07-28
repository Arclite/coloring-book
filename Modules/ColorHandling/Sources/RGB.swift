//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct RGB: Hashable, Sendable {
    public let red: Double
    public let green: Double
    public let blue: Double

    public init(_ hexLiteral: Int) {
        red = Double((hexLiteral & 0xFF0000) >> 16)
        green = Double((hexLiteral & 0x00FF00) >> 8)
        blue = Double((hexLiteral & 0x0000FF) >> 0)
    }
}
