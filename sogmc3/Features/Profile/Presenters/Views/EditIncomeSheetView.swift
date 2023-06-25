//
//  EditIncomeSheetView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI



struct EditIncomeSheetView: View {
    @Binding var showNewScreen: Bool
    
    var body: some View {
        VStack{
            Button {
                showNewScreen = false
            } label: {
                HStack {
                    Image(systemName: "xmark")
                    Text("Back")
                }
            }

            Text("Edit Income")
                .font(.title)
                .padding()
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Neutral.s70)
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
