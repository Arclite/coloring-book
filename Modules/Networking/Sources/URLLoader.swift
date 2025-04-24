//  Created by Geoff Pado on 1/14/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

public protocol URLLoader: Sendable {
    func loadData(for request: URLRequest) async throws -> Data
}
