//
//  ProfileNetworkDataSource.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

struct ProfileNetworkDataSource: HTTPClient {
    
    func getAccessToken() async -> Result<AuthResponse, RequestError> {
        await sendRequest(
            endpoint: ProfileEndpoint.auth,
            responseModel: AuthResponse.self
        )
    }
    
}
