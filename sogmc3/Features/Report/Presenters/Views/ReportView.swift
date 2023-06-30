//
//  ReportView.swift
//  sogmc3
//
//  Created by Joshua on 29/06/23.
//

import SwiftUI

struct ReportView: View {
    @State private var datePickerOn: Bool = false
    @State private var selectedMenu = 1
    @StateObject var customDatePickerViewModel = DatePickerViewModel()
    @StateObject var categoryViewModel = CategoryViewModel()
    
    var body: some View {
        ZStack {
            Color.Background.main.ignoresSafeArea()
            VStack{
                Text("\(customDatePickerViewModel.month) \(String(customDatePickerViewModel.year))")
                    .h1()
                    .foregroundColor(Color.Neutral.s10)
                    .simultaneousGesture(TapGesture().onEnded{
                        self.datePickerOn = true
                    })
                HStack{
                    Text("Spending Report")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 15)
                    Spacer()
                }
                .foregroundColor(Color.Neutral.s10)
                .padding(.top)
                HStack(alignment: .center, spacing: 8) {
                    Text("Needs")
                        .font(.caption2)
                        .frame(height: 30)
                        .frame(maxWidth: 120)
                        .background(selectedMenu == 1 ? Color.CardColor.main : Color.Background.main)
                        .onTapGesture {
                            self.selectedMenu = 1
                        }
                        .cornerRadius(8)
                    Text("Wants")
                        .font(.caption2)
                        .frame(height: 30)
                        .frame(maxWidth: 120)
                        .background(selectedMenu == 2 ? Color.CardColor.main : Color.Background.main)
                        .onTapGesture {
                            self.selectedMenu = 2
                        }
                        .cornerRadius(8)
                    Text("Others")
                        .font(.caption2)
                        .frame(height: 30)
                        .frame(maxWidth: 120)
                        .background(selectedMenu == 3 ? Color.CardColor.main : Color.Background.main)
                        .onTapGesture {
                            self.selectedMenu = 3
                        }
                        .cornerRadius(8)
                }
                .foregroundColor(Color.Neutral.s10)
                .padding(8)
                .frame(height: 45)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .cornerRadius(8)
                if(selectedMenu == 1){
                    ReportCard(categoryViewModel: categoryViewModel, categoryName: CategoryName.needs)
                } else if(selectedMenu == 2){
                    ReportCard(categoryViewModel: categoryViewModel, categoryName: CategoryName.wants)
                } else {
                    ReportCard(categoryViewModel: categoryViewModel, categoryName: CategoryName.others)
                }
                Spacer()
            }
            .padding(.top)
            .blur(radius: datePickerOn == true ? 25 : 0)
            .onTapGesture{
                self.datePickerOn = false
            }
            
            CustomDatePicker(customDatePickerViewModel: customDatePickerViewModel)
                .padding(.bottom, 486)
                .padding(.horizontal, 75)
                .opacity(datePickerOn == true ? 1 : 0)
        
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
