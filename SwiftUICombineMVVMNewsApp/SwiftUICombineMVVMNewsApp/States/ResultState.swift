//
//  ResultState.swift
//  SwiftUICombineMVVMNewsApp
//
//  Created by peppermint100 on 3/26/24.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
