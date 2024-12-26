//
//  CurrencyDetailsViewModel.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import Foundation

final class CurrencyDetailsViewModel: ObservableObject {
    // MARK: - Published
    @Published var currencyDetails: CurrencyDetailsPresentedModel?
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    private let id: String
    private let useCase: GetCurrencyDetailsUseCaseProtocol
    init(id: String, useCase: GetCurrencyDetailsUseCaseProtocol) {
        self.id = id
        self.useCase = useCase
    }
    func onAppear() {
        Task {
            do {
                await toggleLoading(true)
                let result = try await useCase.execute(id: id)
                await toggleLoading(false)
                await setCurrencyDetails(result)
            } catch {
                await toggleLoading(false)
                await setError(error)
            }
        }
    }
    
    // MARK: - Functions
    @MainActor
    private func toggleLoading(_ bool: Bool) {
        isLoading = bool
    }
    @MainActor
    private func setCurrencyDetails(_ currencyDetails: CurrencyDetailsPresentedModel) {
        self.currencyDetails = currencyDetails
    }
    @MainActor
    private func setError(_ error: Error) {
        hasError = true
        errorMessage = error.localizedDescription
    }
}
