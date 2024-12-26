//
//  CurrencyList.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI
struct CurrencyList: View {
    private var currencies: [CurrencyPresentedModel]
    private var addToFavorite: ((CurrencyPresentedModel) -> Void)?
    private var removeFromFavorite: ((CurrencyPresentedModel) -> Void)?
    init(
        currencies: [CurrencyPresentedModel],
        addToFavorite: ((CurrencyPresentedModel) -> Void)? = nil,
        removeFromFavorite: ((CurrencyPresentedModel) -> Void)? = nil
    ) {
        self.currencies = currencies
        self.addToFavorite = addToFavorite
        self.removeFromFavorite = removeFromFavorite
    }
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            ForEach(currencies) { crypto in
                CryptocurrencyRowItem(currency: crypto) { newValue in
                    if newValue {
                        if let addToFavorite {
                            addToFavorite(crypto)
                        }
                    } else {
                        if let removeFromFavorite {
                            removeFromFavorite(crypto)
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
    }
}
