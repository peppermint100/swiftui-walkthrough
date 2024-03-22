//
//  Models.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
}

struct Support: Codable {
    let url: String
    let text: String
}
