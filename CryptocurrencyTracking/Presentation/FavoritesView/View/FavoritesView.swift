//
//  FavoritesView.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI
struct FavoritesView: View {
    @StateObject var favoritesViewModel: FavoritesViewModel
    init(favoritesViewModel: FavoritesViewModel = DefaultViewModelFactory().makeFavoritesViewModel()) {
        _favoritesViewModel = StateObject(wrappedValue: favoritesViewModel)
    }
    var body: some View {
        VStack {
            if favoritesViewModel.favorites.isEmpty {
                Text("No favorites yet")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    CurrencyList(
                        currencies: favoritesViewModel.favorites,
                        removeFromFavorite: { currency in
                            favoritesViewModel.deleteFavorite(currency)
                        }, onError: { errorMessage in
                            favoritesViewModel.errorMessage = errorMessage
                            favoritesViewModel.hasError = true
                        }
                    )
                    .padding()
                }
            }
        }
        .toast(isShowing: $favoritesViewModel.hasError, message: favoritesViewModel.errorMessage)
        .onAppear {
            favoritesViewModel.onAppear()
        }
        .navigationBarTitle("Favorites", displayMode: .inline)
    }
}
