//
//  CategoryModel.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import Foundation

struct CategoryModel {
    var categoryName: CategoryName
    var categoryBudget: Double
    var categorySpend: Double
    var categorySubCategoryDetail: [SubCategoryModel]
}
