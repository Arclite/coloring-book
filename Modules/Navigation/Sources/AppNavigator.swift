//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

@Observable
class AppNavigator: Navigator {
    var currentRoute: Route = .prompt
}
