//
//  AlamofireNetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/24/24.
//

import Foundation
import Alamofire
import Combine

protocol Endpoint {
    var baseURL: String { get }
    var url: URL { get }
    var path: String { get }
    var headers: [String: String] { get }
    var query: [String: String] { get }
    var parameters: [String: Any] { get }
    var method: HTTPMethod { get }
    var encoding: URLEncoding { get }
}

extension Endpoint {
    var url: URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = self.baseURL
      components.path = self.path
      components.queryItems = self.query.map { URLQueryItem(name: $0, value: $1) }
      return components.url!
    }
}

enum APIError: Error {
    case networkingError(error: Error)
}

class AlamofireNetworkingManager {
    
    static let shared = AlamofireNetworkingManager()
    private init() {}
    
    func run<T: Decodable>(_ endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, APIError> {
        let headersArray = endpoint.headers.map {
            HTTPHeader(name: $0, value: $1)
        }
        
        let headers = HTTPHeaders(headersArray)
        
        return AF.request(endpoint.url,
                   method: endpoint.method,
                   parameters: endpoint.parameters,
                   encoding: endpoint.encoding,
                   headers: headers)
        .publishDecodable(type: T.self)
        .value()
        .mapError { error in
            print(error.localizedDescription)
            return APIError.networkingError(error: error)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func handleCompletion(completion: Subscribers.Completion<APIError>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
