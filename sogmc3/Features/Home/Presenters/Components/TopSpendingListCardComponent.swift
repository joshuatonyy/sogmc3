//
//  SpendingListCardComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct TopSpendingListCardComponent: View {
    
    var subCategory: MockSubCategoryModel
    var icon: String
    
    var body: some View {
        HStack {
            //MARK: Category Image
            ZStack {
                subCategory.categoryColor
                
                Text(icon)
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            .padding(.trailing, 15)

            //MARK: Category Name & Price
            VStack(alignment: .leading) {
                Text(subCategory.subCatName)
                    .font(.body)
                Text("Rp \(String(format: "%.f", subCategory.subCatTotalPrice))")
                    .font(.footnote)
                    .bold()
            }
        
            Spacer()
            
            //MARK: Category Percentage
            Text("\(String(format: "%.f", subCategory.subCatPercentage))%")
                .font(.caption)
        }
        .padding(.bottom, 10)
    }
}

//struct TopSpendingListCardComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        TopSpendingListCardComponent(subCategory: MockSubCategoryModel(subCatName: "Food and Beverage", subCatPercentage: 12, subCatTotalPrice: 12_000), icon: "☺️", )
//    }
//}
