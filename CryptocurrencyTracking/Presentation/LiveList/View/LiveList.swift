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
                            destination: FavoritesView()
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
                        }, onError: { errorMessage in
                            viewModel.errorMessage = errorMessage
                            viewModel.hasError = true
                        }
                    )
                    .padding()
                    .shimmeringRedacted(active: viewModel.isLoading)
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .toast(isShowing: $viewModel.hasError,message: viewModel.errorMessage, type: .error)
            .navigationBarTitle("Live List", displayMode: .large)
        }
    }
}

#Preview {
    LiveList()
}
