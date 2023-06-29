//
//  TabBar2.swift
//  sogmc3
//
//  Created by Joshua on 23/06/23.
//

import SwiftUI

struct TabBar2: View {
    @State var selectedMenu = 0
    
    let iconsPlaceholder = ["house.fill", "arrow.left.arrow.right", "chart.bar.xaxis"]
    let iconsname_placeholder = ["Dashboard", "Transaction", "Report"]
    @StateObject var homeVM = MockHomeViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                switch selectedMenu {
                case 0:
                    NavigationStack {
                        ZStack {
                            HomeView(homeVM: homeVM)
                            
                            if homeVM.isShowDimmedView {
                                //MARK: Dimmed View
                               DimmedViewComponent(homeVM: homeVM)
                                
                                //MARK: Showing Information
                                WarningInformationComponent()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            }
                        }
                    }
                case 1:
                    NavigationView {
                       TransactionView()
                    }
                case 2:
                    NavigationView {
                        VStack {
                            Text("3rd") //change to input menu
                        }
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("Default")
                        }
                    }
                }
            }
            
            //            Divider()
            
            HStack{
                
                ForEach(0..<3, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedMenu = number
                    }, label: {
                        VStack{
                            Image(systemName: iconsPlaceholder[number])
                                .resizable()
                                .frame(width: 24, height: 21)
                                .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.lightGray))
                            Text(iconsname_placeholder[number])
                                .font(.system(size: 10))
                                .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.lightGray))
                        }
                        .padding(.bottom, 15)
                    })
                    Spacer()
                }
            }
            .frame(height: CGFloat(83))
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .ignoresSafeArea()
        }
    }
}

struct TabBar2_Previews: PreviewProvider {
    static var previews: some View {
        TabBar2()
    }
}
