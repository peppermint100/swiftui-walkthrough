//
//  SwiftUINavigationRouterApp.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import SwiftUI

@main
struct SwiftUINavigationRouterApp: App {
    
    @StateObject private var router = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
