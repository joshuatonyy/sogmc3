//
//  TopSpendingComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct TopSpendingComponent: View {
    @ObservedObject var topSpendVM: MockTopSpendingViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Top Spending 💵")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            PickerTopSpendingComponent(topSpendVM: _topSpendVM)
                .padding(.bottom, 10)
            
            Divider()
                .overlay(Color.Neutral.s90)
            
            ScrollView {
                ForEach(topSpendVM.topSpendingCategory) { subCategory in
                    TopSpendingListCardComponent(subCategory: subCategory, icon: topSpendVM.icons[subCategory.subCatName]!)
                }
            }
            
        }
        .foregroundColor(.white)
    }
}

struct TopSpendingComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopSpendingComponent(topSpendVM: MockTopSpendingViewModel())
            .background(Color.Background.main)
    }
}
