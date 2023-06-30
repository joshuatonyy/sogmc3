//
//  CategoryModel.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import Foundation
import SwiftUI

struct MockCategoryModel: Identifiable {
    var id = UUID()
    var name: EnumCategoryNames
    var description: String
    var percentage: Int
    
    init(name: EnumCategoryNames, description: String) {
        self.name = name
        self.description = description
        self.percentage = name.getPercentage()
    }
}

