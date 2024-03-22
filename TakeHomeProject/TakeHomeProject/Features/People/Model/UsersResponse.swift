//
//  UsersResponse.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import Foundation

struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
