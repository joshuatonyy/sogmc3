//
//  DropDown.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct DropDown: View {
    
    // use to show and hide dropdown
    @State private var isOptionsPresented: Bool = false
    
    // use to bind user selection
    @Binding var selectedOption: DropDownMenuOption?
    
    @ObservedObject var dropdownViewModel: DropdownViewModel
    
    // for placeholder to drop-down menu
    let placeholder: String
    
    // dropdown menu list
    let options: [DropDownMenuOption]
    
    var body: some View {
        Button {
            withAnimation {
                self.isOptionsPresented.toggle()
            }
        } label: {
            HStack{
                ZStack{
                    Circle().fill(selectedOption == nil ? Color.CardColor.secondary : Color.CategoryColor.red).frame(width: 30, height: 30)

                    Text(selectedOption == nil ? "" : selectedOption!.icon)
                }
                Text(selectedOption == nil ? placeholder : selectedOption!.option)
                    .fontWeight(.medium)
                    .foregroundColor(selectedOption == nil ? .gray : .white)
                Spacer()
                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
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
                if self.isOptionsPresented {
                    Spacer(minLength: 50)
                    DropDownMenuList(options: self.options){ option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                        dropdownViewModel.dropdownSelected = self.selectedOption!
                    }
                }
            }
        }
    }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown(selectedOption: .constant(nil), dropdownViewModel: DropdownViewModel(),
                 placeholder: "Select your sub category",
                 options: DropDownMenuOption.dropDownList)
    }
}
