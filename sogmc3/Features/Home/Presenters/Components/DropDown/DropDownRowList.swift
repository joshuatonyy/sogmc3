//
//  DropDownRowList.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct DropDownRowList: View {
    var subCategory: MockSubCategoryModel
    let isSelectedOption: (_ option: EnumSubCategoriesName) -> Void
    var body: some View {
        Button {
            //ganti option
            self.isSelectedOption(subCategory.subCatName!)
        } label: {
            HStack{
                ZStack{
                    Circle()
                        .fill(subCategory.categoryColor!)
                    Text(subCategory.subCatIcon!)
                        .frame(width: 14, height: 14)
                }
                Text(subCategory.subCatName!.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.system(size: 11.9))
        }
        .foregroundColor(.white)
        .frame(height: 34)
        .padding(.horizontal)
    }
}

struct DropDownRowList_Previews: PreviewProvider {
    static var previews: some View {
        DropDownRowList(subCategory: MockSubCategoryModel(subCatName: .foodAndBeverage, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
                        isSelectedOption: {_ in})
    }
}
