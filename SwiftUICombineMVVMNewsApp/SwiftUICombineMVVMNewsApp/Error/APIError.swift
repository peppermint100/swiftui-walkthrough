//
//  APIError.swift
//  SwiftUICombineMVVMNewsApp
//
//  Created by peppermint100 on 3/26/24.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Fail to decode"
        case .errorCode(let code):
            return "\(code) something went wrong"
        case .unknown:
            return "unknown error"
        }
    }
}
