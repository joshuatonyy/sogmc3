//
//  AssessmentLoadingView.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import SwiftUI


struct AssessmentLoadingView: View {
    @Binding var selectedMenu: Int
    
    var body: some View {
        VStack {
            VStack {
                LottieView(name: EnumLottie.loadingAnimation.rawValue,
                           loopMode: .loop)
            }
            .frame(maxWidth: 169, maxHeight: 169)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.Background.main)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                selectedMenu = 7
            }
        }
    }
}

struct AssessmentLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentLoadingView(selectedMenu: .constant(6))
    }
}
