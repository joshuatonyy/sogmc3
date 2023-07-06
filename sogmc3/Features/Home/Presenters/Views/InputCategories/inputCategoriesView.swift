//
//  inputCategoriesView.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct inputCategoriesView: View {
    
    @State private var x: [CGFloat] = [0,0,0,0,0,0,0,0,0,0]
    @State private var degree: [Double] = [0,0,0,0,0,0,0,0,0,0]
    @State var currentIndex = 0
    
    //buat ambil list category yang udah di save diawal
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    
    //setiap transaksi
    @StateObject var transactionVM = TransactionViewModel()
    
//    @State var data: [MockTransaction] = MockTransaction.data
    @StateObject var dropdownVM = DropdownViewModel()
    
    var body: some View {
        ZStack{
            Color.Background.main.ignoresSafeArea()
            //klo data transaksi kosong
            if transactionVM.transactionMockData.isEmpty {
                NoTransactionView()
                Text("EMPTY")
            } else {
                Text("Swipe right card to save")
                    .font(.system(size: 15))
                    .foregroundColor(Color.Neutral.s20)
                    .offset(y: 250)
                ZStack {
                    //show data ga pake reverse
                    ForEach(transactionVM.transactionMockData.reversed()) { transaction in
                        VStack {
                            inputCategoriesCardView(subCategoryVM: subCategoryVM,
                                                    dropdownVM: dropdownVM,
                                                    transaction: transaction)
                                .offset(y: transaction.id - currentIndex <= 2 ? CGFloat(transaction.id - currentIndex) * 25 : 50)
                                .scaleEffect(x: 1 - CGFloat(transaction.id - currentIndex) * 0.1)
                                .padding(.bottom, 50)
                        }
                        .offset(x: self.x[transaction.id])
                        .rotationEffect(.init(degrees: self.degree[transaction.id]))
                        .gesture(DragGesture()
                            .onChanged({ (value) in
//                                print("on change")
//                                print(transactionVM.transactionRepository.count)
                                if value.translation.width > 0{
                                    self.x[transaction.id] = value.translation.width
                                    self.degree[transaction.id] = 8
                                } else {
                                    self.x[transaction.id] = value.translation.width
                                    self.degree[transaction.id] = -8
                                }
                            })
                                .onEnded({ (value) in
                                    if value.translation.width > 0 {
                                        if value.translation.width > 100 && dropdownVM.dropdownSelected != nil {
                                            self.x[transaction.id] = 500
                                            self.degree[transaction.id] = 12
                                            currentIndex = transaction.id + 1
                                            
                                            //delete from vm
//                                          //  transactionVM.transactionRepository.remove(at: 0)
                                            
                                            //add to coredata
                                            
                                        } else{
                                            self.x[transaction.id] = 0
                                            self.degree[transaction.id] = 0
                                        }
                                    }else{
                                        if value.translation.width < -100{
                                            self.x[transaction.id] = 0
                                            self.degree[transaction.id] = 0
                                        }
                                    }
                                }))
                    }
                }
            }
        }
    }
}


struct inputCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        inputCategoriesView(subCategoryVM: MockSubCategoryViewModel())
    }
}

