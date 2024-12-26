//
//  LiveList.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI

struct LiveList: View {
    @StateObject private var viewModel: LiveListViewModel
    init(viewModel: LiveListViewModel = DefaultViewModelFactory().makeLiveListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        SearchField(searchText: $viewModel.searchText)
                        NavigationLink(
                            destination: FavoritesView(
                                favorites: viewModel.currencies)
                        ) {
                            Image(systemName: "heart.circle.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 16)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    CurrencyList(
                        currencies: viewModel.currentCurrencies,
                        addToFavorite: { currency in
                            viewModel.addToFavorite(currency)
                        },
                        removeFromFavorite: { currency in
                            viewModel.deleteFavorite(currency)
                        }
                    )
                    .padding()
                    .shimmeringRedacted(active: viewModel.isLoading)
                }
            }
            .onFirstAppear {
                viewModel.viewDidLoad()
            }
            .toast(isShowing: $viewModel.hasError,message: viewModel.errorMessage, type: .error)
            .navigationBarTitle("Live List", displayMode: .large)
        }
    }
}

#Preview {
    LiveList()
}
