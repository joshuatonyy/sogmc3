//
//  TransactionViewModel.swift
//  sogmc3
//
//  Created by Joshua on 25/06/23.
//

import SwiftUI

class TransactionViewModel: ObservableObject {
    
    @Published var stepTransaction = 0
    @Published var stepDate = 0
    @Published var yearMonthFromPicker: String = ""
    
    @Published var transactions: [TransactionEntity] = []
    
    // MARK: Dependency
    let transactionRepository = TransactionRepository()
    
    //buat di FE dari transaction repo sample
//    var transactionList = TransactionRepositorySample()
//
//    var transactionMockData : [TransactionModel] {
//        var transaction1 = [] as [TransactionModel]
//        for transaction in transactionList.transactions {
//            transaction1.append(transaction)
//        }
//
//        return transaction1
//    }
    

    @Published var transactionMockData: [TransactionModel] = [
        TransactionModel(id: 0, transactionID: "123123", transactionAmount: 40000, transactionSubCategory: .foodAndBeverage, transactionName: "Fore Coffee", transactionDate: Date.now, transactionType: "Credit", transactionUser: UUID()),
        TransactionModel(id: 1, transactionID: "321321", transactionAmount: 50000, transactionSubCategory: .transportation, transactionName: "GOCAR", transactionDate: Date.now.addingTimeInterval(-60*60*24), transactionType: "Credit", transactionUser: UUID()),
        TransactionModel(id: 2, transactionID: "321424", transactionAmount: 25000, transactionSubCategory: .groceries, transactionName: "Carrefour", transactionDate: Date.now.addingTimeInterval(-60*60*24), transactionType: "Credit", transactionUser: UUID()),
        TransactionModel(id: 3, transactionID: "175452", transactionAmount: 350000, transactionSubCategory: .foodAndBeverage, transactionName: "Hachi Grill", transactionDate: Date.now.addingTimeInterval(-60*60*24*3), transactionType: "Credit", transactionUser: UUID()),
        TransactionModel(id: 4, transactionID: "124796", transactionAmount: 200000, transactionSubCategory: .transportation, transactionName: "Shell", transactionDate: Date.now.addingTimeInterval(-60*60*24*5), transactionType: "Credit", transactionUser: UUID())

    ]
    
    
    
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
