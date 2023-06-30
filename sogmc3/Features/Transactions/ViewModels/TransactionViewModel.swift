//
//  TransactionViewModel.swift
//  sogmc3
//
//  Created by Joshua on 25/06/23.
//

import SwiftUI

class TransactionViewModel: ObservableObject, Identifiable {
    
//    var transactionList = TransactionRepositorySample()
    @Published var stepTransaction = 0
    @Published var stepDate = 0
    @Published var yearMonthFromPicker: String = ""
    
    @Published var transactions: [TransactionEntity] = []
    
    // MARK: Dependency
    let transactionRepository = TransactionRepository()
    
//    var transaction: [TransactionModel] {
//        var transaction1 = [] as [TransactionModel]
//        for transaction in transactionList.transactions {
//            transaction1.append(transaction)
//        }
//
//        return transaction1
//    }
    
    func refreshTransactions() {
        transactions.removeAll(keepingCapacity: true)
        Task {
            let result = await transactionRepository.readTransactions()
            await MainActor.run {
                transactions = result
            }
        }
    }
    
    func dateToStringMonthDate(value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: value)
    }
    
    func dateToStringMonthYear(value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        print(dateFormatter.string(from: value))
        return dateFormatter.string(from: value)
    }
    
    var uniqueDate: [Date]{
        var dates = [Date]()
        var uniqueDate = [Date]()
        var uniqueDateReal = Set<DateComponents>()

        for transaction in transactions {
//            print(yearMonthFromPicker)
//            if(dateToStringMonthYear(value: transaction.transactionDate) == yearMonthFromPicker){
//                dates.append(transaction.transactionDate)
//            }
            
            dates.append(transaction.transactionDate!)
        }
        print(dates.count)

        for idx in 0..<dates.count {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: dates[idx])
            if !uniqueDateReal.contains(dateComponents) {
                uniqueDateReal.insert(dateComponents)
                uniqueDate.append(dates[idx])
            }
        }

        return uniqueDate
    }
    
    
}

extension Text {

    func h1() -> Text {
        self
            .font(.title3)
            .fontWeight(.semibold)
    }
}
