//  Created by Geoff Pado on 12/25/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import API
import DrawingView
import PromptView
import SwiftUI

public struct ContentView: View {
    private let imageLoader: APIImageLoader
    public init(apiClient: any APIClient) {
        imageLoader = APIImageLoader(apiClient: apiClient)
    }

    @State private var viewState: ViewState = .prompt
    public var body: some View {
        switch viewState {
        case .prompt:
            PromptView { prompt in
                viewState = .loading
                Task {
                    do {
                        let image = try await imageLoader.loadImage(prompt: prompt)
                        viewState = .drawing(image)
                    } catch {
                        viewState = .error(error)
                    }
                }
            }
        case .loading:
            ProgressView()
        case .drawing(let image):
            DrawingView(image: image)
        case .error(let error):
            Text(String(describing: error))
        }
    }

    enum ViewState {
        case prompt
        case loading
        case drawing(Image)
        case error(Error)
    }
}

#Preview {
    ContentView(apiClient: PreviewAPIClient())
}
