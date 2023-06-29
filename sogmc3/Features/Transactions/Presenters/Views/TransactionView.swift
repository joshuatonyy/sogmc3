//
//  TransactionView.swift
//  sogmc3
//
//  Created by Joshua on 23/06/23.
//

import SwiftUI

struct TransactionView: View {
    @State private var dateNow = Date.now
    @State private var datePickerOn: Bool = false
    
    
    @StateObject var customDatePickerViewModel = DatePickerViewModel()
    @StateObject var transactionViewModel = TransactionViewModel()
    
    

    var body: some View {
        ZStack {
            Color.Background.main.ignoresSafeArea()
            VStack{
                Text("\(customDatePickerViewModel.month) \(String(customDatePickerViewModel.year))")
                    .font(.system(size: 20))
                    .simultaneousGesture(TapGesture().onEnded{
                        self.datePickerOn = true
                    })
                HStack{
                    Text("Transaction")
                        .font(.system(size: 32))
                        .padding(.leading, 15)
                    Spacer()
                }
                .padding(.top)
                ScrollView{
                    //Looping buat tiap transaksi dimana bulan sama taunnya sesuai sama date picker
                    ForEach(0..<transactionViewModel.uniqueDate.count) { idx in
                        TransactionList(dateNow: transactionViewModel.uniqueDate[idx])
                            .padding(.top)
                    }
                }
                
                Spacer()
            }
            .padding(.top)
            .blur(radius: datePickerOn == true ? 25 : 0)
            .onTapGesture{
                transactionViewModel.yearMonthFromPicker = "\(customDatePickerViewModel.month) \(customDatePickerViewModel.year)"
                self.datePickerOn = false
            }
            
            CustomDatePicker(customDatePickerViewModel: customDatePickerViewModel)
                .padding(.bottom, 486)
                .padding(.horizontal, 75)
                .opacity(datePickerOn == true ? 1 : 0)
        
        }.foregroundColor(Color.white)
    }
}


struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
