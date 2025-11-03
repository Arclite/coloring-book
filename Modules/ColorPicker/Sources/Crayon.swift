//  Created by Geoff Pado on 11/3/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct Crayon: View {
    private let color: Color
    init(color: Color) {
        self.color = color
    }

    var body: some View {
        fixed(Asset.base.swiftUIImage)
            .overlay {
                color
                    .blendMode(.overlay)
            }
            .mask {
                fixed(Asset.mask.swiftUIImage)
            }

    }

    @ViewBuilder
    private func fixed(_ image: Image) -> some View {
        image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(height: 44)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Crayon(color: .red)
        .background(Color.gray)
}
