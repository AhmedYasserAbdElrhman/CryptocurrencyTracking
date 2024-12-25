//
//  CurrencyPresentedModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation
struct CurrencyPresentedModel: Identifiable, Equatable {
    let id: String
    let symbol: String
    let name: String
    let imageURL: URL?
    let formattedPrice: String
    let priceChange: String?
    init(cryptocurrency: Cryptocurrency) {
        self.id = cryptocurrency.id
        self.symbol = cryptocurrency.symbol.uppercased()
        self.name = cryptocurrency.name
        self.imageURL = URL(string: cryptocurrency.image)
        self.formattedPrice = String(format: "$%.2f", cryptocurrency.currentPrice)
        self.priceChange = cryptocurrency.priceChangePercentage?.formatted(.percent)
    }
}
extension CurrencyPresentedModel {
    static func dummy() -> Self {
        CurrencyPresentedModel(
            cryptocurrency: .dummy()
        )
    }
    static func generateDummyList(count: Int) -> [Self] {
        (1...count).map { _ in
            return .dummy()
        }
    }

}
