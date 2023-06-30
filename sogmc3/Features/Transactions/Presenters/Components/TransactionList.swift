//
//  TransactionList.swift
//  sogmc3
//
//  Created by Joshua on 25/06/23.
//

import SwiftUI

struct TransactionList: View {
    //Sementara pake state dulu
    //    @State var subCategory: String = "Food and Beverage"
    //    @State var namaTransaksi: String = "Nama Transaksi"
    //    @State var tanggal: String = "July 17"
    private var currentBudget: Int {
        return transactionViewModel.transactions.reduce(0) { sum, transaction  in
            if transaction.transactionDate! == dateNow {
                return sum + Int(transaction.transactionAmount)
            }
            return sum
        }
    }
    //    @State var transactionValue: String = "20.000,00"
    
    var dateNow: Date
    
    @ObservedObject var transactionViewModel: TransactionViewModel
    
    var body: some View {
        VStack{
            
            //Looping buat tiap transaksi yang terjadi pada tanggal tertentu
            
            
            HStack{ //HStack for Date
                Text(transactionViewModel.dateToStringMonthDate(value: dateNow))
                Spacer()
                Text("Rp \(currentBudget)")
            }.padding(.top, 16)
                .foregroundColor(Color.Neutral.s60)
            ForEach(0..<transactionViewModel.transactions.count) { idx in
                let date: Date = transactionViewModel.transactions[idx].transactionDate!
                if(Calendar.current.isDate(date, equalTo: dateNow, toGranularity: .day)){
                    HStack(alignment: .center, spacing: 8){ //HStack for detail
                        Image(systemName: "house.fill")
                            .frame(width: 48, height: 48)
                            .background(Color.red)
                            .cornerRadius(24)
                        VStack(alignment: .leading, spacing: 4){
                            Text(transactionViewModel.transactions[idx].subcategories!.subCategoryName!)
                                .font(.system(size: 17))
                            Text(transactionViewModel.transactions[idx].transactionaName!)
                                .font(.system(size: 13))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text("- Rp \(transactionViewModel.transactions[idx].transactionAmount)")
                    }.padding(.bottom, 17)
                }
            }
        }
        .frame(width: 350)
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.white)
        .background(Color.CardColor.main)
    }
}

//struct TransactionList_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionList(dateNow: Date())
//    }
//}
