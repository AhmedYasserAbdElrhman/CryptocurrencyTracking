//
//  DeleteFavoriteUseCase.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


final class DeleteFavoriteUseCase: DeleteFavoriteUseCaseProtocol {
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute(id: String) throws {
        try favoritesRepository.deleteFavorite(id: id)
    }
}
