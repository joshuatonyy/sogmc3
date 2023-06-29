//
//  DatePickerViewModel.swift
//  sogmc3
//
//  Created by Joshua on 27/06/23.
//

import Foundation

class DatePickerViewModel: ObservableObject {
    @Published var year: Int
    @Published var month: String
    @Published var yearMonthFromPicker: String
//    @Published var yearMonthString: String
//    @Published var yearMonthDate: Date
    
    init(){
        year = DatePickerViewModel.getCurrentYear()
        month = DatePickerViewModel.getCurrentMonth()
        yearMonthFromPicker = "\(DatePickerViewModel.getCurrentMonth()) \(DatePickerViewModel.getCurrentYear())"
    }
    
    static func getCurrentMonth() -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDate)
        
        // You can format the month as per your requirements
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        let monthString = dateFormatter.monthSymbols[month - 1]
        
        return monthString
    }
    
    static func getCurrentYear() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        
        return year
    }
    
    static func combineMonthYear(year: Int, month: String) -> String {
        let year = year
        let month = month
        let yearMonth = "\(month) \(year)"
        
        return yearMonth
    }
    
    func formatStringToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        let date = dateFormatter.date(from: dateString)

        if let date = date {
            print(date)
            return date
        } else {
            print("Error formatting date")
            return Date()
        }
    }
}
