//
//  AssessmentExpenseBreakdownComponent.swift
//  sogmc3
//
//  Created by ndyyy on 01/07/23.
//

import SwiftUI

struct AssessmentExpenseBreakdownComponent: View {
    @ObservedObject var assessmentVM: MockAssessmentViewModel
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    var categoryName: EnumCategoryNames
    var categoryColor: Color
    
    var body: some View {
        
        VStack {
            //MARK: Choosen SubCategory with total Budgets
            HStack {
                //MARK: Category names
                HStack {
                    Rectangle()
                        .fill(categoryColor)
                        .frame(width: 20, height: 20)
                    Text(categoryName.rawValue)
                        .bold()
                }
                Spacer()
                
                //MARK: Total Budgets and
                Text("Rp\((assessmentVM.budget.stringToDouble() * (Double(categoryName.getPercentage())/100)).commaToDotAssessment())")
            }
            
            AssessmentSubCategoryListComponent(subCategoryVM: subCategoryVM,
                                               category: categoryName,
                                               isViewClickable: false)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
    }
}

struct AssessmentExpenseBreakdownComponent_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentExpenseBreakdownComponent(assessmentVM: MockAssessmentViewModel(),
                                            subCategoryVM: MockSubCategoryViewModel(),
                                            categoryName: .needs,
                                            categoryColor: Color.CategoryColor.assessmentNeeds)
    }
}
