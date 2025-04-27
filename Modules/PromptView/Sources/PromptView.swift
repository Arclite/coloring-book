//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI

public struct PromptView: View {
    private let action: (String) -> Void
    public init(action: @escaping (String) -> Void) {
        self.action = action
    }

    @State private var prompt = ""
    public var body: some View {
        VStack(spacing: 20) {
            Text("What would you like to color?")
                .font(.title2)
            TextField("Prompt", text: $prompt)
                .frame(maxWidth: 400)
                .onSubmit { action(prompt) }
            Button {
                action(prompt)
            } label: {
                Text("Make it!")
            }
        }
    }
}

#Preview {
    PromptView { _ in }
}
