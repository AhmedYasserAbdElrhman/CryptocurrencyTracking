//
//  FavoriteButton.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import SwiftUI
struct FavoriteButton: View {
    @Binding private var isFavorited: Bool
    init(isFavorited: Binding<Bool>) {
        _isFavorited = isFavorited
    }
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                isFavorited.toggle()
            }
        }) {
            Image(systemName: isFavorited ? "heart.fill" : "heart")
                .foregroundColor(isFavorited ? .red : .gray)
                .scaleEffect(isFavorited ? 1.2 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: isFavorited)
                .font(.system(size: 24))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
