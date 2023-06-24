//
//  EditIncomeSheetView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI



struct EditIncomeSheetView: View {
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack{
            Text("Edit Income")
                .font(.title)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Neutral.s70)

    }
}

struct EditIncomeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EditIncomeSheetView()
    }
}
