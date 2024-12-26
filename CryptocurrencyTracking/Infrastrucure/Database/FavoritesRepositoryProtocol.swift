//
//  FavoritesRepositoryProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


protocol FavoritesRepositoryProtocol {
    func isFavorite(id: String) -> Bool
    func addFavorite(currency: CurrencyPresentedModel) throws
    func deleteFavorite(id: String) throws
    func fetchFavorites() throws -> [FavoriteCurrency]
}
