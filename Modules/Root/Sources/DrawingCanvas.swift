//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PencilKit
import SwiftUI

struct DrawingCanvas: UIViewRepresentable {
    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        canvasView.overrideUserInterfaceStyle = .light
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(ink: PKInk(.crayon, color: .purple), width: 10)
        context.environment.toolPicker.setVisible(true, forFirstResponder: canvasView)
        return canvasView
    }

    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
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
