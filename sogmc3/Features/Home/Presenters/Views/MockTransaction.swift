//
//  MockTransaction.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 28/06/23.
//

import Foundation

struct MockTransaction: Identifiable{
    var id: Int
    var transactionID: String
    var transactionName: String
    var amount: String
    var date: String
    var time: String
}

extension MockTransaction{
    static let defaultData: MockTransaction = MockTransaction(id: 0, transactionID: "131231232", transactionName: "PT Pandji Edukasi", amount: "Rp 20.000", date: "June 12th, 2023", time: "12.01")
    static let data: [MockTransaction] = [
        MockTransaction(id: 0, transactionID: "13231232",transactionName: "PT Pandji Edukasi", amount: "Rp. 20.000", date: "June 12th, 2023", time: "12.01"),
        MockTransaction(id: 1, transactionID: "13133231232", transactionName: "Nasi Padang", amount: "Rp. 50.000", date: "June 15th, 2023", time: "12.15"),
        MockTransaction(id: 2,transactionID: "1312332321232", transactionName: "Master", amount: "Rp. 20.000", date: "June 19th, 2023", time: "11.01"),
        MockTransaction(id: 3, transactionID: "1312232", transactionName: "Maxta", amount: "Rp. 50.000", date: "July 21st, 2023", time: "16.01"),
        MockTransaction(id: 4,transactionID: "13131232" ,transactionName: "Gojek", amount: "Rp. 20.000", date: "June 15th, 2023", time: "12.01")
    ]
}
