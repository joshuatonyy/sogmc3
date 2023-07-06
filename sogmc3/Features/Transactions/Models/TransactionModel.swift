//
//  TransactionModel.swift
//  sogmc3
//
//  Created by Joshua on 26/06/23.
//

import Foundation

struct TransactionModel: Identifiable {
    //id untuk pembeda
    var id: Int
    //id dari transaksi API
    var transactionID: String
    
    var transactionAmount: Int
    var transactionSubCategory: EnumSubCategoriesName?
    var transactionName: String
    var transactionDate: Date
    var transactionType: String
    var transactionUser: UUID
}
