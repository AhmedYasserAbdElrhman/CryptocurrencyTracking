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
    private var onError: ((String) -> Void)?
    @StateObject private var currencyListViewModel: CurrencyListViewModel
    init(
        currencies: [CurrencyPresentedModel],
        addToFavorite: ((CurrencyPresentedModel) -> Void)? = nil,
        removeFromFavorite: ((CurrencyPresentedModel) -> Void)? = nil,
        onError: ((String) -> Void)? = nil,
        currencyListViewModel: CurrencyListViewModel = DefaultViewModelFactory().makeCurrencyListViewModel()
    ) {
        self.currencies = currencies
        self.addToFavorite = addToFavorite
        self.removeFromFavorite = removeFromFavorite
        self.onError = onError
        _currencyListViewModel = StateObject(wrappedValue: currencyListViewModel)
    }
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            ForEach(currencies) { crypto in
                NavigationLink {
                    CurrencyDetailsView(id: crypto.id)
                } label: {
                    CryptocurrencyRowItem(currency: crypto) { newValue in
                        if newValue {
                            if currencyListViewModel.addToFavorite(crypto) {
                                if let addToFavorite {
                                    addToFavorite(crypto)
                                }
                            }
                        } else {
                            if currencyListViewModel.deleteFavorite(crypto) {
                                if let removeFromFavorite {
                                    removeFromFavorite(crypto)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .onChange(of: currencyListViewModel.error) { newValue in
                        onError?(newValue)
                    }
                }
            }
        }
    }
}
