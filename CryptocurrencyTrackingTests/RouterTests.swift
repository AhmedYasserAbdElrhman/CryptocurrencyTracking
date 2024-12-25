//
//  RouterTests.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//
import XCTest
@testable import CryptocurrencyTracking

final class RouterTests: XCTestCase {
    
    // Test Case: Verify URL Construction for fetchCryptocurrencies Route
    func testFetchCryptocurrencies_URLConstruction() throws {
        // Given
        let vsCurrency = "usd"
        let route = NetworkRouter.fetchCryptocurrencies(vsCurrency: vsCurrency)
        
        // When
        let request = try route.asURLRequest()
        let url = request.url!
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        // Then
        XCTAssertEqual(url.scheme, "https", "URL scheme mismatch.")
        XCTAssertEqual(url.host, "api.coingecko.com", "URL host mismatch.")
        XCTAssertEqual(url.path, "/api/v3/coins/markets", "URL path mismatch.")
        
        // Extract expected query items from the Router's parameters
        let expectedQueryItems = route.parameters?.compactMap { (key, value) -> URLQueryItem? in
            guard let valueString = value as? String else {
                XCTFail("Expected value for key '\(key)' to be a String, but got \(type(of: value))")
                return nil
            }
            return URLQueryItem(name: key, value: valueString)
        }
        
        XCTAssertEqual(urlComponents.queryItems, expectedQueryItems, "URL query items mismatch.")
    }
    
}
