//
//  ToastType.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import SwiftUI
enum ToastType {
    case success
    case error
    case info
    
    var iconName: String {
        switch self {
        case .success:
            return "checkmark.circle.fill"
        case .error:
            return "xmark.octagon.fill"
        case .info:
            return "info.circle.fill"
        }
    }
    
    var gradient: LinearGradient {
        switch self {
        case .success:
            return LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]), startPoint: .leading, endPoint: .trailing)
        case .error:
            return LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8), Color.red]), startPoint: .leading, endPoint: .trailing)
        case .info:
            return LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue]), startPoint: .leading, endPoint: .trailing)
        }
    }
    
    var accentColor: Color {
        switch self {
        case .success:
            return Color.white
        case .error:
            return Color.white
        case .info:
            return Color.white
        }
    }
}
