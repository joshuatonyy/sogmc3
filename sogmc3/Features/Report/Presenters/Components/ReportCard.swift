//
//  ReportCard.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import SwiftUI

struct ReportCard: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    var categoryName: CategoryName
    var body: some View {
        VStack (spacing: 16){
            VStack (alignment: .leading, spacing: 8){
                if(categoryName == CategoryName.needs){
                    Text("Needs")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                } else if(categoryName == CategoryName.wants){
                    Text("Wants")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                } else {
                    Text("Others")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                ProgressBarReport(categoryViewModel: CategoryViewModel(), currentCategory: categoryName)
                    .frame(maxWidth: 326, maxHeight: 55)
            }
            ForEach(0..<categoryViewModel.category.count){ idx in
                if(categoryViewModel.category[idx].categoryName == categoryName){
                    SubCategoryDetail(categoryViewModel: categoryViewModel, idx: idx)
                }
            }
        }
        .padding(16)
        .background(Color.CardColor.main)
        .cornerRadius(8)
    }
}

struct ReportCard_Previews: PreviewProvider {
    static var previews: some View {
        ReportCard(categoryViewModel: CategoryViewModel(), categoryName: CategoryName.needs)
    }
}
