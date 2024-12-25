//
//  Toast.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import SwiftUI
struct Toast: View {
    let message: String
    let type: ToastType
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.iconName)
                .foregroundColor(type.accentColor)
                .imageScale(.large)
            Text(message)
                .foregroundColor(type.accentColor)
                .multilineTextAlignment(.center)
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .background(type.gradient)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    Toast(message: "Hello World", type: .error)
}
