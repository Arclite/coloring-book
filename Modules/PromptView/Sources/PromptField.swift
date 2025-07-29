//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PromptField: View {
    @Binding private var prompt: String
    private let prompter: any Prompter
    init(
        prompt: Binding<String>,
        prompter: any Prompter = ImagePrompter()
    ) {
        _prompt = prompt
        self.prompter = prompter
    }

    var body: some View {
        TextField(Strings.PromptField.placeholder, text: $prompt)
            .frame(maxWidth: 400)
            .onSubmit {
                Task {
                    await prompter.fetchImage(forPrompt: prompt)
                }
            }
    }
}
