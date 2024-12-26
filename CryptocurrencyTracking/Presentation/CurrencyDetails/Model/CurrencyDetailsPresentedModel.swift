//
//  CurrencyDetailsPresentedModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//


import Foundation

struct CurrencyDetailsPresentedModel {
    let id: String
    let symbol: String
    let name: String
    let description: String
    let imageURL: String
    let currentPrice: String
    let priceChangePercentage: String
    let lastUpdated: String

    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter
    }()

    private static let percentageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    private static let dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    private static let displayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    init(from model: CryptocurrencyDetails) {
        self.id = model.id
        self.symbol = model.symbol.uppercased()
        self.name = model.name
        self.description = model.description.isEmpty ? "No description available." : model.description
        self.imageURL = model.image.large

        // Format current price
        if let formattedPrice = CurrencyDetailsPresentedModel.currencyFormatter.string(from: NSNumber(value: model.marketData.currentPrice.usd)) {
            self.currentPrice = formattedPrice
        } else {
            self.currentPrice = "N/A"
        }

        // Format price change percentage
        self.priceChangePercentage = CurrencyDetailsPresentedModel.percentageFormatter.string(from: NSNumber(value: model.marketData.priceChangePercentage24h / 100)) ?? "N/A"

        // Format last updated
        if let date = CurrencyDetailsPresentedModel.dateFormatter.date(from: model.lastUpdated) {
            self.lastUpdated = CurrencyDetailsPresentedModel.displayFormatter.string(from: date)
        } else {
            self.lastUpdated = "N/A"
        }
    }
}
