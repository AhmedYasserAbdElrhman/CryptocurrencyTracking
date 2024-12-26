//
//  FetchCryptocurrenciesUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
// MARK: - FetchCryptocurrenciesUseCaseProtocol
extension CryptocurrenciesUseCase: FetchCryptocurrenciesUseCaseProtocol {
    func execute() async throws -> [CurrencyPresentedModel] {
        let dtos = try await repository.fetchCryptocurrencies(vsCurrency: "usd")
        return dtos.map { currency in
            let isFavorite = isFavoriteUseCase.isFavorite(for: currency.id)
            return CurrencyPresentedModel(cryptocurrency: currency, isFavorite: isFavorite)
        }
    }
}
