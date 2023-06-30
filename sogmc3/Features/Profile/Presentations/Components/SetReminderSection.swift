//
//  SetReminderSection.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 27/06/23.
//

import SwiftUI

struct SetReminderSection: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.CardColor.main)
                    .frame(width: 32, height: 32)
                Image(systemName: "bell.fill")
                    .symbolRenderingMode(.monochrome)
                    .foregroundColor(Color.Neutral.s40)
            }
            Text("Set reminder")
                .foregroundColor(Color.Neutral.s40)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.leading, 15)
    }
}

struct SetReminderSection_Previews: PreviewProvider {
    static var previews: some View {
        SetReminderSection()
    }
}
