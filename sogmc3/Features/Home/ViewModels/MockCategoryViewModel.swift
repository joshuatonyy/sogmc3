//
//  CategoryViewModel.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import Foundation

class MockCategoryViewModel: ObservableObject {
    @Published var categoryList: [MockCategoryModel] = [
        MockCategoryModel(name: .needs,
                          description: "The essential and fundamental requirements or obligations related to money management and financial stability."),
        MockCategoryModel(name: .wants,
                          description: "Non-essential desires or preferences related to money management and spending, beyond basic needs."),
        MockCategoryModel(name: .others,
                          description: "Additional or miscellaneous factors and considerations.")
    ]
}
