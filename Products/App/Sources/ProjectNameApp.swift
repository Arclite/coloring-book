//  Created by Geoff Pado on 12/25/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import API
import Networking
import Root
import SwiftUI

@main
struct ProjectNameApp: App {
    private let apiClient: any APIClient
    init() {
        let urlLoader = Networking.urlLoader
        apiClient = API.client(urlLoader: urlLoader)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(apiClient: apiClient)
        }
    }
}
