# CryptoTracker

A simple, **SwiftUI**-based iOS application that uses the [CoinGecko](https://www.coingecko.com/) API to display real-time cryptocurrency data. Users can browse popular cryptocurrencies in a live list, view detailed information, and mark favorites. Favorites are persisted locally using **Core Data**.

## Table of Contents

- [Features](#features)
- [Setup](#setup)
- [Usage](#usage)
- [Screenshots](#screenshots)

## Features

1. **Live List**  
   Display real-time cryptocurrency prices and details fetched from CoinGecko.

2. **Details View**  
   Get more in-depth information for a selected cryptocurrency, including price changes over time.

3. **Favorites**  
   Mark cryptocurrencies as favorite, persist them using Core Data, and view your collection in a Favorites tab.

4. **SwiftUI UI Components**  
   All views and UI elements are built with SwiftUI, leveraging modern design patterns.

5. **Modular Architecture**  
   The app separates networking, data storage, and domain logic with a clean structure.

## Setup

1. **Clone the repository**  
   ```bash
   git clone https://github.com/AhmedYasserAbdElrhman/CryptocurrencyTracking.git
   cd CryptoTracker
2. **Open in Xcode**  
   - Double-click `CryptoTracker.xcodeproj` or open it from Xcode’s File menu.
3. **Optional: Configure a CoinGecko Account & API Key**  
   - You can use the CoinGecko API without registering, but you may be subject to lower rate limits.  
   - If you create a CoinGecko account and obtain an API key, set it in `NetworkConfig.apiKey` as shown below:

     ```swift
     struct NetworkConfig {
         static let apiKey: String = "<YOUR_COIN_GECKO_API_KEY>"
     }
     ```

   - The app will automatically include this key in the request header as `x-cg-demo-api-key`, which can help with rate limiting.

## Screenshots

### Live List View
<img src="https://res.cloudinary.com/dpa6yfqps/image/upload/v1735223703/lkvb3xoxeytyriyaxzkb.png" alt="Live List View" width="400"/>

### Details View
<img src="https://res.cloudinary.com/dpa6yfqps/image/upload/v1735223703/w6gqvcifbycuvdoei698.png" alt="Details View" width="400"/>

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
