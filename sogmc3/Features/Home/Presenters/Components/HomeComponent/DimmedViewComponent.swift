//
//  DimmedViewComponent.swift
//  sogmc3
//
//  Created by ndyyy on 27/06/23.
//

import SwiftUI

struct DimmedViewComponent: View {
    @ObservedObject var homeVM: MockHomeViewModel
    var body: some View {
        VStack {}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
            .onTapGesture {
                homeVM.isShowDimmedView = false
            }
    }
}
