//
//  CurrencyDetailsView.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 26/12/2024.
//

import SwiftUI

struct CurrencyDetailsView: View {
    @StateObject private var viewModel: CurrencyDetailsViewModel
    init(id: String,
         factory: ViewModelFactory = DefaultViewModelFactory()
    ) {
        _viewModel = StateObject(wrappedValue: factory.makeDetailViewModel(with: id))
    }
    var body: some View {
        VStack {
            if let model = viewModel.currencyDetails {
                ScrollView {
                    VStack(alignment: .center, spacing: 20) {
                        AsyncImage(url: URL(string: model.imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .shadow(radius: 10)
                        } placeholder: {
                            ProgressView()
                        }

                        Text("\(model.name) (\(model.symbol))")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)

                        Text(model.currentPrice)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)

                        // Price Change Percentage
                        Text(model.priceChangePercentage)
                            .font(.headline)
                            .foregroundColor(model.priceChangePercentage.hasPrefix("-") ? .red : .green)

                        // Description
                        Text(model.description)
                            .font(.body)
                            .padding()

                        // Last Updated
                        Text("Last updated: \(model.lastUpdated)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                }
            } else if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                Text("Failed to load coin details. Please try again.")
                    .foregroundColor(.red)
            }
        }
        .toast(isShowing: $viewModel.hasError,message: viewModel.errorMessage, type: .error)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CurrencyDetailsView(id: "btc")
}
