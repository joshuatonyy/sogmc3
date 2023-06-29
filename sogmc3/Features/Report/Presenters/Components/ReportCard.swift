//
//  ReportCard.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import SwiftUI

struct ReportCard: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Needs")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 326, height: 25, alignment: .topLeading)
            
        }
        .padding(16)
        .background(Color.CardColor.main)
    }
}

struct ReportCard_Previews: PreviewProvider {
    static var previews: some View {
        ReportCard()
    }
}
