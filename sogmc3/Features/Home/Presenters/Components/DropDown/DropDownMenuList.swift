//
//  DropDownMenuList.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct DropDownMenuList: View {
    // option
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    
    // an action called when user select an action
    let isSelectedOption: (_ subCategory: EnumSubCategoriesName) -> Void
    
    //to count the subcategory choosed by user
    @State var totalSubCategory = 0
    
    var body: some View {
        ScrollView{
            LazyVStack (alignment: .leading, spacing: 2){
                ForEach(subCategoryVM.subCategoryData) { subCategory in
                    DropDownRowList(subCategory: subCategory,
                                    isSelectedOption: self.isSelectedOption)
                    Divider()
                }
            }
        }
        .frame(height: (totalSubCategory * 32) > 300 ?
               300 :
                CGFloat(totalSubCategory * 32))
        .padding(.vertical, 5)
        .background(Color.CardColor.main)
        .onAppear {
            //count subcategory
            self.totalSubCategory = subCategoryVM.subCategoryData.filter({ subCategory in
                subCategory.isChecked == false
//                subCategory.isChecked == true //ini yang bener
            }).count
        }
    }
}

struct DropDownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenuList(subCategoryVM:
                            MockSubCategoryViewModel(),
                         isSelectedOption: {_ in })
    }
}
