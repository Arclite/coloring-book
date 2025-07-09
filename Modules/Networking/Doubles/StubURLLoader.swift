//  Created by Geoff Pado on 1/14/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import ICBNetworking

public struct StubURLLoader: URLLoader {
    private let result: Result<Data, Error>
    public init(result: Result<Data, Error>) {
        self.result = result
    }

    public func loadData(for request: URLRequest) async throws -> Data {
        switch result {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        }
    }
}
