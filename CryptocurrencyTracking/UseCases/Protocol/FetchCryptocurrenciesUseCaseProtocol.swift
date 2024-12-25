//
//  FetchCryptocurrenciesUseCaseProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
protocol FetchCryptocurrenciesUseCaseProtocol {
    func execute() async throws -> [CurrencyPresentedModel]
}
