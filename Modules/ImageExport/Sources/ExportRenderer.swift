//  Created by Geoff Pado on 8/1/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import CoreGraphics
import Foundation
import ImageIO
import UniformTypeIdentifiers

import ICBDrawingLayout

struct ExportRenderer {
    func render(_ readiedImage: ReadiedImage) async throws -> Data {
        let context = try newContext(for: readiedImage)

        // fill the context with white
        context.setFillColor(CGColor(gray: 1, alpha: 1))
        context.fill(CGRect(origin: .zero, size: readiedImage.size))

        // draw the generated image
        try await addGeneratedImage(from: readiedImage, to: context)

        // draw the color strokes
        try addDrawingImage(from: readiedImage, to: context)

        return try imageData(from: context)
    }

    private func newContext(for readiedImage: ReadiedImage) throws -> CGContext {
        guard let context = CGContext(
            data: nil,
            width: Int(readiedImage.size.width),
            height: Int(readiedImage.size.height),
            bitsPerComponent: 8,
            bytesPerRow: Int(readiedImage.size.width * 4),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo(
                alpha: .premultipliedFirst,
                component: .integer,
                byteOrder: .order32Little,
                pixelFormat: .packed
            )
        ) else {
            throw ExportError.cannotCreateContext
        }
        return context
    }

    private func addGeneratedImage(
        from readiedImage: ReadiedImage,
        to context: CGContext
    ) async throws {
        guard let generatedImage = await readiedImage.image.cgImage else {
            throw ExportError.cannotCreateGeneratedCGImage
        }

        let imageFrame = DrawingLayoutCalculator()
            .layout(in: readiedImage.size).imageFrame
        let flippedImageFrame = CGRect(
            origin: CGPoint(
                x: imageFrame.origin.x,
                y: readiedImage.size.height - (imageFrame.origin.y + imageFrame.size.height)
            ),
            size: imageFrame.size
        )

        context.draw(generatedImage, in: flippedImageFrame)
    }

    private func addDrawingImage(
        from readiedImage: ReadiedImage,
        to context: CGContext
    ) throws {
        guard let drawingImage = try readiedImage.drawing.cgImage else {
            throw ExportError.cannotCreateDrawingCGImage
        }

        try context.draw(
            drawingImage,
            in: CGRect(
                origin: readiedImage.drawingOrigin,
                size: readiedImage.drawing.bounds.size
            )
        )
    }

    private func imageData(from context: CGContext) throws -> Data {
        guard let finalImage = context.makeImage() else {
            throw ExportError.cannotCreateImageFromContext
        }
        
        let data = NSMutableData()

        guard let destination = CGImageDestinationCreateWithData(
            data as CFMutableData,
            UTType.png.identifier as CFString,
                1,
            nil
        ) else {
            throw ExportError.cannotCreateImageDestination
        }

        CGImageDestinationAddImage(destination, finalImage, nil)

        guard CGImageDestinationFinalize(destination) else {
            throw ExportError.cannotFinalizeImageDestination
        }

        return data as Data
    }
}
