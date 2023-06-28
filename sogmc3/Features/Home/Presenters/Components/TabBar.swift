//
//  TabBar.swift
//  sogmc3
//
//  Created by Joshua on 19/06/23.
//

import SwiftUI

struct TabBar: View {
    @State var selectedMenu = 0
    
    let iconsPlaceholder = ["house",
                             "creditcard",
                             "plus",
                             "wallet.pass",
                             "person.crop.circle"]
    let iconsname_placeholder = ["Home", "Transaction", "Input", "Budget", "Profile"]
    
    var body: some View {
        VStack{
            ZStack{
                switch selectedMenu {
                case 0:
                    NavigationView {
//                        HomeView()
                        Text("Home view")
                    }
                case 1:
                    NavigationView {
                        VStack {
                            Text("2nd") //change to transaction menu
                        }
                    }
                case 2:
                    NavigationView {
                        VStack {
                            Text("3rd") //change to input menu
                        }
                    }
                case 3:
                    NavigationView {
                        VStack {
                            Text("4th") //change to history menu
                        }
                    }
                case 4:
                    NavigationView {
                        VStack {
                            Text("5th") //change to profile menu
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
            
            Divider()

            HStack{
                Spacer()
                ForEach(0..<5, id: \.self) { number in
                    Button(action: {
                        self.selectedMenu = number
                    }, label: {
                        if(number == 2){
                            VStack{
                                Image(systemName: iconsPlaceholder[number])
                                    .font(.system(size: 25,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.black))
                                    .frame(width: 56, height: 56)
                                    .background(Color.white)
                                    .cornerRadius(28.0)
                                    .padding(.bottom, 60)
                            }.padding(.bottom, 23)
                        }
                        else {
                            VStack{
                                Image(systemName: iconsPlaceholder[number])
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.lightGray))
                                Text(iconsname_placeholder[number])
                                    .font(.system(size: 10))
                                    .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.lightGray))
                            }
                            .padding(.bottom, 15)
                        }
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

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
