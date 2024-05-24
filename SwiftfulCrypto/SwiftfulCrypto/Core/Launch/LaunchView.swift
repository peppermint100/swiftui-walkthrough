//
//  LaunchView.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/24/24.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    LaunchView()
}
