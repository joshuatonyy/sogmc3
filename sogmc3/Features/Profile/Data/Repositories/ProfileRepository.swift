//
//  ProfileRepository.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

struct ProfileRepository {
    
    let profileLocalDataSource: ProfileLocalDataSourceProtocol
    let profileRemoteDataSource: ProfileRemoteDataSourceProtocol
    
    init() {
        self.profileLocalDataSource = ProfileLocalDataSource()
        self.profileRemoteDataSource = ProfileRemoteDataSource()
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
    
}
