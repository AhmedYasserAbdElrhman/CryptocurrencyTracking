//
//  FavoritesView.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI
struct FavoritesView: View {
    let favorites: [CurrencyPresentedModel]

    var body: some View {
        VStack {
            if favorites.isEmpty {
                Text("No favorites yet")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    CurrencyList(currencies: favorites)
                        .padding()
                }
            }
        }
        .navigationBarTitle("Favorites", displayMode: .inline)
    }
}
