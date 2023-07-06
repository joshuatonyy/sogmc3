//
//  AssessmentBudgetView.swift
//  sogmc3
//
//  Created by ndyyy on 27/06/23.
//

import SwiftUI

struct AssessmentBudgetView: View {
    @ObservedObject var assessmentVM: MockAssessmentViewModel
    @Binding var selectedMenu: Int
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                //MARK: Information Name Text
                VStack(alignment: .leading) {
                    Text("How much do you earn in a month?")
                        .foregroundColor(Color.Neutral.s10)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 8)
                    Text("Enabling the app to provide personalized financial tracking and budgeting recommendations.")
                        .font(.caption)
                        .foregroundColor(Color.Neutral.s50)
                }
                .padding(.horizontal, 24)
                
                //MARK: Name Text Field
                HStack(spacing: 5) {
                    Text("Rp")
                    VStack(alignment: .leading) {
                        TextField("", text: $assessmentVM.budget)
                            .keyboardType(.decimalPad)
                            .padding(.top, 10)
                        
                        Divider()
                            .frame(width: 233, height: 1)
                            .background(Color.Neutral.s10)
                    }
                }
                .foregroundColor(.white)
                .padding(24)
                
            }
            .padding(.top, 154)
           
            Spacer()
            
            //MARK: Button
            Button {
                //go to AssessmentSubCatView
                selectedMenu = 5
            } label: {
                AssessmentButtonComponent(text: "Next")
            }
            .padding(.bottom, 71)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.Background.main)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AssessmentBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentBudgetView(assessmentVM: MockAssessmentViewModel(),
                             selectedMenu: .constant(4))
    }
}
