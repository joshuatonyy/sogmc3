//
//  inputCategoriesCardView.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct inputCategoriesCardView: View {
    
    @State var selectSubCategory: DropDownMenuOption?
    @ObservedObject var dropdownViewModel: DropdownViewModel
    var defaultData: MockTransaction
    
    var body: some View {
        ZStack{
            Spacer(minLength: 0)
            VStack(alignment: .leading){
                //Header
                Text(defaultData.transactionName)
                    .font(.system(size: 17))
                    .foregroundColor(Color.Neutral.s20)
                    .padding(.bottom, -4)
                Text(defaultData.transactionID)
                    .font(.system(size: 16))
                    .foregroundColor(Color.Neutral.s50)
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
                    .frame(height: 1)
                    .foregroundColor(.white)
                
                //Body
                Text(defaultData.amount).bold()
                    .font(.system(size: 34))
                    .foregroundColor(Color.Neutral.s10)
                    .padding(.bottom, 60)
                HStack{
                    Text("Transfer Date")
                    Spacer()
                    Text("Time")
                }
                .font(.system(size: 11))
                .foregroundColor(Color.Neutral.s60)
                .padding(.bottom, -4)
                
                HStack{
                    Text(defaultData.date)
                    Spacer()
                    Text(defaultData.time)
                }
                .font(.system(size: 13))
                .foregroundColor(Color.Neutral.s20)
                .padding(.bottom,10)
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
                    .frame(height: 1)
                    .foregroundColor(.white)
                
                //Footer
                Text("Select Category").bold()
                    .foregroundColor(Color.Neutral.s20)
                    .font(.system(size: 15))
                    .padding([.top, .bottom], 5)
            }
            .frame(width: 300, height: 376, alignment: .top)
            .padding(.vertical)
            .padding(.horizontal)
            .background(Color.CardColor.main)
            .cornerRadius(8)
            .shadow(radius: 5, x: 0, y: 0)
            Spacer(minLength: 0)
            
            DropDown(selectedOption: self.$selectSubCategory, dropdownViewModel: dropdownViewModel, placeholder: "Select your sub category", options: DropDownMenuOption.dropDownList)
                .frame(maxWidth: 300)
                .offset(y: 124)
        }
    }
}


struct inputCategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        inputCategoriesCardView(dropdownViewModel: DropdownViewModel(),defaultData: MockTransaction.defaultData)
    }
}
