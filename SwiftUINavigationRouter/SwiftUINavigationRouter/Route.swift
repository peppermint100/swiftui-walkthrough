//
//  Route.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import Foundation

enum Route: Hashable {
    
    case cafeMenu(item: any CafeMenu)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case let (.cafeMenu(lhsItem), .cafeMenu(rhsItem)):
            return lhsItem.id == rhsItem.id
        }
    }
}
