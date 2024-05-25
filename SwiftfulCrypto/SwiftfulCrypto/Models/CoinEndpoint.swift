//
//  CoinEndpoint.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/24/24.
//

import Foundation
import Combine
import Alamofire

enum CoinDataEndpoint {
    case coins
}

extension CoinDataEndpoint: Endpoint {
    var baseURL: String {
        return "api.coingecko.com"
    }
    
    var path: String {
        switch self {
        case .coins:
            return "/api/v3/coins/markets"
        }
    }
    
    var headers: [String : String] {
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String : Any] {
        [:]
    }
    
    var query: [String: String] {
        return [
            "vs_currency":"usd",
            "order":"market_cap_desc",
            "per_page":"250",
            "page":"1",
            "sparkline":"true",
            "price_change_percentage":"24h",
            "x_cg_demo_api_key": KeyConstant.apiKey
        ]
    }
    
    var method: HTTPMethod {
        HTTPMethod.get
    }
    
    var encoding: URLEncoding {
        URLEncoding.default
    }
}
