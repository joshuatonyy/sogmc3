//
//  AssessmentViewModel.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import Foundation
import SwiftUI

//MARK: ASSESSMENT View MODEL
class MockAssessmentViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var budget: String = "2500000"
    
    let categoryDatas: [(EnumCategoryNames, Color)] = [
        (.needs, Color.CategoryColor.assessmentNeeds),
        (.wants, Color.CategoryColor.assessmentWants),
        (.others, Color.CategoryColor.assessmentOthers)
    ]
}

