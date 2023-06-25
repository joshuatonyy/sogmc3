//
//  PickerTopSpendingComponent.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct PickerTopSpendingComponent: View {
    
    @State var pickerr = "Weekly"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.CardColor.main)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.Background.main)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.Neutral.s10)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.Neutral.s70)], for: .normal)
        
    }
    
    var body: some View {
        VStack {
            Picker("Top Spending Picker", selection: $pickerr) {
                Text("Weekly").tag("Weekly")
                Text("Monthly").tag("Monthly")
            }
            .pickerStyle(.segmented)
        }
    }
}

struct PickerTopSpendingComponent_Previews: PreviewProvider {
    static var previews: some View {
        PickerTopSpendingComponent()
    }
}
