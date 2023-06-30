//
//  AssessmentSubCatView.swift
//  sogmc3
//
//  Created by ndyyy on 27/06/23.
//

import SwiftUI

struct AssessmentSubCatView: View {
    
    @ObservedObject var assessmentVM: MockAssessmentViewModel
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    @ObservedObject var categoryVM: MockCategoryViewModel
    
    @Binding var selectedMenu: Int
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Choose relevant subcategory")
                    .font(.title)
                    .foregroundColor(Color.Neutral.s20)
                    .bold()
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                ForEach(categoryVM.categoryList) { category in
                    AssessmentCategoryCard(category: category.name,
                                           categoryDescription: category.description,
                                           subCategoryVM: subCategoryVM)
                    
                }
                
                Spacer()
                
                //MARK: Button
                Button {
                    //go to AssessmentSubCatView
                    selectedMenu = 6
                } label: {
                    AssessmentButtonComponent(text: "Next")
                }
                .padding(.bottom, 71)
            }
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .background(Color.Background.main)
    }
}

struct AssessmentSubCatView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentSubCatView(assessmentVM: MockAssessmentViewModel(),
                             subCategoryVM: MockSubCategoryViewModel(),
                             categoryVM: MockCategoryViewModel(),
                             selectedMenu: .constant(5))
    }
}
