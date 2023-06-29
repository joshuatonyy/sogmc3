//
//  SubCategoryDetail.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import SwiftUI

struct SubCategoryDetail: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    var idx: Int
    var body: some View {
        ForEach(0..<categoryViewModel.category[idx].categorySubCategoryDetail.count){ idx1 in
            HStack{
                Text("\(categoryViewModel.category[idx].categorySubCategoryDetail[idx1].subCategoryName)")
                    .font(.system(size: 16))
                Spacer()
                Text("Rp\(categoryViewModel.category[idx].categorySubCategoryDetail[idx1].subCategorySpend.commaToDot())")
                    .font(.system(size: 16))
            }
            .padding(0)
            .foregroundColor(.white)
            .frame(width: 326, alignment: .top)
        }
    }
}

struct SubCategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryDetail(categoryViewModel: CategoryViewModel(), idx: 0)
    }
}
