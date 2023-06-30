//
//  inputCategoriesView.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 26/06/23.
//

import SwiftUI

struct inputCategoriesView: View {
    
    @State private var x: [CGFloat] = [0,0,0,0,0,0,0,0,0,0]
    @State private var degree: [Double] = [0,0,0,0,0,0,0,0,0,0]
    @State var currentIndex = 0
    @State var data: [MockTransaction] = MockTransaction.data
    @StateObject var dropdownViewModel = DropdownViewModel()
    
    var body: some View {
        ZStack{
            Color.Background.main.ignoresSafeArea()
            if data.isEmpty{
                NoTransactionView()
                Text("EMPTY")
            } else {
                Text("Swipe right card to save")
                    .font(.system(size: 15))
                    .foregroundColor(Color.Neutral.s20)
                    .offset(y: 250)
                ZStack {
                    ForEach(data.reversed()){i in
                        VStack {
                            inputCategoriesCardView(dropdownViewModel: dropdownViewModel, defaultData: i)
                                .offset(y: i.id - currentIndex <= 2 ? CGFloat(i.id - currentIndex) * 25 : 50)
                                .scaleEffect(x: 1 - CGFloat(i.id - currentIndex) * 0.1)
                                .padding(.bottom, 50)
                        }
                        .offset(x: self.x[i.id])
                        .rotationEffect(.init(degrees: self.degree[i.id]))
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                print("on change")
                                print(data.count)
                                if value.translation.width > 0{
                                    self.x[i.id] = value.translation.width
                                    self.degree[i.id] = 8
                                } else {
                                    self.x[i.id] = value.translation.width
                                    self.degree[i.id] = -8
                                }
                            })
                                .onEnded({ (value) in
                                    if value.translation.width > 0 {
                                        if value.translation.width > 100 && dropdownViewModel.dropdownSelected != nil {
                                            self.x[i.id] = 500
                                            self.degree[i.id] = 12
                                            currentIndex = i.id + 1
                                            
                                            //delete
                                            data.remove(at: 0)
                                        } else{
                                            self.x[i.id] = 0
                                            self.degree[i.id] = 0
                                        }
                                    }else{
                                        if value.translation.width < -100{
                                            self.x[i.id] = 0
                                            self.degree[i.id] = 0
                                        }
                                    }
                                }))
                    }
                }
            }
        }
    }
}



struct inputCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        inputCategoriesView()
    }
}

