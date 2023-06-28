//
//  WarningInformationComponent.swift
//  sogmc3
//
//  Created by ndyyy on 27/06/23.
//

import SwiftUI

struct WarningInformationComponent: View {
    var body: some View {
        VStack {
            VStack {
                Image("WarningArrow")
                    .offset(x: 60)
                    .padding(.bottom, -15)
                
                //MARK: Text Information
                VStack() {
                    Text("There are transactions that you need to review")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(16)
                }
                .frame(width: 304, height: 84, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(cgColor: #colorLiteral(red: 0.1091305837, green: 0.0192335397, blue: 0.04307378083, alpha: 1)))
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.Semantic.Danger.main, lineWidth: 1)
                        }
                }
            }
            .offset(x: 0, y: 30)
            
        }
    }
}

struct WarningInformationComponent_Previews: PreviewProvider {
    static var previews: some View {
        WarningInformationComponent()
    }
}
