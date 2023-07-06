//
//  SubCategoryViewModel.swift
//  sogmc3
//
//  Created by ndyyy on 30/06/23.
//

import Foundation

//MARK: DUMMY TOP SPENDING VIEW MODEL
class MockSubCategoryViewModel: ObservableObject {
    @Published var subCategoryData: [MockSubCategoryModel] = [
        MockSubCategoryModel(subCatName: .foodAndBeverage, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .transportation, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .groceries, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .utilities, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .housing, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .basicClothing, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .insurance, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .internet, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .education, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .family, categoryName: .needs, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .entertainment, categoryName: .wants, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .travel, categoryName: .wants, subCatPercentage: 31, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .membership, categoryName: .wants, subCatPercentage: 31, subCatTotalPrice: 970_000),
        MockSubCategoryModel(subCatName: .shopping, categoryName: .wants, subCatPercentage: 21, subCatTotalPrice: 1_200_000),
        MockSubCategoryModel(subCatName: .diningOut, categoryName: .wants, subCatPercentage: 82, subCatTotalPrice: 1_970_000),
        MockSubCategoryModel(subCatName: .personalCare, categoryName: .wants, subCatPercentage: 82, subCatTotalPrice: 400_000),
        MockSubCategoryModel(subCatName: .electronics, categoryName: .wants, subCatPercentage: 82, subCatTotalPrice: 400_000),
        MockSubCategoryModel(subCatName: .homeDecorAndFurnishing, categoryName: .wants, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .saving, categoryName: .others, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .emergencyFund, categoryName: .others, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .investment, categoryName: .others, subCatPercentage: 0, subCatTotalPrice: 0),
        MockSubCategoryModel(subCatName: .specialEvent, categoryName: .others, subCatPercentage: 0, subCatTotalPrice: 0),
    ]
    
    @Published var pickerrr: String = "Weekly"
    
}
