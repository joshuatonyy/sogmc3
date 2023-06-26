//
//  HomeView.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

//MARK: DUMMY HOME VM
class HomeViewModel: ObservableObject {
    @Published var spend: Double = 12_000
    @Published var budget: Double = 400_000
}


//MARK: DUMMY TOP SPENDING VM & CLASS SUBCATEGORY

class SubCategory: Identifiable {
    var subCatID = UUID()
    var subCatName: String = ""
    var subCatImage: String = ""
    var subCatPercentage: Double = 0.0
    var subCatTotalPrice: Double = 0.0
    
    init(subCatID: UUID = UUID(), subCatName: String, subCatImage: String, subCatPercentage: Double, subCatTotalPrice: Double) {
        self.subCatID = subCatID
        self.subCatName = subCatName
        self.subCatImage = subCatImage
        self.subCatPercentage = subCatPercentage
        self.subCatTotalPrice = subCatTotalPrice
    }
    
}


class TopSpendingViewModel: ObservableObject {
    @Published var topSpendingCategory: [SubCategory] = [
        SubCategory(subCatName: "Food and Beverage", subCatImage: "belomada", subCatPercentage: 12, subCatTotalPrice: 12_000),
        SubCategory(subCatName: "Transportation", subCatImage: "belomada", subCatPercentage: 58, subCatTotalPrice: 400_000),
        SubCategory(subCatName: "Travel", subCatImage: "belomada", subCatPercentage: 82, subCatTotalPrice: 400_000),
        SubCategory(subCatName: "Groceries", subCatImage: "belomada", subCatPercentage: 88, subCatTotalPrice: 123_000)
    ]
    
    @State var pickerrr: String = "Weekly"
    
}


struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    @StateObject var topSpendVM = TopSpendingViewModel()
    
    @State var isNotificationExist = true
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Hi, Nama 👋")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                Spacer()
                
                HStack {
                    //MARK: Profile
                    Button {
                        print("Show Notification Page")
                    }label: {
                        ZStack {
                            Image(systemName: "newspaper")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            if isNotificationExist {
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
//                        print("Show Profile Page")
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
                .frame(width: 358, height: 143)
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
