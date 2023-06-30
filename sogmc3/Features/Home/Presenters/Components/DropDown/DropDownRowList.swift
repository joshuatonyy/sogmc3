//
//  DropDownRowList.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct DropDownRowList: View {
    let option: MockSubCategoryModel
    let isSelectedOption: (_ option: DropDownMenuOption) -> Void
    var body: some View {
        Button {
            self.isSelectedOption(option)
        } label: {
            HStack{
                ZStack{
                    Circle()
                        .fill(option.categoryColor!)
                    Text(option.subCatIcon!)
                        .frame(width: 14, height: 14)
                }
                Text(option.subCatName!.rawValue)
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
        DropDownRowList(option: DropDownMenuOption.dropDownDefault, isSelectedOption: {_ in})
    }
}
