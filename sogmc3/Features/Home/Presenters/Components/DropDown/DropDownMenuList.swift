//
//  DropDownMenuList.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct DropDownMenuList: View {
    // option
    let options: [DropDownMenuOption]
    
    // an action called when user select an action
    let isSelectedOption: (_ option: DropDownMenuOption) -> Void
    var body: some View {
        ScrollView{
            LazyVStack (alignment: .leading, spacing: 2){
                ForEach(options) { option in
                    DropDownRowList(option: option, isSelectedOption: self.isSelectedOption)
                    Divider()
                }
            }
        }
        .frame(height: CGFloat(self.options.count * 32 > 300 ? 300 : CGFloat(self.options.count * 32)))
        .padding(.vertical, 5)
        .background(Color.CardColor.main)
    }
}

struct DropDownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenuList(options: DropDownMenuOption.dropDownList, isSelectedOption: {_ in })
    }
}
