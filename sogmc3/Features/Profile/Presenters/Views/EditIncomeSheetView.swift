//
//  EditIncomeSheetView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI
import Combine

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.Neutral.s10)
            .padding(10)
    }
}

struct EditIncomeSheetView: View {
    @State private var updatedIncome: String = ""
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Edit Income")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.Neutral.s20)
                .padding()
            
            Text("will be calculated for the monthly budget")
                .font(.caption)
                .foregroundColor(Color.Neutral.s50)
                .padding(.leading, 15)
            
            Divider()
                .frame(height: 2)
                .overlay(Color.Neutral.s80)
                .padding([.bottom, .leading, .trailing], 15)
            
            HStack{
                Text("Rp")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.Neutral.s10)
                TextField("", text: $updatedIncome)
                    .foregroundColor(Color.Neutral.s10)
                    .underlineTextField()
                    .keyboardType(.numberPad)
                    .onReceive(Just(updatedIncome)){newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.updatedIncome = filtered
                        }
                    }
                
            }
            .padding()
            
            Spacer()
            
            Button{
                // TODO: action save updated income
            } label: {
                Text("Save")
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.Neutral.s30)
            }
            .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.Button.main)
            )
            .padding()
            
            
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Background.main)
    }
}
