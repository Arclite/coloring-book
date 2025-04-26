//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

@preconcurrency import PencilKit
import SwiftUI

public struct DrawingCanvas: UIViewRepresentable {
    private let color: Color
    public init(color: Color) {
        self.color = color
    }

    public func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        canvasView.overrideUserInterfaceStyle = .light
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = Self.tool(for: color, in: context)
        context.environment.toolPicker.setVisible(true, forFirstResponder: canvasView)
        return canvasView
    }

    public func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        canvasView.tool = Self.tool(for: color, in: context)
    }

    private static func tool(for color: Color, in context: Context) -> PKInkingTool {
        let resolvedColor = color.resolve(in: context.environment)
        let uiColor = UIColor(cgColor: resolvedColor.cgColor)
        return PKInkingTool(ink: PKInk(.crayon, color: uiColor), width: 10)
    }
}

//struct ToolPickerEnvironmentKey: EnvironmentKey {
//    static let defaultValue = PKToolPicker()
//}
//
extension EnvironmentValues {
    @Entry var toolPicker = PKToolPicker()
//    var toolPicker: PKToolPicker {
//        get { self[ToolPickerEnvironmentKey.self] }
//        set { self[ToolPickerEnvironmentKey.self] = newValue }
//    }
}
//
