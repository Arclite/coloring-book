//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

import ViewInspector

import TestHelpers

@testable import ICBPromptView

@MainActor
struct PromptFieldTests {
    @Test func body() throws {
        let promptBinding = Binding<String>(wrappedValue: "")
        let field = try PromptField(prompt: promptBinding).inspect()

        let label = try field.textField().labelView()
        _ = try label.find(text: Strings.PromptField.placeholder)

        try field.textField().setInput("test")
        #expect(promptBinding.wrappedValue == "test")
    }

    @Test func submitAction() async throws {
        let prompter = SpyPrompter()
        try await confirmation { confirmation in
            prompter.fetchExpectation = confirmation
            let field = PromptField(prompt: .constant("test"), prompter: prompter)
            try field.inspect().textField().callOnSubmit()

            try await Task.sleep(for: .milliseconds(50))
        }

        let prompt = try #require(prompter.prompt)
        #expect(prompt == "test")
    }
}
