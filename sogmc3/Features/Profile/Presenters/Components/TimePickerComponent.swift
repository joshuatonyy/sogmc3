//
//  TimePickerComponent.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 26/06/23.
//

import SwiftUI

struct TimePickerComponent: View {
    @Binding var notificationTime: Date
    @Binding var showTimePicker: Bool
    @State var notificatiomTimeTemp: Date = Date()
    
    init(notificationTime: Binding<Date>, showTimePicker: Binding<Bool>) {
        self._notificationTime = notificationTime
        self._showTimePicker = showTimePicker
        
//        print("init")
    }
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    notificationTime = UserDefaults.standard.object(forKey: "notificationTime") as! Date
                    showTimePicker = false
//                    print("on cancel: \(previousTime)")
                }){
                    Text("Cancel")
                }
                Spacer()
                
                Button(action: {
                    showTimePicker = false
                    // TODO: set selection time picker to setreminderview
                    UserDefaults.standard.set(notificationTime, forKey: "notificationTime")
                    print("userDefault saved with \(notificationTime)")

                }){
                    Text("Save")
                }
            }
            .padding()
            
            DatePicker(
                "Set Notification Time",
                selection: $notificationTime,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .padding()
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Neutral.s70)
        .gesture(DragGesture().onEnded { value in
                if value.translation.height > 50 { // Adjust the threshold as needed
                    showTimePicker = false
                }
            })
        
        .presentationDragIndicator(.visible)
        .presentationDetents([.fraction(0.5)])

    }
}

//struct TimePickerComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        TimePickerComponent()
//    }
//}
