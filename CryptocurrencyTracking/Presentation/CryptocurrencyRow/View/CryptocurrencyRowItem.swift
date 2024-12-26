//
//  CryptocurrencyRowItem.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI

struct CryptocurrencyRowItem: View {
    let currency: CurrencyPresentedModel
    var onFavorite: ((Bool) -> Void)?
    var body: some View {
        HStack {
            AsyncImage(url: currency.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                default:
                    EmptyView()
                }
            }
            .frame(width: 50, height: 50)
            Text(currency.name)
                .font(.headline)
            Spacer()
            Text(currency.formattedPrice)
                .font(.subheadline)
                .foregroundStyle(.green)
            FavoriteButton(isFavorited: Binding(get: {
                currency.isFavorite
            }, set: { newValue in
                onFavorite?(newValue)
            }))
        }
    }
}

#Preview {
    CryptocurrencyRowItem(currency: .dummy())
}
