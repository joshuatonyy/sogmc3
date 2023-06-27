//
//  ProgressBarCategory.swift
//  sogmc3
//
//  Created by ndyyy on 21/06/23.
//

import SwiftUI



    
struct DashboardCardComponent: View {
    @ObservedObject var homeVM: MockHomeViewModel
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                //MARK: Remaining Balance
                RemainingBalanceComponent(homeVM: homeVM)
                
                
                //MARK: Progress Bar & Spending Text
                ProgressBarHomeComponent(homeVM: homeVM)
                    .frame(maxHeight: 55)
                    
                
                if homeVM.isNotificationExist {
                    Text("\(Image(systemName: "exclamationmark.triangle")) To update the data, please categorize your spendings")
                        .foregroundColor(Color.Semantic.Danger.main)
                        .font(.caption)
                        .padding(.top, 5)
                }
            }
            .frame(maxWidth: 326)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.CardColor.main)
    }
}

struct DashboardCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCardComponent(homeVM: MockHomeViewModel())
    }
}
