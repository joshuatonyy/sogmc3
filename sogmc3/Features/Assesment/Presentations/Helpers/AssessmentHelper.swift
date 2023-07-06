//
//  Helper.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import Foundation
import SwiftUI


class AssessmentHelper {
    //MARK: Get the index of current item Sub Category
    func getIndex(item: String, category: EnumCategoryNames, in subCategoryData: [MockSubCategoryModel], isViewClickable: Bool) -> Int {
        for (index, subCategory) in subCategoryData.enumerated() {
            if item == subCategory.subCatName!.rawValue && subCategory.categoryName == category {
                return index
            }
        }
        return -1
    }
    
    //MARK: Get width of a text from CGSize
    func getWidth(_ subCategoryData: [MockSubCategoryModel]) -> [MockSubCategoryModel] {
        var modifiedSubCategoryData = subCategoryData
        
        for idx in (0..<subCategoryData.count) {
            let subCatName = subCategoryData[idx].subCatName!.rawValue
            
            //caption font size and converting to the CGSize
            let font = UIFont.systemFont(ofSize: 13)
            let attributes = [NSAttributedString.Key.font: font]
            let size = (subCatName as NSString).size(withAttributes: attributes)
            modifiedSubCategoryData[idx].sizeOfSubCatName = size.width
        }
        
        return modifiedSubCategoryData
        
    }
    
    
    //MARK: Get total rows for showing data in Tag View
    func getRows(category: EnumCategoryNames, subCategoryData: [MockSubCategoryModel], isViewClickable: Bool) -> [[String]] {
        
        var modifiedSubCategoryData: [MockSubCategoryModel] {
            if isViewClickable {
                return getWidth(subCategoryData)
            }
            else {
                //filter the choosen sub category by user
                return getWidth(subCategoryData).filter { subCategory in
                    subCategory.isChecked == true
                    
                }
            }
        }
        

        var rows: [[String]] = []
        var currentRow: [String] = []
        
        var totalWidth = 0.0
        let screenWidth = UIScreen.main.bounds.width - 10
        
        //add subCategory
        for subCat in modifiedSubCategoryData.filter({$0.categoryName!.rawValue == category.rawValue}) {
            totalWidth += (subCat.sizeOfSubCatName + 50)
            
            //masi ada space
            if screenWidth < totalWidth {
                totalWidth = (!currentRow.isEmpty ? (subCat.sizeOfSubCatName + 50) : 0)
                
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(subCat.subCatName!.rawValue)
            }
            else {
                currentRow.append(subCat.subCatName!.rawValue)
            }
        }
        
        //safety
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}

extension String {
    func stringToDouble() -> Double {
        return Double(self)!
    }
}

extension Double {
    func commaToDotAssessment() -> String {
        let nf = NumberFormatter()
        nf.decimalSeparator = ","
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "es_ES")
        
        return nf.string(from: self as NSNumber)!
    }
}
