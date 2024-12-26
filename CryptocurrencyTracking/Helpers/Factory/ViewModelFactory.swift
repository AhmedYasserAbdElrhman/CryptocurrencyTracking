//
//  ViewModelFactory.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//


protocol ViewModelFactory {
    func makeLiveListViewModel() -> LiveListViewModel
}

struct DefaultViewModelFactory: ViewModelFactory {
    func makeLiveListViewModel() -> LiveListViewModel {
        let networkClient: NetworkClientProtocol = NetworkClient()
        let repository: CryptoRepositoryProtocol = CryptoRepository(networkClient: networkClient)
        let favoritesStorage: FavoritesRepositoryProtocol = FavoritesStorage()
        let isFavoriteUseCase: IsFavoriteUseCaseProtocol = IsFavoriteUseCase(favoritesRepository: favoritesStorage)
        let addFavoriteUseCase: AddFavoriteUseCaseProtocol = AddFavoriteUseCase(favoritesRepository: favoritesStorage)
        let deleteFavoriteUseCase: DeleteFavoriteUseCaseProtocol = DeleteFavoriteUseCase(favoritesRepository: favoritesStorage)
        let useCase: FetchCryptocurrenciesUseCaseProtocol = CryptocurrenciesUseCase(repository: repository, isFavoriteUseCase: isFavoriteUseCase)
        let viewModel: LiveListViewModel = LiveListViewModel(useCase: useCase, addFavoriteUseCase: addFavoriteUseCase, deleteFavoriteUseCase: deleteFavoriteUseCase)
        return viewModel
    }
    
}
