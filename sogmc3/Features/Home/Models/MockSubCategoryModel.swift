//
//  SubCategoryModel.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import Foundation
import SwiftUI

//MARK: DUMMY TOP SPENDING VM & CLASS SUBCATEGORY
struct MockSubCategoryModel: Identifiable {
    //basic needs
    var id: UUID = UUID()
//    var subCatID = UUID() //ERROR DISINI
    var subCatName: EnumSubCategoriesName? = nil
    var subCatPercentage: Double = 0.0
    var subCatTotalPrice: Double = 0.0
    var subCatIcon: String? = nil
    var categoryName: EnumCategoryNames? = nil
    var categoryColor: Color? = nil
    
    //calculation needs
    var sizeOfSubCatName: CGFloat = 0.0
    var isChecked: Bool = false
    
    init(subCatName: EnumSubCategoriesName, categoryName: EnumCategoryNames, subCatPercentage: Double = 0, subCatTotalPrice: Double = 0) {
        self.subCatName = subCatName
        self.subCatPercentage = subCatPercentage
        self.subCatTotalPrice = subCatTotalPrice
        self.subCatIcon = subCatName.getSubCatIcon()
        self.categoryName = categoryName
        self.categoryColor = categoryName.getColor()
    }
}
