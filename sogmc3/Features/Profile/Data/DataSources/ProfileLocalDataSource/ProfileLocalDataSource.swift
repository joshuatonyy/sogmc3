//
//  ProfileLocalDataSource.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation
import CoreData

struct ProfileLocalDataSource: ProfileLocalDataSourceProtocol, KeychainClient {
    
    func savePublicAccessToken(_ accessToken: String) throws {
        try save(accessToken, service: "public-access-token", account: "brick")
    }
    
    func saveUserAccessToken(_ accessToken: String, forKey key: String) throws {
        try save(accessToken, service: "user-access-token", account: "brick:\(key)")
    }
    
    func readPublicAccessToken() throws -> String {
        try read(service: "public-access-token", account: "brick", type: String.self)
    }
    
    func readUserAccessToken(forKey key: String) throws -> String {
        try read(service: "user-access-token", account: "brick:\(key)", type: String.self)
    }
    
    func saveAccessTokens(_ tokens: [UserAccessTokenResponse]) throws {
        let context = CoreDataManager.instance.context
        
        var tokenStrings: [String] = []
        for token in tokens {
            
            // check if an access token for the given bank id is already exist
            let fetchRequest = NSFetchRequest<UserAccessTokenEntity>(entityName: "UserAccessTokenEntity")
            fetchRequest.predicate = NSPredicate(format: "bankID = %@", argumentArray: [token.bankId])
            
            let results = try context.fetch(fetchRequest)
            
            guard let object = results.first else {
                let userAccessToken = UserAccessTokenEntity(context: context)
                userAccessToken.bankID = token.bankId
                userAccessToken.key = UUID().uuidString
                
                var dateComponents = DateComponents()
                dateComponents.month = -1

                let calendar = Calendar.current
                let oneMonthBefore = calendar.date(byAdding: dateComponents, to: .now)
                userAccessToken.lastUpdated = oneMonthBefore
                tokenStrings.append(token.accessToken)
                try saveUserAccessToken(token.accessToken, forKey: userAccessToken.key!)
                
                continue
            }
            
            object.lastUpdated = .distantPast
            try saveUserAccessToken(token.accessToken, forKey: object.key!)
            try context.save()
        }
        
    }
    
    func readAccessToken() throws -> [String] {
        let context = CoreDataManager.instance.context
        let fetchRequest = NSFetchRequest<UserAccessTokenEntity>(entityName: "UserAccessTokenEntity")

        do {
            let accessTokenEntities = try context.fetch(fetchRequest)
            // The result is an array of UserAccessTokenEntity objects

            return accessTokenEntities.map {
                return try! readUserAccessToken(forKey: $0.key!)
            }
        } catch {
            throw error
        }

    }
    
}
