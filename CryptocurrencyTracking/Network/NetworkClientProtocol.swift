//
//  NetworkClientProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation

protocol NetworkClientProtocol {
    func performRequest<T: Decodable>(_ route: Router) async throws -> T
}
