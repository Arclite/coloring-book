//  Created by Geoff Pado on 12/25/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import API
import OSLog
import SwiftUI

public struct ContentView: View {
    public init() {}

    @State private var image: Image?
    @State private var text = "No data yet"
    public var body: some View {
        VStack {
            if let image {
                image
            }
            Text(text)
            Button {
                Task {
                    do {
                        let data = try await API.client.requestPage(prompt: "alicorn ducks")
                        let hex = data.map { String(format: "%02hhx", $0) }.joined()
                        image = UIImage(data: data).map(Image.init)
                        text = "Received image data!"
                        os_log("received data: <%{public}@>", hex)
                    } catch {
                        text = String(describing: error)
                        os_log("received error: %{public}@", text)
                    }
                }
            } label: {
                Text("Send Prompt")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
