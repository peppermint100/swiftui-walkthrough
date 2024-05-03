//
//  AppView.swift
//  WardApp
//
//  Created by peppermint100 on 5/3/24.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            ContactsView(store: store.scope(state: \.contactTab, action: \.contactTab))
                .tabItem { Text("Contacts") }
            
            CounterView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem { Text("Counter 1") }
            
            CounterView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem { Text("Counter 2") }
        }
    }
}

#Preview {
  AppView(
    store: Store(initialState: AppFeature.State()) {
      AppFeature()
    }
  )
}
