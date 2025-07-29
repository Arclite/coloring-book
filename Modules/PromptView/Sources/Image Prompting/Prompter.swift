//  Created by Geoff Pado on 7/28/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

protocol Prompter: Sendable {
    func fetchImage(forPrompt prompt: String) async
}
