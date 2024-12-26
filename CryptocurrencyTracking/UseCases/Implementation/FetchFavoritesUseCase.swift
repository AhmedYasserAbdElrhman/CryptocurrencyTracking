//
//  FetchFavoritesUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


final class FetchFavoritesUseCase: FetchFavoritesUseCaseProtocol {
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute() throws -> [CurrencyPresentedModel] {
        let favorites = try favoritesRepository.fetchFavorites()
        return favorites.map { .init(favorite: $0) }
    }
}
