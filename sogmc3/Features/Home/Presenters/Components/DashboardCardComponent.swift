//
//  ProgressBarCategory.swift
//  sogmc3
//
//  Created by ndyyy on 21/06/23.
//

import SwiftUI



    
struct DashboardCardComponent: View {
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                //MARK: Remaining Balance
                RemainingBalanceComponent(homeVM: homeVM)
                
                //MARK: Progress Bar & Spending Text
                ProgressBarHomeComponent(homeVM: homeVM)
                    .frame(maxHeight: 55)
            }
            .frame(maxWidth: 326)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.CardColor.main)
    }
}

struct DashboardCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCardComponent(homeVM: HomeViewModel())
    }
}
