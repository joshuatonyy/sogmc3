//
//  RemainingBalanceComponent.swift
//  sogmc3
//
//  Created by ndyyy on 21/06/23.
//

import SwiftUI

struct RemainingBalanceComponent: View {
    @ObservedObject var homeVM: MockHomeViewModel
    
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
                    //get the API Data
                    print("Refresh Page")
                    
                    //recalculate the spendratio
                    withAnimation(.easeIn(duration: 1.8)) {
//                        homeVM.spendRatio = 0.84
                    }
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
        RemainingBalanceComponent(homeVM: MockHomeViewModel())
            .background(.black)
    }
}
