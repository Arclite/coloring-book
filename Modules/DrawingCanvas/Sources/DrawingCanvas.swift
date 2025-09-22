//  Created by Geoff Pado on 4/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

@preconcurrency import PencilKit
import SwiftUI

public struct DrawingCanvas<ColorStyle: ShapeStyle>: UIViewRepresentable where ColorStyle.Resolved == Color {
    private let style: ColorStyle
    @Binding private var drawing: PKDrawing
    public init(style: ColorStyle, drawing: Binding<PKDrawing>) {
        self.style = style
        _drawing = drawing
    }

    public func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        canvasView.overrideUserInterfaceStyle = .light
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = Self.tool(for: style, in: context)
        canvasView.delegate = context.coordinator
        return canvasView
    }

    public func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        canvasView.delegate = context.coordinator
        canvasView.tool = Self.tool(for: style, in: context)

        if canvasView.drawing != drawing {
            context.coordinator.ignoreCanvasChanges = true
            canvasView.drawing = drawing
            context.coordinator.ignoreCanvasChanges = false
        }
    }

    private static func tool(for style: ColorStyle, in context: Context) -> PKInkingTool {
        let baseColor = style.resolve(in: context.environment)
        let resolvedColor = baseColor.resolve(in: context.environment)
        let uiColor = UIColor(cgColor: resolvedColor.cgColor)
        return PKInkingTool(ink: PKInk(.crayon, color: uiColor), width: 10)
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(drawingCanvas: self)
    }

    public class Coordinator: NSObject, PKCanvasViewDelegate {
        private let drawingCanvas: DrawingCanvas
        init(drawingCanvas: DrawingCanvas) {
            self.drawingCanvas = drawingCanvas
        }

        var ignoreCanvasChanges = false
        public func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            guard ignoreCanvasChanges == false else { return }
            drawingCanvas.drawing = canvasView.drawing
        }
    }
}
