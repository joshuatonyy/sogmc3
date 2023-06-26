//
//  ProfileRepository.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

struct ProfileRemoteDataSourceMock: ProfileRemoteDataSourceProtocol {
    func getPublicAccessToken() async -> Result<AuthResponse, RequestError> {
        return .success(AuthResponse(status: 200, message: "ok", data: AuthResponse.Data(accessToken: "accessTokenMock")))
    }
    
    func getUserAuthTokens(for userID: String) async -> Result<AccessTokenResponse, RequestError> {
        return .success(AccessTokenResponse(accessTokens: [
            AccessToken(accessToken: "mock-access-token-1", bankId: "1"),
            AccessToken(accessToken: "mock-access-token-2", bankId: "2")
        ]))
    }
}

struct ProfileRepository {
    
    let profileLocalDataSource: ProfileLocalDataSourceProtocol
    let profileRemoteDataSource: ProfileRemoteDataSourceProtocol
    
    init() {
        self.profileLocalDataSource = ProfileLocalDataSource()
        self.profileRemoteDataSource = ProfileRemoteDataSource()
        
//        #if DEBUG
//        profileRemoteDataSource = ProfileRemoteDataSourceMock()
//        #else
//        profileRemoteDataSource = ProfileRemoteDataSource()
//        #endif
    }
    
    func fetchPublicAcessToken() async throws {
        let fetchResult = await profileRemoteDataSource.getPublicAccessToken()
        
        let publicAccessToken: String?
        switch fetchResult {
        case .success(let response):
            publicAccessToken = response.data.accessToken
        case .failure(let failure):
            throw failure
        }
        
        guard let publicAccessToken else { throw RequestError.invalidAuthString }
        
        try profileLocalDataSource.savePublicAccessToken(publicAccessToken)
    }
    
    func readPublicAccessToken() throws -> String {
        try profileLocalDataSource.readPublicAccessToken()
    }
    
    func fetchUserAccessToken(for userID: String) async throws {
        let result = await profileRemoteDataSource.getUserAuthTokens(for: userID)
        switch result {
        case .success(let success):
            let userAccessTokens = success.accessTokens
            for accessToken in userAccessTokens {
                try profileLocalDataSource.saveUserAccessToken(accessToken.accessToken, forBankID: accessToken.bankId)
                print("\(accessToken) saved")
            }
        case .failure(let failure):
            throw failure
        }
    }
    
}
