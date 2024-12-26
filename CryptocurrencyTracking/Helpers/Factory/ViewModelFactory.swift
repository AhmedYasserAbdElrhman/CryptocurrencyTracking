//
//  ViewModelFactory.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


protocol ViewModelFactory {
    func makeLiveListViewModel() -> LiveListViewModel
    func makeCurrencyListViewModel() -> CurrencyListViewModel
    func makeDetailViewModel(with id: String) -> CurrencyDetailsViewModel
    func makeFavoritesViewModel() -> FavoritesViewModel
}

struct DefaultViewModelFactory: ViewModelFactory {
    func makeLiveListViewModel() -> LiveListViewModel {
        let networkClient: NetworkClientProtocol = NetworkClient()
        let repository: CryptoRepositoryProtocol = CryptoRepository(networkClient: networkClient)
        let favoritesStorage: FavoritesRepositoryProtocol = FavoritesStorage()
        let isFavoriteUseCase: IsFavoriteUseCaseProtocol = IsFavoriteUseCase(favoritesRepository: favoritesStorage)
        let useCase: FetchCryptocurrenciesUseCaseProtocol = FetchCryptocurrenciesUseCase(repository: repository, isFavoriteUseCase: isFavoriteUseCase)
        let viewModel: LiveListViewModel = LiveListViewModel(useCase: useCase)
        return viewModel
    }
    func makeCurrencyListViewModel() -> CurrencyListViewModel {
        let favoritesStorage: FavoritesRepositoryProtocol = FavoritesStorage()
        let addFavoriteUseCase: AddFavoriteUseCaseProtocol = AddFavoriteUseCase(favoritesRepository: favoritesStorage)
        let deleteFavoriteUseCase: DeleteFavoriteUseCaseProtocol = DeleteFavoriteUseCase(favoritesRepository: favoritesStorage)
        let viewModel: CurrencyListViewModel = CurrencyListViewModel(addFavoriteUseCase: addFavoriteUseCase, deleteFavoriteUseCase: deleteFavoriteUseCase)
        return viewModel
    }
    func makeDetailViewModel(with id: String) -> CurrencyDetailsViewModel {
        let networkClient: NetworkClientProtocol = NetworkClient()
        let repository: CryptoRepositoryProtocol = CryptoRepository(networkClient: networkClient)
        let useCase: GetCurrencyDetailsUseCaseProtocol = GetCurrencyDetailsUseCase(repository: repository)
        let viewModel: CurrencyDetailsViewModel = CurrencyDetailsViewModel(id: id, useCase: useCase)
        return viewModel
    }

    func makeFavoritesViewModel() -> FavoritesViewModel {
        let repository: FavoritesRepositoryProtocol = FavoritesStorage()
        let useCase: FetchFavoritesUseCaseProtocol = FetchFavoritesUseCase(favoritesRepository: repository)
        let viewModel: FavoritesViewModel = FavoritesViewModel(useCase: useCase)
        return viewModel
    }
}
