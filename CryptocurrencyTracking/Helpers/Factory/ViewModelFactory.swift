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
        let networkClient = NetworkClient()
        let repository = CryptoRepository(networkClient: networkClient)
        let mapper = CryptocurrencyMapper()
        let useCase = CryptocurrenciesUseCase(repository: repository, mapper: mapper)
        let viewModel = LiveListViewModel(useCase: useCase)
        return viewModel
    }
    
}
