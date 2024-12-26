//
//  CurrencyListViewModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import Foundation
final class CurrencyListViewModel: ObservableObject {
    @Published var error: String = ""
    private let addFavoriteUseCase: AddFavoriteUseCaseProtocol
    private let deleteFavoriteUseCase: DeleteFavoriteUseCaseProtocol
    init(
        addFavoriteUseCase: AddFavoriteUseCaseProtocol,
        deleteFavoriteUseCase: DeleteFavoriteUseCaseProtocol
    ) {
        self.addFavoriteUseCase = addFavoriteUseCase
        self.deleteFavoriteUseCase = deleteFavoriteUseCase
    }
    
    func addToFavorite(_ currency: CurrencyPresentedModel) -> Bool {
        do {
            try addFavoriteUseCase.execute(currency: currency)
            return true
        } catch {
            setError(error)
            return false
        }
    }
    func deleteFavorite(_ currency: CurrencyPresentedModel) -> Bool {
        do {
            try deleteFavoriteUseCase.execute(id: currency.id)
            return true
        } catch {
            setError(error)
            return false
        }
    }
    // MARK: - Functions
    private func setError(_ error: Error) {
        self.error = error.localizedDescription
    }
}
