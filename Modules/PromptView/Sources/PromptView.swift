//  Created by Geoff Pado on 4/25/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI

public struct PromptView: View {
    public init() {}

    @State private var prompt = ""
    public var body: some View {
        VStack(spacing: 20) {
            Header()
            PromptField(prompt: $prompt)
            PromptButton(prompt: prompt)
        }
    }
}

#Preview {
    PromptView()
}
