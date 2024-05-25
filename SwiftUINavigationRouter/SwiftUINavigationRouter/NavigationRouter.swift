//
//  NavigationRouter.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import SwiftUI

class NavigationRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(to route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func reset() {
        path.removeLast(path.count)
    }
}
