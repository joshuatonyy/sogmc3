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

extension Double {
    func commaToDot() -> String {
        let nfEs = NumberFormatter()
        nfEs.numberStyle = .decimal
        nfEs.locale = Locale(identifier: "es_ES")
        
        return nfEs.string(from: self as NSNumber)!
    }
    
    func thousandToK() -> String {
        let num = abs(self)
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 0..<1000:
            return "\(sign)\(self.commaToDot())"
        case 1000..<1_000_000:
            let formatted = num / 1000
            return "\(sign)\(formatted.commaToDot())k"
        default:
            let formatted = num / 1_000_000
            return "\(sign)\(formatted.commaToDot())M"
        }
    }
}
