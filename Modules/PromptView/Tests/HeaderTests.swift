//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import ViewInspector

@testable import ICBPromptView

@MainActor
struct HeaderTests {
    @Test func body() throws {
        let view = try Header().inspect()

        let text = try view.find(text: Strings.Header.text)
        let font = try text.attributes().font()
        #expect(font == .title2)
    }
}
