//
//  AuthResponse.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

struct AuthResponse: Codable {
    let status: Int
    let message: String
    let data: Self.Data
    
    struct Data: Codable {
        let accessToken: String
    }
    
}

struct InvalidCredentialResponse: Codable {
    let status: Int
    let message: String
    let data: String
}
