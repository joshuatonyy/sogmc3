//
//  RequestError.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case invalidAuthString
    case invalidResponse
    case unauthorized
    case unknown
}
