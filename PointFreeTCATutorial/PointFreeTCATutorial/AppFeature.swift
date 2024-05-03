//
//  AppFeature.swift
//  WardApp
//
//  Created by peppermint100 on 5/3/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppFeature {
    
    struct State: Equatable {
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
        var contactTab = ContactsFeature.State()
    }
    
    enum Action {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
        case contactTab(ContactsFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
        }
        
        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
        }
        
        Scope(state: \.contactTab, action: \.contactTab) {
            ContactsFeature()
        }
        
        Reduce { state, action in
            return .none
        }
    }
}
