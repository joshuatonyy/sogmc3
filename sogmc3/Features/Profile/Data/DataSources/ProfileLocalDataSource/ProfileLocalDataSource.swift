//
//  ProfileLocalDataSource.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

struct ProfileLocalDataSource: ProfileLocalDataSourceProtocol, KeychainClient {
    
    func savePublicAccessToken(_ accessToken: String) throws {
        try save(accessToken, service: "public-access-token", account: "brick")
    }
    
    func saveUserAccessToken(_ accessToken: String, forBankID bankID: Int) throws {
        try save(accessToken, service: "user-access-token", account: "brick:\(bankID)")
    }
    
    func readPublicAccessToken() throws -> String {
        try read(service: "public-access-token", account: "brick", type: String.self)
    }
    
    func readUserAccessToken(for bankID: Int) throws -> String {
        try read(service: "user-access-token", account: "brick:\(bankID)", type: String.self)
    }
    
}
