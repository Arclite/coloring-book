//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Synchronization

import TestHelpers
import TestHelpersInterface

@testable import ICBPromptView

final class SpyPrompter: Prompter {
    private let _fetchExpectation = Mutex<Expectation?>(nil)
    var fetchExpectation: Expectation? {
        get { _fetchExpectation.withLock { $0 } }
        set { _fetchExpectation.withLock { $0 = newValue } }
    }

    private let _prompt = Mutex<String?>(nil)
    var prompt: String? {
        get { _prompt.withLock { $0 } }
        set { _prompt.withLock { $0 = newValue } }
    }

    func fetchImage(forPrompt prompt: String) async {
        self.prompt = prompt
        fetchExpectation?.fulfill()
    }
}
