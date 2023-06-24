//
//  TabBar2.swift
//  sogmc3
//
//  Created by Joshua on 23/06/23.
//

import SwiftUI

struct TabBar2: View {
    @State var selectedMenu = 0
    
    let iconsPlaceholder = ["house.fill", "dollarsign.arrow.circlepath", "chart.bar.xaxis"]
    let iconsname_placeholder = ["Dashboard", "Transaction", "Report"]
    
    var body: some View {
        VStack{
//            ZStack{
//                switch selectedMenu {
//                case 0:
//                    NavigationView {
//                        VStack {
//                            Text("1st") //change to home menu
//                        }
//                    }
//                case 1:
//                    NavigationView {
//                        VStack {
//                            Text("2nd") //change to transaction menu
//                        }
//                    }
//                case 2:
//                    NavigationView {
//                        VStack {
//                            Text("3rd") //change to input menu
//                        }
//                    }
//                default:
//                    NavigationView {
//                        VStack {
//                            Text("Default")
//                        }
//                    }
//                }
//            }
            
            Divider()

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
