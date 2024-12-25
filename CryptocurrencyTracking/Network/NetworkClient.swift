//
//  NetowrkClient.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 24/12/2024.
//

import Foundation

class NetworkClient: NetworkClientProtocol {
    private let urlSession: URLSession
    private let decoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.decoder = decoder
    }
    
    func performRequest<T: Decodable>(_ request: URLRequestConvertible) async throws -> T {
        do {
            let request = try request.asURLRequest()
            let (data, response) = try await urlSession.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    let decodedData = try decoder.decode(T.self, from: data)
                    return decodedData
                } catch {
                    throw NetworkError.decodingError(error)
                }
            case 429:
                throw NetworkError.rateLimitExceeded
            case 400...499:
                throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            case 500...599:
                throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            default:
                throw NetworkError.unknown
            }
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
