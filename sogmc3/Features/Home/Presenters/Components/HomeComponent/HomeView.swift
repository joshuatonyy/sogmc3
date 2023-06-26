//
//  HomeView.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

//MARK: DUMMY HOME VM
class MockHomeViewModel: ObservableObject {
    @Published var spend: Double = 203_000
    @Published var budget: Double = 400_000
    @Published var isNotificationExist = false
    @Published var spendRatio: Double = 0.0
}

//MARK: DUMMY TOP SPENDING VM & CLASS SUBCATEGORY
class MockSubCategoryModel: Identifiable {
    var subCatID = UUID()
    var subCatName: String = ""
    var subCatPercentage: Double = 0.0
    var subCatTotalPrice: Double = 0.0
    var categoryName: String = "Needs"
    var categoryColor: Color = Color.CategoryColor.blue
    
    init(subCatID: UUID = UUID(), subCatName: String, subCatPercentage: Double, subCatTotalPrice: Double, categoryName: String, categoryColor: Color) {
        self.subCatID = subCatID
        self.subCatName = subCatName
        self.subCatPercentage = subCatPercentage
        self.subCatTotalPrice = subCatTotalPrice
        self.categoryName = categoryName
        self.categoryColor = categoryColor
    }
}


class MockTopSpendingViewModel: ObservableObject {
    @Published var topSpendingCategory: [MockSubCategoryModel] = [
        MockSubCategoryModel(subCatName: "Saving", subCatPercentage: 12, subCatTotalPrice: 12_000, categoryName: "Others", categoryColor: Color.CategoryColor.green),
        MockSubCategoryModel(subCatName: "Shopping", subCatPercentage: 58, subCatTotalPrice: 400_000, categoryName: "Wants", categoryColor: Color.CategoryColor.red),
        MockSubCategoryModel(subCatName: "Membership", subCatPercentage: 82, subCatTotalPrice: 400_000, categoryName: "Wants", categoryColor: Color.CategoryColor.red),
        MockSubCategoryModel(subCatName: "Food and Beverage", subCatPercentage: 88, subCatTotalPrice: 123_000, categoryName: "Needs", categoryColor: Color.CategoryColor.blue)
    ]
    
    @Published var pickerrr: String = "Weekly"
    
    @Published var icons: [String: String] = [
        "Saving": "💸",
        "Name" : "👋",
        "Food and Beverage": "🍛",
        "Transportation": "🚗",
        "Utilities": "🔋",
        "Family": "👨‍👩‍👧‍👦",
        "Entertainment": "🎬",
        "Travel": "🛫",
        "Membership": "💳",
        "Shopping": "🛍️",
        "Transaction": "🔺",
        "Housing": "🏠",
        "Insurance": "🛡️",
        "Groceries": "🛒",
        "Internet": "🌐",
        "Education": "📚",
        "Personal Care": "🧴",
        "Basic Clothing": "👕",
        "Dining out": "🍽️",
        "Emergency Fund": "⚠️",
        "Special Event": "🎉",
        "Electronics": "💻",
        "Investment": "💰",
        "Home Decor and Furnishing": "🏞️"
    ]
    
}


struct HomeView: View {
    @StateObject var homeVM = MockHomeViewModel()
    @StateObject var topSpendVM = MockTopSpendingViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Hi, Jihan 👋")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                Spacer()
                
                //MARK: Profile and Receipt
                HStack {
                    //MARK: Profile
                    Button {
                        print("Show Notification Page")
                    }label: {
                        ZStack {
                            Image(systemName: "newspaper")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            if homeVM.isNotificationExist {
                                Color.red
                                    .frame(width: 10, height: 10)
                                    .clipShape(Circle())
                                    .offset(x: 12, y: -12)
                            }
                        }
                    }
                    .padding(.trailing, 20)
                    
                    //MARK: Notification
                    Button {
                        print("Show Profile Page")
//                        ProfileView()
                    }label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.bottom, 30)
                .foregroundColor(Color.Neutral.s50)
            }
            
            
            DashboardCardComponent(homeVM: homeVM)
                .frame(width: 358, height: homeVM.isNotificationExist ? 175 : 143)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TopSpendingComponent(topSpendVM: topSpendVM)
                .padding(.top, 30)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Background.main)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
