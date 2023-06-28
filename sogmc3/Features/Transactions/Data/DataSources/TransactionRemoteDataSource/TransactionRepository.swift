//
//  TransactionRepository.swift
//  sogmc3
//
//  Created by Dimas on 27/06/23.
//

import Foundation
import CoreData

struct TransactionRepository {
    
    // TODO: refactor to AuthLocalDataSource
    let authLocalDataSource: ProfileLocalDataSource
    
    init() {
        self.authLocalDataSource = ProfileLocalDataSource()
    }
    
    func fetchTransactions() async throws -> [TransactionResponse] {
        let context = CoreDataManager.instance.context
        let fetchRequest = NSFetchRequest<UserAccessTokenEntity>(entityName: "UserAccessTokenEntity")
        
        let accessTokenEntities = try context.fetch(fetchRequest)
        
        var transactionResponses: [TransactionResponse] = []
        for accessTokenEntity in accessTokenEntities {
            if let key = accessTokenEntity.key {
                let userAccessToken = try authLocalDataSource.readUserAccessToken(forKey: key)
                
                let dateFormatter = ISO8601DateFormatter()
                dateFormatter.formatOptions = [.withFullDate]
                let toDateString = dateFormatter.string(from: .now)
                let fromDateString = dateFormatter.string(from: accessTokenEntity.lastUpdated!)
                            
                let urlString = "https://sandbox.onebrick.io/v1/transaction/list?from=\(fromDateString)&to=\(toDateString)"
                print(urlString)
                guard let url = URL(string: urlString) else { throw RequestError.invalidURL }
                
                var request = URLRequest(url: url)
                request.allHTTPHeaderFields = [
                    "Authorization": "Bearer \(userAccessToken)",
                ]
                
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let response = response as? HTTPURLResponse else {
                    throw RequestError.invalidResponse
                }
                
                switch response.statusCode {
                case 200:
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let decodedResponse = try? decoder.decode(TransactionListResponse.self, from: data) else {
                        throw RequestError.decode
                    }
                
                    transactionResponses.append(contentsOf: decodedResponse.data)
                    
                    dump(decodedResponse.data)

                    accessTokenEntity.lastUpdated = Date.now

                    try context.save()
                    
                case 401:
                    throw RequestError.unauthorized
                default:
                    throw RequestError.unknown
                }
            }
            
        }
        
        return transactionResponses
    }
    
}


// TODO: refactor
struct TransactionListResponse: Codable {
    let status: Int
    let message: String
    let lastUpdateAt: String
    let data: [TransactionResponse]
}

struct TransactionResponse: Codable {
    let id: Int
    let accountId: String
    let institutionId: Int
    let merchantId: Int
    let outletOutletId: Int
    let locationCityId: Int
    let locationCountryId: Int
    let date: String
    let amount: Int
    let description: String
    let status: String
    let direction: String
    let referenceId: String
    let category: TransactionCategoryResponse
}

struct TransactionCategoryResponse: Codable {
    let categoryId: Int
    let categoryName: String
    let classificationGroupId: Int
    let classificationGroup: String
    let classificationSubgroupId: Int
    let classificationSubgroup: String
}
