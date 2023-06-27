//
//  TimePickerComponent.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 26/06/23.
//

import SwiftUI

struct TimePickerComponent: View {
   @State var notificationTime: Date = Date()
    
    var body: some View {
        VStack {
            DatePicker(
                "Set Notification Time",
                selection: $notificationTime,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .padding()
            
//            Button(action: scheduleNotification) {
//                Text("Schedule Notification")
//                    .font(.headline)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .cornerRadius(8)
//            }
        }
        .padding()
    }
    
    func scheduleNotification() {
        // Create a notification content
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "This is a sample notification"
        
        // Configure the notification trigger
        let components = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        // Create a notification request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Schedule the notification
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled for: \(self.notificationTime)")
            }
        }
    }
}

struct TimePickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerComponent()
    }
}
