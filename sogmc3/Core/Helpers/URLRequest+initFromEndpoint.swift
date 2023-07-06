//
//  URLRequest+initFromEndpoint.swift
//  sogmc3
//
//  Created by Dimas on 22/06/23.
//

import Foundation

extension URLRequest {
    
    /// Initializes a new `URLRequest` from the given `Endpoint`.
    ///
    /// - Parameter endpoint: The endpoint used to create the `URLRequest`.
    /// - Returns: A URLRequest object or nil if the URL from an ``Endpoint`` is invalid.
    init?(from endpoint: Endpoint) {
        guard let url = makeURL(from: endpoint) else { return nil }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        self = request
    }
    
}

/// Creates a `URL` object from the given ``Endpoint`` object
/// - Parameter endpoint: The ``Endpoint`` object to create a `URL` object from
/// - Returns: The `URL` object created from the `Endpoint` object, or `nil` if one could not be created
fileprivate func makeURL(from endpoint: Endpoint) -> URL? {
    var urlComponents = URLComponents()
    urlComponents.scheme = endpoint.scheme
    urlComponents.host = endpoint.host
    urlComponents.path = endpoint.path
    urlComponents.queryItems = endpoint.queries
    
    return urlComponents.url
}
