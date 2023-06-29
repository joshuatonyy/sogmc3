//
//  TransactionModel.swift
//  sogmc3
//
//  Created by Joshua on 26/06/23.
//

import Foundation

struct TransactionModel {
    var transactionAmount: Int
    var transactionSubCategory: String
    var transactionName: String
    var transactionDate: Date
    var transactionType: String
    var transactionUser: UUID
}
