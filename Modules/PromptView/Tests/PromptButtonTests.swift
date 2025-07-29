//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import ViewInspector

import TestHelpers

@testable import ICBPromptView

@MainActor
struct PromptButtonTests {
    @Test func body() throws {
        let button = PromptButton(prompt: "test")
        let label = try button.inspect().button().labelView()
        _ = try label.find(text: Strings.PromptButton.title)
    }

    @Test func buttonAction() async throws {
        let prompter = SpyPrompter()
        try await confirmation { confirmation in
            prompter.fetchExpectation = confirmation
            let button = PromptButton(prompt: "test", prompter: prompter)
            try button.inspect().button().tap()

            try await Task.sleep(for: .milliseconds(50))
        }

        let prompt = try #require(prompter.prompt)
        #expect(prompt == "test")
    }
}
