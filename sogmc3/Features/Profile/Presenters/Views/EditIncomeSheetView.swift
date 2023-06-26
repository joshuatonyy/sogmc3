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
    @Binding var showNewScreen: Bool
    @State private var updatedIncome: String = ""
    
    var body: some View {
        VStack (alignment: .leading){
            Button {
                showNewScreen = false
            } label: {
                HStack {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                    Spacer()
                }
            }

            Text("Edit Income")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(Color.Neutral.s10)
                .padding()
            
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
                // action save updated income
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        // TODO: color apply guide doesnt exist
        .background(Color.Main.s70)
        
        .presentationDragIndicator(.visible)
        .presentationDetents([.fraction(0.8), .large])
                
        .gesture(DragGesture().onEnded { value in
            if value.translation.height > 50 { // Adjust the threshold as needed
                showNewScreen = false
            }
        })
    }
}

//struct EditIncomeSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditIncomeSheetView()
//    }
//}
