//
//  AssessmentCategoryCard.swift
//  sogmc3
//
//  Created by ndyyy on 28/06/23.
//

import SwiftUI

struct AssessmentCategoryCard: View {
    var category: EnumCategoryNames
    var categoryDescription: String
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Category Name
            VStack {
                Text(category.rawValue)
                    .foregroundColor(Color.Neutral.s20)
                    .font(.title3)
                    .padding(.leading, 16)
            }
            .frame(width: 358, height: 41, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.CardColor.main)
            )
             
            VStack(alignment: .leading) {
                //MARK: Categories Description
                Text(categoryDescription)
                    .foregroundColor(Color.Neutral.s50)
                    .font(.caption)
                
                //MARK: List of SubCategories within Categories
                AssessmentSubCategoryListComponent(subCategoryVM: subCategoryVM,
                                                   category: category,
                                                   isViewClickable: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
        }
        .padding()
    }
}

struct AssessmentCategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentCategoryCard(category: .others,
                               categoryDescription: "The essential and fundamental requirements or obligations related to money management and financial stability.",
                               subCategoryVM: MockSubCategoryViewModel())
        .background(Color.Background.main)
    }
}
