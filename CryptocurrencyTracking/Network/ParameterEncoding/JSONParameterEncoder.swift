//
//  JSONParameterEncoder.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation
struct JSONParameterEncoder: ParameterEncoding {
    func encode(_ urlRequest: inout URLRequest, with parameters: [String : Any]?) throws {
        guard let parameters = parameters else { return }
        
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw EncodingError.encodingFailed
        }
    }
}
