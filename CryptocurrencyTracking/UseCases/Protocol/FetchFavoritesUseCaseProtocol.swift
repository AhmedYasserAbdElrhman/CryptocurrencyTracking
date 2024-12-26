//
//  FetchFavoritesUseCaseProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


protocol FetchFavoritesUseCaseProtocol {
    func execute() throws -> [FavoriteCurrency]
}
