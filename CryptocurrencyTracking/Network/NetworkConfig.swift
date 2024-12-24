//
//  NetworkConfig.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation
struct NetworkConfig {
    static let baseURL: URL = {
        guard let url = URL(string: "https://api.coingecko.com/api/v3") else {
            fatalError("Invalid Base URL")
        }
        return url
    }()
    
    // Not secure should be replaced with secured technique
    static let apiKey: String = {
        return "YOUR_API_KEY_HERE"
    }()
    
}
