//
//  ProfileEndpoint.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

enum ProfileEndpoint {
    case auth
}

extension ProfileEndpoint: Endpoint {
    var path: String {
        switch self {
        case .auth:
            return "/auth/token"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .auth:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .auth:
            // TODO: refactor to somewhere save
            let clientID = "f81015d2-4540-4ce4-b9e8-8b4f02f3f19b"
            let clientSecret = "j6iiEu4hgYGeLtJTrgvCYIBB4E12w0"
            let loginString = "\(clientID):\(clientSecret)"
            guard let auth = loginString.data(using: .utf8) else {
                return nil
            }
            let base64LoginString = auth.base64EncodedString()
            return [
                "Authorization": "Basic \(base64LoginString)",
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .auth:
            return nil
        }
    }
    
}
