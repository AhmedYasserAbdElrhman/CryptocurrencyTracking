//
//  AddFavoriteUseCaseProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


protocol AddFavoriteUseCaseProtocol {
    func execute(currency: CurrencyPresentedModel) throws
}
