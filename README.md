# CryptoTracker

A simple, **SwiftUI**-based iOS application that uses the [CoinGecko](https://www.coingecko.com/) API to display real-time cryptocurrency data. Users can browse popular cryptocurrencies in a live list, view detailed information, and mark favorites. Favorites are persisted locally using **Core Data**.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Factory Pattern](#factory-pattern)
- [Setup](#setup)
- [Screenshots](#screenshots)

## Features

1. **Live Cryptocurrency List**  
   - View real-time cryptocurrency prices and market trends fetched from the CoinGecko API.

2. **Detailed Cryptocurrency View**  
   - Access detailed information about individual cryptocurrencies, including historical price changes.

3. **Favorites Management**  
   - Mark cryptocurrencies as favorites, with data persistently stored using **Core Data**.

4. **Modern SwiftUI UI**  
   - Designed with SwiftUI for responsive, declarative, and elegant user interfaces.

5. **Clean Modular Architecture**  
   - Separation of concerns with View, ViewModel, Use Case, Repository, and Network layers.

## Architecture

The app follows a clean architecture pattern for scalability and maintainability:

### Flow:
- **View → ViewModel → Use Case → Repository → Network/Database**

1. **View**:  
   - Built using **SwiftUI**, the views display data provided by the ViewModels.
   
2. **ViewModel**:  
   - Handles business logic and interacts with Use Cases. Observed by the View to update the UI reactively.

3. **Use Case**:  
   - Encapsulates application-specific logic. Fetches data from repositories and processes it for the ViewModel.

4. **Repository**:  
   - Mediates between the data layer (Network/Database) and the Use Case layer. Ensures data consistency regardless of the source.

5. **Network/Database**:  
   - **NetworkClient** handles API requests and responses.  
   - **Core Data** is used for persistent storage of user favorites.

---
## Factory Pattern

The app leverages the **Factory Pattern** to create ViewModels efficiently and decouple dependencies.

### Factory Protocol:
```swift
protocol ViewModelFactory {
    func makeLiveListViewModel() -> LiveListViewModel
    func makeCurrencyListViewModel() -> CurrencyListViewModel
    func makeDetailViewModel(with id: String) -> CurrencyDetailsViewModel
    func makeFavoritesViewModel() -> FavoritesViewModel
}
```
### Default Implementation:
```swift
struct DefaultViewModelFactory: ViewModelFactory {
    func makeLiveListViewModel() -> LiveListViewModel {
        let networkClient: NetworkClientProtocol = NetworkClient()
        let repository: CryptoRepositoryProtocol = CryptoRepository(networkClient: networkClient)
        let favoritesStorage: FavoritesRepositoryProtocol = FavoritesStorage()
        let isFavoriteUseCase: IsFavoriteUseCaseProtocol = IsFavoriteUseCase(favoritesRepository: favoritesStorage)
        let useCase: FetchCryptocurrenciesUseCaseProtocol = FetchCryptocurrenciesUseCase(repository: repository, isFavoriteUseCase: isFavoriteUseCase)
        return LiveListViewModel(useCase: useCase)
    }
    // Additional factory methods for other ViewModels...
}
```
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
