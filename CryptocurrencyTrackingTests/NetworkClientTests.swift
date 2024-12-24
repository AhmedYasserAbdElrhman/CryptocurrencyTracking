//
//  NetworkClientTests.swift
//  CryptocurrencyTrackingTests
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import XCTest
@testable import CryptocurrencyTracking

final class URLSessionNetworkClientTests: XCTestCase {
    
    var networkClient: NetworkClientProtocol!
    var urlSession: URLSession!
    
    override func setUp() {
        super.setUp()
        
        // Configure URLSession with MockURLProtocol
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        
        // Initialize the network client with the mocked URLSession
        networkClient = NetworkClient(urlSession: urlSession)
    }
    
    override func tearDown() {
        networkClient = nil
        urlSession = nil
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }
    
    func testPerformRequest_SuccessfulResponse() async throws {
        // Given
        let expectedCryptos = [
            Cryptocurrency(id: "bitcoin", symbol: "BTC", name: "Bitcoin", image: "image", currentPrice: 50000.0),
            Cryptocurrency(id: "ethereum", symbol: "ETH", name: "Ethereum", image: "image", currentPrice: 4000.0)
        ]
        
        let jsonData = try JSONEncoder().encode(expectedCryptos)
        
        // Define the route to be tested
        let route = Router.fetchCryptocurrencies(vsCurrency: "usd")
        
        
        MockURLProtocol.requestHandler = { request in
            // Convert request URL to URLComponents to access queryItems
            guard let requestURL = request.url else {
                XCTFail("Invalid URL in request.")
                throw NetworkError.invalidURL
            }
            
            // Create a mock HTTP response with status code 200
            let response = HTTPURLResponse(url: requestURL,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, jsonData)
        }
        
        // When
        let result: [Cryptocurrency] = try await networkClient.performRequest(route)
        
        // Then
        XCTAssertEqual(result.count, expectedCryptos.count)
        XCTAssertEqual(result.first?.id, expectedCryptos.first?.id)
        XCTAssertEqual(result.first?.name, expectedCryptos.first?.name)
    }
}
