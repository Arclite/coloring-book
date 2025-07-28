//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct DrawingColor: Hashable, Identifiable, Sendable, ShapeStyle {
    private let hexValue: Int
    init(_ hexValue: Int) {
        self.hexValue = hexValue
    }

    public var id: String { String(hexValue, radix: 16) }
    public var baseColor: Color { Color(hexLiteral: hexValue) }

    // MARK: Shape Style

    public func resolve(in environment: EnvironmentValues) -> Color {
        baseColor
    }

    // MARK: Standard Colors

    static let red = DrawingColor(0xED0A3F)
    static let orangeRed = DrawingColor(0xFF3F34)
    static let orange = DrawingColor(0xFF8833)
    static let yellowOrange = DrawingColor(0xFFAE42)
    static let yellow = DrawingColor(0xFBE870)
    static let greenYellow = DrawingColor(0xC5E17A)
    static let green = DrawingColor(0x01A368)
    static let blueGreen = DrawingColor(0x0095B7)
    static let blue = DrawingColor(0x0066FF)
    static let violetBlue = DrawingColor(0x6456B7)
    static let violet = DrawingColor(0x8359A3)
    static let redViolet = DrawingColor(0xBB3385)
    static let pink = DrawingColor(0xFFA6C9)
    static let brown = DrawingColor(0xAF593E)
    static let black = DrawingColor(0x000000)

    public static let allColors: [DrawingColor] = [
        red,
        orangeRed,
        orange,
        yellowOrange,
        yellow,
        greenYellow,
        green,
        blueGreen,
        blue,
        violetBlue,
        violet,
        redViolet,
        pink,
        brown,
        black,
    ]
}
