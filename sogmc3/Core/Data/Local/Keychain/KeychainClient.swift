//
//  KeychainClient.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

protocol KeychainClient {
    func save<T: Codable>(_ item: T, service: String, account: String) throws
    func read<T: Codable>(service: String, account: String, type: T.Type) throws -> T
}

extension KeychainClient {
    func save<T: Codable>(_ item: T, service: String, account: String) throws {
        
        do {
            // Encode as JSON data and save in keychain
            let data = try JSONEncoder().encode(item)
            try save(data, service: service, account: account)
            
        } catch {
            throw error
        }
    }
    
    func read<T: Codable>(service: String, account: String, type: T.Type) throws -> T {
        
        // Read item data from keychain
        guard let data = read(service: service, account: account) else {
            throw KeychainError.dataNotAvailable
        }
        
        // Decode JSON data to object
        do {
            let item = try JSONDecoder().decode(type, from: data)
            return item
        } catch {
            throw KeychainError.decodingFailed
        }
    }
    
    private func save(_ data: Data, service: String, account: String) throws {
        
        // Create query
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as [CFString : Any] as CFDictionary
        
        // Add data in query to keychain
        let status = SecItemAdd(query, nil)
        
        if status == errSecDuplicateItem {
             // Item already exist, thus update it.
             let query = [
                 kSecAttrService: service,
                 kSecAttrAccount: account,
                 kSecClass: kSecClassGenericPassword,
             ] as [CFString : Any] as CFDictionary

             let attributesToUpdate = [kSecValueData: data] as CFDictionary

             // Update existing item
             SecItemUpdate(query, attributesToUpdate)
        } else if status != errSecSuccess {
            throw KeychainError.unknown(status: Int(status))
        }
    }
    
    private func read(service: String, account: String) -> Data? {
        
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as [CFString : Any] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
}
