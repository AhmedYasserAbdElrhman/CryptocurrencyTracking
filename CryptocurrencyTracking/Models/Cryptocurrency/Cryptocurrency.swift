//
//  Cryptocurrency.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//


import Foundation

// MARK: - Cryptocurrency
struct Cryptocurrency: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let priceChangePercentage: Double?
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChangePercentage = "price_change_percentage_24h"
    }
}
extension Cryptocurrency {
    static func dummy() -> Self {
        Cryptocurrency(
            id: UUID().uuidString,
            symbol: "btc",
            name: "Bitcoin",
            image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            currentPrice: 7000,
            priceChangePercentage: 1.5
        )
    }
}
