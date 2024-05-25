//
//  Dessert.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import Foundation

struct Dessert: Hashable, Identifiable, CafeMenu {
    let id: String
    let name: String
}

extension Dessert {
    static let all: [Dessert] =
        [
            Dessert(id: "cake", name: "cake"),
            Dessert(id: "chocolate", name: "chocolate"),
            Dessert(id: "cupcake", name: "cupcake"),
            Dessert(id: "candy", name: "candy"),
        ]
}
