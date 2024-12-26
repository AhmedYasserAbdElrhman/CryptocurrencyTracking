//
//  GetCurrencyDetailsUseCaseProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import Foundation
protocol GetCurrencyDetailsUseCaseProtocol {
    func execute(id: String) async throws -> CurrencyDetailsPresentedModel
}
