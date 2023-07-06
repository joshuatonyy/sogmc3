//
//  DropDown.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct DropDown: View {

//    // use to bind user selection
//    @Binding var selectedOption: DropDownMenuOption?
    
    @Binding var transaction: TransactionModel
    
    //buat swipe
    @ObservedObject var dropdownVM: DropdownViewModel
    
    //buat ambil list category yang udah di save diawal
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    
    //setiap transaksi
//    @ObservedObject var transactionVM: TransactionViewModel
    
    var body: some View {
        Button {
            withAnimation {
                dropdownVM.isOptionsPresented.toggle()
            }
        } label: {
            HStack{
                ZStack{
                    Circle().fill(transaction.transactionSubCategory == nil ?
                                Color.CardColor.secondary :
                                getSubCategoryColor(subCatName: transaction.transactionSubCategory!))
                        .frame(width: 30, height: 30)

                    Text(transaction.transactionSubCategory == nil ?
                         "" :
                        transaction.transactionSubCategory!.getSubCatIcon())
                }
                Text(transaction.transactionSubCategory == nil ?
                        dropdownVM.placeholder :
                        transaction.transactionSubCategory!.rawValue)
                    .fontWeight(.medium)
                    .foregroundColor(transaction.transactionSubCategory == nil ? .gray : .white)
                Spacer()
                Image(systemName: dropdownVM.isOptionsPresented ? "chevron.up" : "chevron.down")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .font(.system(size: 11.9))
        }
        .padding()
        .background(Color.Main.s80)
        .cornerRadius(8)
        .overlay(alignment: .top){
            VStack{
                if dropdownVM.isOptionsPresented {
                    Spacer(minLength: 50)
                    DropDownMenuList(subCategoryVM: subCategoryVM) { subCategory in
                        self.transaction.transactionSubCategory = subCategory
                        dropdownVM.dropdownSelected = subCategory
                        dropdownVM.isOptionsPresented = false
                    }
                }
            }
        }
    }
    
    func getSubCategoryColor(subCatName: EnumSubCategoriesName) -> Color {
        var color: Color?
        
        for subCategory in subCategoryVM.subCategoryData {
            if subCatName == subCategory.subCatName {
                color = subCategory.categoryColor!
            }
        }
        return color!
    }
    
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown(transaction: .constant(TransactionModel(id: 0, transactionID: "123123", transactionAmount: 40000, transactionSubCategory: .foodAndBeverage, transactionName: "Fore Coffee", transactionDate: Date.now, transactionType: "Credit", transactionUser: UUID())),
                 dropdownVM: DropdownViewModel(),
                 subCategoryVM: MockSubCategoryViewModel())
    }
}
