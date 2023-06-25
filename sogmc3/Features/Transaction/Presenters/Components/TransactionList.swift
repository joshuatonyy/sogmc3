//
//  TransactionList.swift
//  sogmc3
//
//  Created by Joshua on 25/06/23.
//

import SwiftUI

struct TransactionList: View {
    //Sementara pake state dulu
    @State var subCategory: String = "Food and Beverage"
    @State var namaTransaksi: String = "Nama Transaksi"
    @State var tanggal: String = "July 17"
    @State var currentBudget: String = "2.450.000,00"
    @State var transactionValue: String = "20.000,00"
    
    var body: some View {
        VStack{
            HStack{ //HStack for Date
                Text("July 17")
                Spacer()
                Text("Rp \(currentBudget)")
            }.padding(.top, 16)
                .foregroundColor(Color.Neutral.s60)
            HStack{ //HStack for detail
                Image(systemName: "house.fill")
                    .frame(width: 48, height: 48)
                    .background(Color.red)
                    .cornerRadius(24)
                VStack{ //ALIGNMENT BELOM LEADING
                    Text("\(subCategory)")
                        .font(.system(size: 17))
                    Text("\(namaTransaksi)")
                        .font(.system(size: 13))
                }
                .frame(width: 150)
                Spacer()
                Text("- Rp \(transactionValue)")
            }.padding(.bottom, 17)
        }
        .frame(width: 350)
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.white)
        .background(Color.CardColor.main)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionList()
    }
}
