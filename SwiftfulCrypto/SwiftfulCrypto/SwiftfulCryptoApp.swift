//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/12/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
