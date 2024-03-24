//
//  CheckmarkPopoverView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/24/24.
//

import SwiftUI

struct CheckmarkPopoverView: View {
    var body: some View {
        Symbols.checkmark
            .font(.system(.largeTitle,
                          design: .rounded).bold())
            .padding()
            .background(.thinMaterial,
                        in: RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    CheckmarkPopoverView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(.blue)
}
