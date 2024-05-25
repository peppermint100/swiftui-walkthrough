//
//  Coffee.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import Foundation

struct Coffee: Hashable, Identifiable, CafeMenu {
    let id: String
    let name: String
}

extension Coffee {
    static let all: [Coffee] = [
            Coffee(id: "latte", name: "latte"),
            Coffee(id: "espresso", name: "espresso"),
            Coffee(id: "cappuccino", name: "cappuccino"),
            Coffee(id: "americano", name: "americano"),
        ]
}
