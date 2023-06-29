//
//  CategoryViewModel.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import Foundation

class CategoryViewModel: ObservableObject, Identifiable {
    var categoryList = CategoryRepositorySample()
    
    var category: [CategoryModel] {
        var category1 = [] as [CategoryModel]
        for category in categoryList.categories {
            category1.append(category)
        }
        
        return category1
    }
    
}
