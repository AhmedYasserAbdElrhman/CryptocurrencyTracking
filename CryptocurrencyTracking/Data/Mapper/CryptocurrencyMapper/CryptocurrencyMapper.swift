//
//  CryptocurrencyMapper.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


import Foundation

final class CryptocurrencyMapper: CryptocurrencyMapperProtocol {
    func map(from dto: Cryptocurrency) -> CurrencyPresentedModel {
        return CurrencyPresentedModel(cryptocurrency: dto)
    }

    func map(from dtoList: [Cryptocurrency]) -> [CurrencyPresentedModel] {
        return dtoList.map { map(from: $0) }
    }
}
