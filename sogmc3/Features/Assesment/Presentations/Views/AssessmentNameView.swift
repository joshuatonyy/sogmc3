//
//  AssesmentNameView.swift
//  sogmc3
//
//  Created by ndyyy on 27/06/23.
//

import SwiftUI

struct AssessmentNameView: View {
    @ObservedObject var assessmentVM: MockAssessmentViewModel
    @Binding var selectedMenu: Int
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                //MARK: Information Name Text
                VStack(alignment: .leading) {
                    Text("Who should we call you?")
                        .foregroundColor(Color.Neutral.s10)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 8)
                    Text("This app is dedicated for your personal and for in-app communication.")
                        .font(.caption)
                        .foregroundColor(Color.Neutral.s50)
                }
                .padding(.horizontal, 24)
                
                //MARK: Name Text Field
                VStack(alignment: .leading) {
                    TextField("", text: $assessmentVM.name)
                        .foregroundColor(.white)
                        .autocorrectionDisabled()
                    
                    Divider()
                        .frame(width: 233, height: 1)
                        .background(Color.Neutral.s10)
                }
                .padding(24)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 154)
           
            Spacer()
            
            //MARK: Button
            Button {
                //go to AssessmentBudgetView
                selectedMenu = 4
            } label: {
                AssessmentButtonComponent(text: "Next")
            }
            .padding(.bottom, 71)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
//        .padding()
        .background(Color.Background.main)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AssessmentNameView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentNameView(assessmentVM: MockAssessmentViewModel(),
                           selectedMenu: .constant(3))
    }
}
