//
//  TransactionRepositorySample.swift
//  sogmc3
//
//  Created by Joshua on 26/06/23.
//

import Foundation

class TransactionRepositorySample {
    var transactions: [TransactionModel] = []
    var transactionsDate: [Date] = []
    let userId = UUID()
    
    func generateRandomDateInMay2023() -> Date? {
        let calendar = Calendar.current

        // Set the date components for the desired month and year
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 5
        // Get the range of valid days in May 2023
        guard let validRange = calendar.range(of: .day, in: .month, for: calendar.date(from: dateComponents)!) else {
            return nil
        }
        // Generate a random day within the valid range
        let randomDay = Int.random(in: validRange)
        // Set the day component of the date components
        dateComponents.day = randomDay
        // Create and return the random date
        return calendar.date(from: dateComponents)
    }
    
    //Initialize Sample Transaction Model
    init(){
        let T1 = TransactionModel(transactionAmount: 40000, transactionSubCategory: "Food and Beverage", transactionName: "Fore Coffee", transactionDate: Date.now, transactionType: "Credit", transactionUser: userId)
        let T2 = TransactionModel(transactionAmount: 50000, transactionSubCategory: "Transportation", transactionName: "GOCAR", transactionDate: Date.now.addingTimeInterval(-60*60*24), transactionType: "Credit", transactionUser: userId)
        let T3 = TransactionModel(transactionAmount: 25000, transactionSubCategory: "Groceries", transactionName: "Carrefour", transactionDate: Date.now.addingTimeInterval(-60*60*24), transactionType: "Credit", transactionUser: userId)
        let T4 = TransactionModel(transactionAmount: 350000, transactionSubCategory: "Food and Beverage", transactionName: "Hachi Grill", transactionDate: Date.now.addingTimeInterval(-60*60*24*3), transactionType: "Credit", transactionUser: userId)
        let T5 = TransactionModel(transactionAmount: 200000, transactionSubCategory: "Transportation", transactionName: "Shell", transactionDate: Date.now.addingTimeInterval(-60*60*24*5), transactionType: "Credit", transactionUser: userId)
        
        transactions.append(T1)
        transactions.append(T2)
        transactions.append(T3)
        transactions.append(T4)
        transactions.append(T5)
        
        transactionsDate.append(T1.transactionDate)
        transactionsDate.append(T2.transactionDate)
        transactionsDate.append(T3.transactionDate)
        transactionsDate.append(T4.transactionDate)
        transactionsDate.append(T5.transactionDate)
    }
    
    func getTransactions(index: Int) -> TransactionModel {
        return transactions[index]
    }
    
    func getTransactionsDates(index: Int) -> Date {
        return transactionsDate[index]
    }
}
