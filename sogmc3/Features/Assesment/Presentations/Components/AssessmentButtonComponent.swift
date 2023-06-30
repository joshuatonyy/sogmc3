//
//  AssessmentButtonComponent.swift
//  sogmc3
//
//  Created by ndyyy on 28/06/23.
//

import SwiftUI

struct AssessmentButtonComponent: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.ButtonColor.main)
                .frame(width: 355, height: 50)
            Text(text)
                .foregroundColor(.white)
            
        }
    }
}

struct AssessmentButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentButtonComponent(text: "Next")
    }
}
