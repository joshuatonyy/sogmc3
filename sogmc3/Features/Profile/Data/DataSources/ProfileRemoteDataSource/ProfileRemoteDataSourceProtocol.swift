//
//  ProfileRemoteDataSourceProtocol.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

protocol ProfileRemoteDataSourceProtocol {
    func getPublicAccessToken() async -> Result<AuthResponse, RequestError>
    func getUserAuthTokens(for userID: String) async -> Result<AccessTokenResponse, RequestError>
}
