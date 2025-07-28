//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

@preconcurrency import PencilKit
import SwiftUI

public struct DrawingCanvas<ColorStyle: ShapeStyle>: UIViewRepresentable where ColorStyle.Resolved == Color {
    private let style: ColorStyle
    public init(style: ColorStyle) {
        self.style = style
    }

    public func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        canvasView.overrideUserInterfaceStyle = .light
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = Self.tool(for: style, in: context)
        return canvasView
    }

    public func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        canvasView.tool = Self.tool(for: style, in: context)
    }

    private static func tool(for style: ColorStyle, in context: Context) -> PKInkingTool {
        let baseColor = style.resolve(in: context.environment)
        let resolvedColor = baseColor.resolve(in: context.environment)
        let uiColor = UIColor(cgColor: resolvedColor.cgColor)
        return PKInkingTool(ink: PKInk(.crayon, color: uiColor), width: 10)
    }
}
