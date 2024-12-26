//
//  GetCurrencyDetailsUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import Foundation
final class GetCurrencyDetailsUseCase {
    private let repository: CryptoRepositoryProtocol
    init(repository: CryptoRepositoryProtocol) {
        self.repository = repository
    }
}
// MARK: - GetCurrencyDetailsUseCaseProtocol
extension GetCurrencyDetailsUseCase: GetCurrencyDetailsUseCaseProtocol {
    func execute(id: String) async throws -> CurrencyDetailsPresentedModel {
        let model = try await repository.getDetails(id: id)
        return CurrencyDetailsPresentedModel(from: model)
    }
}
