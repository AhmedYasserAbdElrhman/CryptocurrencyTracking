//
//  FavoritesViewModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import Foundation
final class FavoritesViewModel: ObservableObject {
    // MARK: - Published
    @Published var favorites: [CurrencyPresentedModel] = []
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    private let useCase: FetchFavoritesUseCaseProtocol
    init(useCase: FetchFavoritesUseCaseProtocol) {
        self.useCase = useCase
    }
    func onAppear() {
        Task {
            do {
               let favorites = try useCase.execute()
                await setFavorites(favorites)
            } catch {
                await setError(error)
            }
        }
    }
    func deleteFavorite(_ currency: CurrencyPresentedModel) {
        Task {
            await removeFavoriteFromArray(currency)
        }
    }
    // MARK: - Functions
    @MainActor
    private func setFavorites(_ currencies: [CurrencyPresentedModel]) {
        self.favorites = currencies
    }
    @MainActor
    private func removeFavoriteFromArray(_ currency: CurrencyPresentedModel) {
        favorites.removeAll(where: { currency.id == $0.id })
    }
    @MainActor
    private func setError(_ error: Error) {
        hasError = true
        errorMessage = error.localizedDescription
    }

}
