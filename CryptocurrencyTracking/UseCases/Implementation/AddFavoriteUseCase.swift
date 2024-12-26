//
//  AddFavoriteUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


final class AddFavoriteUseCase: AddFavoriteUseCaseProtocol {
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    func execute(currency: CurrencyPresentedModel) throws {
        try favoritesRepository.addFavorite(currency: currency)
    }
}
