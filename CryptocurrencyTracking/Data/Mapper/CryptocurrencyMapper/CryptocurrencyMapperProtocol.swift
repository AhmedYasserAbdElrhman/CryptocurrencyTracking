//
//  CryptocurrencyMapperProtocol.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


protocol CryptocurrencyMapperProtocol {
    func map(from dtoList: [Cryptocurrency]) -> [CurrencyPresentedModel]
}
