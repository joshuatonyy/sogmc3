//
//  SetReminderView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI

struct SetReminderView: View {
    @Binding var showNewScreen: Bool

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
            
            Text("Set reminder")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(Color.Neutral.s10)
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

//struct SetReminderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetReminderView()
//    }
//}
