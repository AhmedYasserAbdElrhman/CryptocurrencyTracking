//
//  LiveList.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI

struct LiveList: View {
    @State private var currencies: [CurrencyPresentedModel]
    @State private var searchText: String = ""
    init(currencies: [CurrencyPresentedModel]) {
        self.currencies = currencies
    }
    var body: some View {
        NavigationView {
                ScrollView {
                    VStack {
                        HStack {
                            SearchField(searchText: $searchText)
                            NavigationLink(
                                destination: FavoritesView(
                                    favorites: currencies)
                            ) {
                                Image(systemName: "heart.circle.fill")
                                    .foregroundColor(.red)
                                    .imageScale(.large)
                            }
                        }
                        .padding(.horizontal, 16)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        CurrencyList(currencies: currencies)
                            .padding()
                }
            }
            .navigationBarTitle("Live List", displayMode: .large)
        }
    }
}

#Preview {
    LiveList(currencies: CurrencyPresentedModel.generateDummyList(count: 10))
}
