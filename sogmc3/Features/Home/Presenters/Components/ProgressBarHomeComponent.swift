//
//  ProgressBarHomeComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct ProgressBarHomeComponent: View {
    @ObservedObject var homeVM: MockHomeViewModel
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            //MARK: Progress Bar
            GeometryReader {
                let size = $0.size
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 326, height: 24)
                        .foregroundColor(Color.Neutral.s40)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: homeVM.spend >= homeVM.budget ? size.width : homeVM.spendRatio * size.width, height: 24)
                        .foregroundColor(homeVM.spend >= homeVM.budget ? Color.Semantic.Danger.main : Color.Main.s30)
                    
                    Text("\(Int(homeVM.spend/homeVM.budget * 100))%")
                        .font(.caption2)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 15)
                }
            }
            
            //MARK: Remaining and Used Text
            Text("Used \(Int(homeVM.spend)) out of \(Int(homeVM.budget))")
                .foregroundColor(Color.Neutral.s50)
                .font(.caption)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1.3)) {
                homeVM.spendRatio = homeVM.spend/homeVM.budget
            }
        }
        .onChange(of: homeVM.spendRatio) { spendRatio in
            withAnimation(.easeIn(duration: 1.3)) {
                homeVM.spendRatio = homeVM.spend/homeVM.budget
            }
        }
    }
}


struct ProgressBarHomeComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarHomeComponent(homeVM: MockHomeViewModel())
    }
}
