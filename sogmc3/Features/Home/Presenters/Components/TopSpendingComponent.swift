//
//  TopSpendingComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct TopSpendingComponent: View {
    @ObservedObject var topSpendVM: TopSpendingViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Top Spending 💵")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            PickerTopSpendingComponent()
                .padding(.bottom, 10)
            
            Divider()
                .overlay(Color.Neutral.s90)
            
            ForEach(topSpendVM.topSpendingCategory) { subCategory in
                TopSpendingListCardComponent(subCategory: subCategory)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct TopSpendingComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopSpendingComponent(topSpendVM: TopSpendingViewModel())
            .background(Color.Background.main)
    }
}
