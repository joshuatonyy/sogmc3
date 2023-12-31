//
//  Endpoint.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queries: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "sandbox.onebrick.io"
    }
}
