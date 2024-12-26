//
//  LiveListViewModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import Foundation
import Combine
final class LiveListViewModel: ObservableObject {
    // MARK: - Published
    @Published private(set) var currencies: [CurrencyPresentedModel] = CurrencyPresentedModel.generateDummyList(count: 4)
    @Published private(set) var searchCurrencies: [CurrencyPresentedModel] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    var currentCurrencies: [CurrencyPresentedModel] {
        if searchText.isEmpty {
            currencies
        } else {
            searchCurrencies
        }
    }
    // MARK: - Variables
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: FetchCryptocurrenciesUseCaseProtocol
    init(
        useCase: FetchCryptocurrenciesUseCaseProtocol
    ) {
        self.useCase = useCase
        bindSearchText()
        startAutoRefresh()
    }
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    func fetchCurrencies(showLoading: Bool = false) async {
        do {
            if showLoading {
                await toggleLoading(true)
            }
            let currencies = try await useCase.execute()
            if showLoading {
                await toggleLoading(false)
            }
            await setCurrencies(currencies)
        } catch {
            if showLoading {
                await toggleLoading(false)
                await setCurrencies([])
            }
            await setError(error)
        }
    }
    func onAppear() {
        Task {
            await fetchCurrencies(showLoading: true)
        }
    }

    func refreshData() {
        Task {
            await fetchCurrencies()
        }
    }
    func addToFavorite(_ currency: CurrencyPresentedModel) {
        Task {
            await updateFavorite(for: currency.id, isFavorite: true)
        }
    }
    func deleteFavorite(_ currency: CurrencyPresentedModel) {
        Task {
            await updateFavorite(for: currency.id, isFavorite: false)
        }
    }
    // MARK: - Functions
    private func bindSearchText() {
        Publishers.CombineLatest($searchText, $currencies)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates { (previous, current) in
                previous.0 == current.0 && previous.1 == current.1
            }
            .map { (searchText, list) -> [CurrencyPresentedModel] in
                guard !searchText.isEmpty else { return list }
                return list.filter { item in
                    item.name.lowercased().contains(searchText.lowercased()) ||
                    item.symbol.lowercased().contains(searchText.lowercased())
                }
            }
            .receive(on: RunLoop.main)
            .sink { [weak self] filteredList in
                guard let self else { return }
                self.searchCurrencies = filteredList
            }
            .store(in: &cancellables)
    }
    private func startAutoRefresh() {
        Timer
            .publish(every: 30, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.refreshData()
            }
            .store(in: &cancellables)
    }
    @MainActor
    private func updateFavorite(for id: String, isFavorite: Bool) {
        // Update the source of truth directly
        if let index = currencies.firstIndex(where: { $0.id == id }) {
            currencies[index].isFavorite = isFavorite
        }
    }
    @MainActor
    private func toggleLoading(_ bool: Bool) {
        isLoading = bool
    }
    @MainActor
    private func setCurrencies(_ currencies: [CurrencyPresentedModel]) {
        self.currencies = currencies
    }
    @MainActor
    private func setError(_ error: Error) {
        hasError = true
        errorMessage = error.localizedDescription
    }
}
