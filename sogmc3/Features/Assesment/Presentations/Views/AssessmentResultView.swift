//
//  AssesmentView.swift
//  sogmc3
//
//  Created by ndyyy on 27/06/23.
//

import SwiftUI

struct AssessmentResultView: View {
    @ObservedObject var assessmentVM: MockAssessmentViewModel
    @Binding var selectedMenu: Int

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Your Result")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.Neutral.s20)
                    .padding(.bottom, 32)
                
                
                HStack {
                    Text("Your Fixed Income")
                        .font(.body)
                        .bold()
                    
                    Spacer()
                    
                    Text("Rp \(assessmentVM.budget.stringToDouble().commaToDotAssessment())")
                    
                }
                .foregroundColor(.white)
                
                //MARK: Image
                Image("Budget Allocation")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 387, height: 312)
                
                Spacer()
                
                
                VStack {
                    Text("Expense Breakdown")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Divider()
                        .overlay(Color(uiColor: UIColor(#colorLiteral(red: 0.380392164, green: 0.380392164, blue: 0.380392164, alpha: 1))))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .frame(maxWidth: 361)
                .foregroundColor(.white)
                .padding(.bottom, 50)
                
                
                
                //MARK: Button
                Button {
                    //go to AssessmentSubCatView
                    selectedMenu = 1
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.ButtonColor.main)
                            .frame(width: 355, height: 50)
                        Text("\(Image(systemName: "arrowtriangle.right.fill")) Start Tracking")
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 71)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            
        }
        .padding()
        .background(Color.Background.main)
    }
}

struct AssessmentResultView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentResultView(assessmentVM: MockAssessmentViewModel(),
                             selectedMenu: .constant(5))
    }
}
