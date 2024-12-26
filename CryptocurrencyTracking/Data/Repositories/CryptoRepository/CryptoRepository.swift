//
//  CryptoRepository.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
final class CryptoRepository {
    private let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
}
// MARK: - CryptoRepositoryProtocol
extension CryptoRepository: CryptoRepositoryProtocol {
    func fetchCryptocurrencies(vsCurrency: String) async throws -> [Cryptocurrency] {
        let route = NetworkRouter.fetchCryptocurrencies(vsCurrency: vsCurrency)
        return try await networkClient.performRequest(route)
    }
    func getDetails(id: String) async throws -> CryptocurrencyDetails {
        let route = NetworkRouter.getDetails(id: id)
        return try await networkClient.performRequest(route)
    }
}
