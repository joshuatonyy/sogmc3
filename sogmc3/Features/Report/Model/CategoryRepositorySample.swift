//
//  CategoryRepositorySample.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import Foundation

class CategoryRepositorySample {
    var categories: [CategoryModel] = []
    
    init() {
        let C1 = CategoryModel(categoryName: CategoryName.needs, categoryBudget: 2500000, categorySpend: 500000, categorySubCategoryDetail: [
            SubCategoryModel(subCategoryName: "Food and Beverage", subCategorySpend: 70000),
            SubCategoryModel(subCategoryName: "Transportation", subCategorySpend: 130000),
            SubCategoryModel(subCategoryName: "Electricity", subCategorySpend: 50000),
            SubCategoryModel(subCategoryName: "Internet", subCategorySpend: 150000),
            SubCategoryModel(subCategoryName: "Kost", subCategorySpend: 100000)])
        
        categories.append(C1)
    }
    
    func getCategories(index: Int) -> CategoryModel {
        return categories[index]
    }
}
