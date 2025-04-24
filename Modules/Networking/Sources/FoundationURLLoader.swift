//  Created by Geoff Pado on 1/14/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct FoundationURLLoader: URLLoader {
    func loadData(for request: URLRequest) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
