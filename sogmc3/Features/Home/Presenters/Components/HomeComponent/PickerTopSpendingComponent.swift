//
//  PickerTopSpendingComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct PickerTopSpendingComponent: View {
    @ObservedObject var topSpendVM: MockTopSpendingViewModel

    
    init(topSpendVM: ObservedObject<MockTopSpendingViewModel>) {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.CardColor.main)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.Background.main)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.Neutral.s10)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.Neutral.s70)], for: .normal)
        
        self._topSpendVM = topSpendVM
    }
    
    var body: some View {
        VStack {
            Picker("Top Spending Picker", selection: $topSpendVM.pickerrr) {
                Text("Weekly").tag("Weekly")
                Text("Monthly").tag("Monthly")
            }
            .pickerStyle(.segmented)
        }
    }
}

//struct PickerTopSpendingComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerTopSpendingComponent()
//    }
//}
