//
//  LiveListViewModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
final class LiveListViewModel: ObservableObject {
    // MARK: - Published
    @Published var currencies: [CurrencyPresentedModel] = CurrencyPresentedModel.generateDummyList(count: 4)
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    private let fetchCryptocurrencyUseCase: FetchCryptocurrenciesUseCaseProtocol
    init(fetchCryptocurrencyUseCase: FetchCryptocurrenciesUseCaseProtocol) {
        self.fetchCryptocurrencyUseCase = fetchCryptocurrencyUseCase
    }
}
