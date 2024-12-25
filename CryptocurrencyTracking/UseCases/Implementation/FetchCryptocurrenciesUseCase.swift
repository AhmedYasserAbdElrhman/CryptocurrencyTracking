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
        return mapper.map(from: dtos)
    }
}
