//
//  AssessmentSubCategoryListComponent.swift
//  sogmc3
//
//  Created by ndyyy on 28/06/23.
//

import SwiftUI

struct AssessmentSubCategoryListComponent: View {
    
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    var category: EnumCategoryNames

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(AssessmentHelper().getRows(category: category, subCategoryData: subCategoryVM.subCategoryData), id: \.self) { columns in
                HStack(spacing: 8) {
                    ForEach(columns, id: \.self) { item in
                        var index = AssessmentHelper().getIndex(item: item, category: category, in: subCategoryVM.subCategoryData)
                        if index != -1 {
                            HStack(spacing: 2) {
                                Text(subCategoryVM.subCategoryData[index].subCatIcon!)
                                    .font(.footnote)
                                Text(subCategoryVM.subCategoryData[index].subCatName!.rawValue)
                                    .font(.footnote)
                                    .foregroundColor(Color.Neutral.s10)
                                    .lineLimit(1)
                            }
                            .font(.system(size: 13))
                            .padding(8)
                            .background(
                                Capsule()
                                    .fill(subCategoryVM.subCategoryData[index].isChecked ?
                                        Color.Main.s40 :
                                        Color.ButtonColor.unclicked.opacity(0.65))
                            )
                            .onTapGesture {
                                //MARK: to change the status
                                let subCategoryIndex = subCategoryVM.subCategoryData.firstIndex(where: {$0.subCatName!.rawValue == item})! as Int
                                index = subCategoryIndex
                                subCategoryVM.subCategoryData[subCategoryIndex].isChecked.toggle()
                            }
                        }
                    }
                }
            }
        }
//        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct AssessmentSubCategoryListComponent_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentSubCategoryListComponent(subCategoryVM: MockSubCategoryViewModel(),
                                           category: .needs)
    }
}
