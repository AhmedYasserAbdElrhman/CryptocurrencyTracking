//
//  CryptocurrenciesUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
final class CryptocurrenciesUseCase {
    let repository: CryptoRepositoryProtocol
    let isFavoriteUseCase: IsFavoriteUseCaseProtocol
    init(repository: CryptoRepositoryProtocol, isFavoriteUseCase: IsFavoriteUseCaseProtocol) {
        self.repository = repository
        self.isFavoriteUseCase = isFavoriteUseCase
    }
}
