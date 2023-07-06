//
//  DropDownMenuOption.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import Foundation

struct DropDownMenuOption: Identifiable, Hashable{
    let id = UUID().uuidString
    let option: String
    let icon: String
}

extension DropDownMenuOption{
    static let dropDownDefault: DropDownMenuOption = DropDownMenuOption(option: "default", icon: "🚗")
    static let dropDownList: [DropDownMenuOption] = [
        DropDownMenuOption(option: "Food & Beverage", icon: "🍛"),
        DropDownMenuOption(option: "Transport", icon: "🚗"),
        DropDownMenuOption(option: "Internet", icon: "🌐"),
        DropDownMenuOption(option: "Housing", icon: "🏠")
    ]
}
