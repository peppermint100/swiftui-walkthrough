//
//  PointFreeTCATutorialApp.swift
//  PointFreeTCATutorial
//
//  Created by peppermint100 on 5/3/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct PointFreeTCATutorialApp: App {
    
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: PointFreeTCATutorialApp.store)
        }
    }
}
