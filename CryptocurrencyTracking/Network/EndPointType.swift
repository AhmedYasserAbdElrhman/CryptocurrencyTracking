//
//  EndPointType.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
