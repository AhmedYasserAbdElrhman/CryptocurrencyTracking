//
//  IsFavoriteUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


final class IsFavoriteUseCase: IsFavoriteUseCaseProtocol {
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    
    func isFavorite(for id: String) -> Bool {
        return favoritesRepository.isFavorite(id: id)
    }
}
