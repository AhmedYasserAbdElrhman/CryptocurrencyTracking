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
    func viewDidLoad() {
        Task {
            do {
                await toggleLoading(true)
                let currencies = try await fetchCryptocurrencyUseCase.execute()
                await toggleLoading(false)
                await setCurrencies(currencies)
            } catch {
                await toggleLoading(false)
                await setCurrencies([])
                await setError(error)
            }
        }
    }
    @MainActor
    func toggleLoading(_ bool: Bool) {
        isLoading = bool
    }
    @MainActor
    func setCurrencies(_ currencies: [CurrencyPresentedModel]) {
        self.currencies = currencies
    }
    @MainActor
    func setError(_ error: Error) {
        hasError = true
        errorMessage = error.localizedDescription
    }
}
