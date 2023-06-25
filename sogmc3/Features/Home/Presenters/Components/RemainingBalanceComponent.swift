//
//  RemainingBalanceComponent.swift
//  sogmc3
//
//  Created by ndyyy on 21/06/23.
//

import SwiftUI

struct RemainingBalanceComponent: View {
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Remaining balance")
                .foregroundColor(Color.Neutral.s50)
            
            HStack {
                Text("Rp \(Int(homeVM.budget - homeVM.spend))")
                    .foregroundColor(Color.Neutral.s10)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    print("Refresh Page")
                } label: {
                    Image("Refresh")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.bottom, 20)
                }
                .foregroundColor(Color.Neutral.s50)
                .frame(width: 16, height: 16)
            }
            .padding(.top, -12)
        }
    }
}

struct RemainingBalanceComponent_Previews: PreviewProvider {
    static var previews: some View {
        RemainingBalanceComponent(homeVM: HomeViewModel())
            .background(.black)
    }
}
