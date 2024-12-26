//
//  ParameterEncoding.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation
protocol ParameterEncoding {
    func encode(_ urlRequest: inout URLRequest, with parameters: [String: Any]?) throws
}

enum EncodingError: Error {
    case missingParameters
    case encodingFailed
}
