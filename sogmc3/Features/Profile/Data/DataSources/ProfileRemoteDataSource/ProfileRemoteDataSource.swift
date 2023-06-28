//
//  ProfileRemoteDataSource.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

// TODO: refactor
struct UserAccessTokenResponse: Codable {
    let bankId: String
    let accessToken: String
}

// TODO: refactor
struct GetAllUserTokenResponse: Codable {
    let accessTokens: [UserAccessTokenResponse]
}

struct ProfileRemoteDataSource: ProfileRemoteDataSourceProtocol, HTTPClient {
    
    func getPublicAccessToken() async -> Result<AuthResponse, RequestError> {
        await sendRequest(
            endpoint: ProfileEndpoint.publicAuth,
            responseModel: AuthResponse.self
        )
    }
    
    func getUserAuthTokens(for userID: String) async -> Result<AccessTokenResponse, RequestError> {
        await sendRequest(
            endpoint: ProfileEndpoint.userAccessToken(userID: userID),
            responseModel: AccessTokenResponse.self
        )
    }
    
    func getAllUserTokens(for userID: String) async -> Result<[UserAccessTokenResponse], RequestError> {
        let urlString = "https://sogserver-production.up.railway.app/user-access-token/\(userID)"
        guard let url = URL(string: urlString) else { return .failure(.invalidURL) }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch response.statusCode {
            case 200:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let decodedResponse = try? decoder.decode(GetAllUserTokenResponse.self, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse.accessTokens)
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
