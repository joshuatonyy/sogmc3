//
//  EditIncomeSection.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 27/06/23.
//

import SwiftUI

struct EditIncomeSection: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.CardColor.main)
                
                Image(systemName: "dollarsign.circle")
                    .foregroundColor(Color.Neutral.s40)
                    .symbolRenderingMode(.monochrome)
            }
            Text("Edit income")
                .foregroundColor(Color.Neutral.s40)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.leading, 15)    }
}

struct EditIncomeSection_Previews: PreviewProvider {
    static var previews: some View {
        EditIncomeSection()
    }
}
