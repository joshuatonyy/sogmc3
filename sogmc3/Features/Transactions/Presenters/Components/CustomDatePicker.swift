//
//  CustomDatePicker.swift
//  sogmc3
//
//  Created by Joshua on 26/06/23.
//

import SwiftUI

struct CustomDatePicker: View {
    @State var selectedYear: Int = 0
    @State var selectedMonth: String = ""
    @State var isPressed: Bool = false
    
    @ObservedObject var customDatePickerViewModel: DatePickerViewModel
    
    var i: Int = 2015
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var body: some View {
            VStack(alignment: .leading, spacing: 16){
                
                //Datepicker Header
                HStack(alignment: .center) {
                    Button{
                        
                    } label: {
                        Text("2015-2023")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.Neutral.s90)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Button{
                            //Function buat back ke range tahun sebelumnya
                        } label: {
                            Image(systemName: "chevron.left")
                                .frame(width: 24, height: 24)
                        }
                        Button{
                            //Function buat maju ke range tahun selanjutnya
                        } label: {
                            Image(systemName: "chevron.right")
                                .frame(width: 24, height: 24)
                        }
                    }.padding(0)
                        .foregroundColor(Color.Neutral.s50)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .center)
                
                //Datepicker Body
                VStack(alignment: .center, spacing: 8) {
                    ForEach((1...3), id: \.self) { counter1 in
                        HStack(alignment: .center, spacing: 8){
                            if(counter1 == 1){
                                Button(action: {
                                    self.selectedYear = i + 0
                                    self.isPressed = false
                                    customDatePickerViewModel.year = self.selectedYear
                                    print(customDatePickerViewModel.year)
                                }, label: {
                                    Text(String(i + 0))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 0 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 0 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                Button(action: {
                                    self.selectedYear = i + 1
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 1))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 1 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 1 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                Button(action: {
                                    self.selectedYear = i + 2
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 2))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 2 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 2 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                            }
                            else if(counter1 == 2){
                                Button(action: {
                                    self.selectedYear = i + 3 + 0
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 3 + 0))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 3 + 0 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 3 + 0 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                Button(action: {
                                    self.selectedYear = i + 3 + 1
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 3 + 1))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 3 + 1 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 3 + 1 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                Button(action: {
                                    self.selectedYear = i + 3 + 2
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 3 + 2))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 3 + 2 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 3 + 2 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                            }
                            else {
                                Button(action: {
                                    self.selectedYear = i + 6 + 0
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 6 + 0))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 6 + 0 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 6 + 0 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                Button(action: {
                                    self.selectedYear = i + 6 + 1
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 6 + 1))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 6 + 1 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 6 + 1 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                Button(action: {
                                    self.selectedYear = i + 6 + 2
                                    customDatePickerViewModel.year = self.selectedYear
                                    self.isPressed = false
                                }, label: {
                                    Text(String(i + 6 + 2))
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 64, height: 32)
                                        .foregroundColor(selectedYear == i + 6 + 2 ? .white : Color.Neutral.s80)
                                        .background(selectedYear == i + 6 + 2 ? Color.Semantic.Info.main : .clear)
                                        .cornerRadius(50)
                                })
                                
                            }
                            
                        }
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .top)
                }
            } //Year picker
            .padding(16)
            .frame(width: 240, alignment: .topLeading)
            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 1)
            )
            
            VStack(alignment: .leading, spacing: 16){

                //Datepicker Header
                HStack(alignment: .center) {
                    Button(action:{
                        self.isPressed = true
                    }, label: {
                        Text(String(selectedYear))
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.Neutral.s90)
                    })

                    Spacer()

                    HStack{
                        Button{
                            //Function buat back ke range tahun sebelumnya
                        } label: {
                            Image(systemName: "chevron.left")
                                .frame(width: 24, height: 24)
                        }
                        Button{
                            //Function buat maju ke range tahun selanjutnya
                        } label: {
                            Image(systemName: "chevron.right")
                                .frame(width: 24, height: 24)
                        }
                    }.padding(0)
                        .foregroundColor(Color.Neutral.s50)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .center)

                //Datepicker Body
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(months, id: \.self){ month in
                        HStack{
                            Text(month)
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity)
                                .frame(width: 64, height: 32)
                                .foregroundColor(selectedMonth == month ? .white : Color.Neutral.s80)
                                .background(selectedMonth == month ? Color.Semantic.Info.main : .clear)
                                .cornerRadius(50)
                                .onTapGesture{
                                    self.selectedMonth = month
                                    customDatePickerViewModel.month = self.selectedMonth
                                }
                        }
                    }
                }
            } //Month picker
            .padding(16)
            .frame(width: 240, alignment: .topLeading)
            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 1)
            )
            .opacity(selectedYear == 0 || isPressed == true ? 0 : 1)
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker(customDatePickerViewModel: DatePickerViewModel())
    }
}
