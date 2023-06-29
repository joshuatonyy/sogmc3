//
//  ProgressBarReport.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import SwiftUI

struct ProgressBarReport: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    @State var spendRatio: Double = 0
    var currentCategory: CategoryName
    
    var body: some View {
        
        ForEach(0..<categoryViewModel.category.count) { idx in
            if (currentCategory == categoryViewModel.category[idx].categoryName){
                VStack(alignment: .leading) {
                    //MARK: Progress Bar
                    GeometryReader {
                        let size = $0.size
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 326, height: 24)
                                .foregroundColor(Color.Neutral.s40)
                            
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: categoryViewModel.category[idx].categorySpend >= categoryViewModel.category[idx].categoryBudget ? size.width : (categoryViewModel.category[idx].categorySpend / categoryViewModel.category[idx].categoryBudget) * size.width, height: 24)
                                .foregroundColor(categoryViewModel.category[idx].categorySpend >= categoryViewModel.category[idx].categoryBudget ? Color.Semantic.Danger.main : Color.Main.s30)
                            
                            Text("\(Int(categoryViewModel.category[idx].categorySpend / categoryViewModel.category[idx].categoryBudget) * 100)%")
                                .font(.caption2)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 15)
                            }
                    }
                    //MARK: Remaining and Used Text
                    Text("Used \(Int(categoryViewModel.category[idx].categorySpend)) out of \(Int(categoryViewModel.category[idx].categoryBudget))")
                        .foregroundColor(Color.Neutral.s50)
                        .font(.caption)
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        spendRatio = categoryViewModel.category[idx].categorySpend / categoryViewModel.category[idx].categoryBudget
                    }
                }
                .onChange(of: spendRatio) { ratio in
                    withAnimation(.easeIn(duration: 1.3)) {
                        spendRatio = categoryViewModel.category[idx].categorySpend / categoryViewModel.category[idx].categoryBudget
                    }
                }
            }
        }
    }
}

struct ProgressBarReport_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarReport(categoryViewModel: CategoryViewModel(), currentCategory: CategoryName.needs)
    }
}
