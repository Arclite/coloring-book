//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import ViewInspector

@testable import ICBPromptView

@MainActor
struct PromptViewTests {
    @Test func body() throws {
        let view = try PromptView().inspect()

        let vStack = try view.vStack()
        #expect(vStack.count == 3)

        _ = try vStack.find(Header.self)
        _ = try vStack.find(PromptField.self)
        _ = try vStack.find(PromptButton.self)
    }
}
