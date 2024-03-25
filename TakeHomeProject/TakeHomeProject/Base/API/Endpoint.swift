//
//  Endpoint.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/25/24.
//

import Foundation

enum Endpoint {
    case people
    case detail(id: Int)
    case create(submittionData: Data?)
}

extension Endpoint {
    var host: String {
        "reqres.in"
    }
    
    var path: String {
        switch self {
        case .people, .create:
            return "/api/users"
        case .detail(let id):
            return "/api/users/\(id)"
        }
    }
    
    var methodType: MethodType {
        switch self {
        case .people, .detail:
            return .GET
        case .create(let data):
            return .POST(data: data)
        }
    }
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        #if DEBUG
        urlComponents.queryItems = [
            URLQueryItem(name: "delay", value: "1")
        ]
        #endif
        
        return urlComponents.url
    }
}

extension Endpoint {
    enum MethodType {
        case GET
        case POST(data: Data?)
    }
}
