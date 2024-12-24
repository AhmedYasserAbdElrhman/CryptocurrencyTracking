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

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
    }
}
