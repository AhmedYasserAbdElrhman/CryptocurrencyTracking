//
//  CurrencyList.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI
struct CurrencyList: View {
    private var currencies: [CurrencyPresentedModel]
    init(currencies: [CurrencyPresentedModel]) {
        self.currencies = currencies
    }
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            ForEach(currencies) { crypto in
                CryptocurrencyRowItem(currency: crypto)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
    }
}
