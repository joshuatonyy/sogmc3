//
//  ProfileEndpoint.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

enum ProfileEndpoint {
    case publicAuth, userAccessToken(userID: String)
}

extension ProfileEndpoint: Endpoint {
    var path: String {
        switch self {
        case .publicAuth:
            return "/auth/token"
        case .userAccessToken:
            return "/getAccessTokensForUser"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .publicAuth:
            return .get
        case .userAccessToken:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .publicAuth:
            // TODO: refactor to somewhere save
            let clientID = "279b131a-b11a-4dcd-a410-f9f1deb0957a"
            let clientSecret = "REriCSJaIuvLlj1ARIUClTM2a7xr7U"
            let loginString = "\(clientID):\(clientSecret)"
            guard let auth = loginString.data(using: .utf8) else {
                return nil
            }
            let base64LoginString = auth.base64EncodedString()
            return [
                "Authorization": "Basic \(base64LoginString)",
            ]
        case .userAccessToken:
            return nil
        }
    }
    
    var queries: [URLQueryItem]? {
        switch self {
        case .publicAuth:
            return nil
        case .userAccessToken(let userID):
            return [
                URLQueryItem(name: "userID", value: String(userID))
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .publicAuth, .userAccessToken:
            return nil
        }
    }
    
    var host: String {
        switch self {
        case .publicAuth:
            return "sandbox.onebrick.io/v1"
        case .userAccessToken:
            return "sogserver-production.up.railway.app"
        }
    }
    
}
