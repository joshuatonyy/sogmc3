//
//  HomeView.swift
//  sogmc3
//
//  Created by ndyyy on 22/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeVM: MockHomeViewModel
    @ObservedObject var subCategoryVM: MockSubCategoryViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: Home View with no Background
            VStack {
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
                            //show notification page
                            print("Show Notification Page")
                            
                            //make notification is off
                            homeVM.isNotificationExist = false
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
                
                TopSpendingComponent(subCategoryVM: subCategoryVM)
                    .padding(.top, 30)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Background.main)
        .onAppear {
            if homeVM.isNotificationExist {
                homeVM.isShowDimmedView = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeVM: MockHomeViewModel(), subCategoryVM: MockSubCategoryViewModel())
    }
}
