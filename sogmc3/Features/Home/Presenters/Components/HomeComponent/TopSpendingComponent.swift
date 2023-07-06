//
//  TopSpendingComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct TopSpendingComponent: View {
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Top Spending 💵")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            PickerTopSpendingComponent(subCategoryVM: _subCategoryVM)
                .padding(.bottom, 10)

            
            Divider()
                .overlay(Color.Neutral.s90)
            
            ScrollView {
                ForEach(subCategoryVM.subCategoryData, id: \.id) { subCategory in
                    TopSpendingListCardComponent(subCategory: subCategory)
                }
            }
            
        }
        .foregroundColor(.white)
    }
}

struct TopSpendingComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopSpendingComponent(subCategoryVM: MockSubCategoryViewModel())
            .background(Color.Background.main)
    }
}
