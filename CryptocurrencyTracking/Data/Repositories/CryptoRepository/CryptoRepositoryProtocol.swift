//
//  CryptoRepositoryProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


protocol CryptoRepositoryProtocol {
    func fetchCryptocurrencies(vsCurrency: String) async throws -> [Cryptocurrency]
    func getDetails(id: String) async throws -> CryptocurrencyDetails
}
