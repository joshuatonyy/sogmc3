//
//  SpendingListCardComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct TopSpendingListCardComponent: View {
    
    var subCategory: SubCategory
    
    var body: some View {
        HStack {
            //MARK: Category Image
            
            ZStack {
                Color.blue
                
                Text("🍛")
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            
//            Image("fnb")
////            Image(systemName: "photo.circle.fill")
//                .resizable()
//                .frame(width: 48, height: 48)
            
            
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
        .padding()
    }
}

struct TopSpendingListCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        TopSpendingListCardComponent(subCategory: SubCategory(subCatName: "Food and Beverage", subCatImage: "belomada", subCatPercentage: 12, subCatTotalPrice: 12_000))
    }
}
