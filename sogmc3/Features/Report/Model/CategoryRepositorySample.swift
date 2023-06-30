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
        let C2 = CategoryModel(categoryName: CategoryName.wants, categoryBudget: 2000000, categorySpend: 1000000, categorySubCategoryDetail: [
                SubCategoryModel(subCategoryName: "Music", subCategorySpend: 50000),
                SubCategoryModel(subCategoryName: "Gaming", subCategorySpend: 150000),
                SubCategoryModel(subCategoryName: "Shopping", subCategorySpend: 800000)])
        let C3 = CategoryModel(categoryName: CategoryName.others, categoryBudget: 300000, categorySpend: 100000, categorySubCategoryDetail: [
            SubCategoryModel(subCategoryName: "Rokok", subCategorySpend: 50000),
            SubCategoryModel(subCategoryName: "Buku", subCategorySpend: 50000)])
        
        categories.append(C1)
        categories.append(C2)
        categories.append(C3)
    }
    
    func getCategories(index: Int) -> CategoryModel {
        return categories[index]
    }
}
