//
//  SearchField.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI
struct SearchField: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .foregroundColor(.primary)
                .font(.system(size: 16, weight: .regular))
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemGray6))
        )
    }
}
