//
//  URLParameterEncoder.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//
import Foundation

struct URLParameterEncoder: ParameterEncoding {
    func encode(_ urlRequest: inout URLRequest, with parameters: [String : Any]?) throws {
        guard let parameters = parameters else { return }
        
        guard let url = urlRequest.url else {
            throw EncodingError.missingParameters
        }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            let queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            urlComponents.queryItems = queryItems
            urlRequest.url = urlComponents.url
        }
    }
}
