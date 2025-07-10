//  Created by Geoff Pado on 7/9/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public protocol Navigator: AnyObject {
    var currentRoute: Route { get set }
}
