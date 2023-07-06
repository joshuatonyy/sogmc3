//
//  DropdownViewModel.swift
//  sogmc3
//
//  Created by Joshua on 30/06/23.
//

import Foundation

class DropdownViewModel: ObservableObject {
    @Published var dropdownSelected: EnumSubCategoriesName?
    
    // for placeholder to drop-down menu "Default value"
    let placeholder: String = "Select your sub category"
    
    
    // use to show and hide dropdown (toggle)
    @Published var isOptionsPresented: Bool = false
    
}
