//
//  CryptocurrencyDetails.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


import Foundation

struct CryptocurrencyDetails: Decodable {
    let id: String
    let symbol: String
    let name: String
    let description: String
    let image: CoinImage
    let marketData: MarketData
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case description
        case image
        case marketData = "market_data"
        case lastUpdated = "last_updated"
    }

    enum DescriptionKeys: String, CodingKey {
        case en
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = try container.decode(String.self, forKey: .name)

        // Decode description
        let descriptionContainer = try container.nestedContainer(keyedBy: DescriptionKeys.self, forKey: .description)
        description = try descriptionContainer.decode(String.self, forKey: .en)

        image = try container.decode(CoinImage.self, forKey: .image)
        marketData = try container.decode(MarketData.self, forKey: .marketData)
        lastUpdated = try container.decode(String.self, forKey: .lastUpdated)
    }
}

struct CoinImage: Decodable {
    let thumb: String
    let small: String
    let large: String
}

struct MarketData: Decodable {
    let currentPrice: Price
    let marketCap: Price
    let priceChangePercentage24h: Double

    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
}

struct Price: Decodable {
    let usd: Double
}
