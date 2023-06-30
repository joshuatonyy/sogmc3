//
//  Enums.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import SwiftUI

//MARK: List of Lottie File
enum EnumLottie: String {
    case loadingAnimation = "Loading Animation"
}


//MARK: List of Category Name
enum EnumCategoryNames: String {
    case needs = "Needs"
    case wants = "Wants"
    case others = "Others"
}

//MARK: Extension of Category Names
extension EnumCategoryNames {
    //MARK: Function to get Color based on Category Names
    func getColor() -> Color {
        switch self {
        case .needs:
            return Color.CategoryColor.blue
        case .wants:
            return Color.CategoryColor.red
        case .others:
            return Color.CategoryColor.green
        }
    }
    //MARK: Function to get percentage based on Category Names
    func getPercentage() -> Int {
        switch self {
        case .needs:
            return 50
        case .wants:
            return 30
        case .others:
            return 20
        }
    }
}


//MARK: List of Sub Categories Name
enum EnumSubCategoriesName: String {
    //MARK: Needs Sub Category
    case foodAndBeverage = "Food and Beverage"
    case family = "Family"
    case transportation = "Transportation"
    case utilities = "Utilities"
    case housing = "Housing"
    case basicClothing = "Basic Clothing"
    case insurance = "Insurance"
    case groceries = "Groceries"
    case internet = "Internet"
    case education = "Education"
    
    //MARK: Wants Sub Category
    case entertainment = "Entertainment"
    case travel = "Travel"
    case membership = "Membership"
    case shopping = "Shopping"
    case diningOut = "Dining out"
    case personalCare = "Personal Care"
    case electronics = "Electronics"
    case homeDecorAndFurnishing = "Home Decor and Furnishing"
    
    //MARK: Others Sub Category
    case saving = "Saving"
    case emergencyFund = "Emergency Fund"
    case investment = "Investment"
    case specialEvent = "Special Event"
    
}

//MARK: Extension of Sub Categories
extension EnumSubCategoriesName {
    //MARK: Function to get the icon based on Sub Categories Name
    func getSubCatIcon() -> String {
        switch self {
        case .foodAndBeverage:
            return "🍛"
        case .family:
            return "👨‍👩‍👧‍👦"
        case .transportation:
            return "🚗"
        case .utilities:
            return "🔋"
        case .housing:
            return "🏠"
        case .basicClothing:
            return "👕"
        case .insurance:
            return "🛡️"
        case .groceries:
            return "🛒"
        case .internet:
            return "🌐"
        case .education:
            return "📚"
        case .entertainment:
            return "🎬"
        case .travel:
            return "🛫"
        case .membership:
            return "💳"
        case .shopping:
            return "🛍️"
        case .diningOut:
            return "🍽️"
        case .personalCare:
            return "🧴"
        case .electronics:
            return "💻"
        case .homeDecorAndFurnishing:
            return "🏞️"
        case .saving:
            return "💸"
        case .emergencyFund:
            return "⚠️"
        case .investment:
            return "💰"
        case .specialEvent:
            return "🎉"
        }
    }
}
