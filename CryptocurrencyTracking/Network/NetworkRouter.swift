//
//  NetworkRouter.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

enum Router: URLRequestConvertible {
    case fetchCryptocurrencies(vsCurrency: String)
    
     var baseURL: URL {
        return NetworkConfig.baseURL
    }
    
     var path: String {
        switch self {
        case .fetchCryptocurrencies:
            return "/coins/markets"
        }
    }
    
     var method: HTTPMethod {
        switch self {
        case .fetchCryptocurrencies:
            return .GET
        }
    }
    
     var headers: [String: String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "x-cg-demo-api-key": NetworkConfig.apiKey
            ]
        }
    }

     var parameters: [String: Any]? {
        switch self {
        case .fetchCryptocurrencies(let vsCurrency):
            return [
                "vs_currency": vsCurrency,
                "order": "market_cap_desc",
            ]
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let encoder: ParameterEncoding
        switch method {
        case .GET:
            encoder = URLParameterEncoder()
        case .POST:
            encoder = JSONParameterEncoder()
        }
        
        try encoder.encode(&request, with: parameters)
        
        return request
    }
}
