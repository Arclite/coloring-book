//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI

import FactoryKit

import ICBImageLoading
import ICBNavigation

public struct PromptView: View {
    public init() {}

    @State private var prompt = ""
    public var body: some View {
        VStack(spacing: 20) {
            Text("What would you like to color?")
                .font(.title2)
            TextField("Prompt", text: $prompt)
                .frame(maxWidth: 400)
                .onSubmit { fetchImage() }
            Button {
                fetchImage()
            } label: {
                Text("Make it!")
            }
        }
    }

    @Injected(\.imageLoader) private var imageLoader
    @Injected(\.navigator) private var navigator
    private func fetchImage() {
        navigator.currentRoute = .loading
        Task {
            do {
                let image = try await imageLoader.loadImage(prompt: prompt)
                navigator.currentRoute = .drawing(image)
            } catch {
                navigator.currentRoute = .error(error)
            }
        }
    }
}

#Preview {
    PromptView()
}
