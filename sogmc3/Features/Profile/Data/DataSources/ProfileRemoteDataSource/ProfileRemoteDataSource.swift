//
//  ProfileRemoteDataSource.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

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
    
}
