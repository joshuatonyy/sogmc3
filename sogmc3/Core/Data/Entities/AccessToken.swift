//
//  AccessToken.swift
//  sogmc3
//
//  Created by Dimas on 26/06/23.
//

import Foundation

struct AccessToken: Decodable {
    let accessToken: String
    let bankId: String
}

struct AccessTokenResponse: Decodable {
    let accessTokens: [AccessToken]
}
