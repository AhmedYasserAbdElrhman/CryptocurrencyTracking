//
//  CryptocurrenciesUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
final class CryptocurrenciesUseCase {
    let repository: CryptoRepositoryProtocol
    let mapper: CryptocurrencyMapperProtocol

    init(repository: CryptoRepositoryProtocol, mapper: CryptocurrencyMapperProtocol) {
        self.repository = repository
        self.mapper = mapper
    }
}
