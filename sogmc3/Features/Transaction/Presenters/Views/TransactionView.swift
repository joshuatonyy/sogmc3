//
//  TransactionView.swift
//  sogmc3
//
//  Created by Joshua on 23/06/23.
//

import SwiftUI

struct TransactionView: View {
    @State private var dateNow = Date.now

    var body: some View {
        ZStack {
            Color.Background.main.ignoresSafeArea()
            VStack{
                Text("\(formattedDate(dateNow))")
                    .font(.system(size: 20))
                HStack{
                    Text("Transaction")
                        .font(.system(size: 32))
                        .padding(.leading, 15)
                    Spacer()
                }
                .padding(.top)
                ScrollView{
                    TransactionList()
                        .padding(.top)
                }
                
                Spacer()
            }
        }.foregroundColor(Color.white)
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
}

struct MonthYearPickerStyle: DatePickerStyle {
    @Binding var selectedDate: Date

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            DatePicker(
                "",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            Spacer()
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
