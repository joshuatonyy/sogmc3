//
//  HTTPClient.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, RequestError> {
        guard let request = URLRequest(from: endpoint) else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let decodedResponse = try? decoder.decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unknown)
            }
            
        } catch {
            if let error = error as? RequestError {
                return .failure(error)
            } else {
                return .failure(.unknown)
            }
        }
    }
 
}
