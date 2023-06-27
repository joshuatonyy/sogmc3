//
//  SetReminderView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization(){
        let option: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: option) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "this is notif title"
        content.subtitle = "this is notif SUBTITLE"
        content.sound = .default
        content.badge = 1
        
        // trigger by calendar
        // MARK: variable for set reminder
        var dateComponents = DateComponents() // can be customized
        dateComponents.hour = 12
        dateComponents.minute = 57
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // MARK: push notification calendar-based trigger (date & time)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

struct SetTimeComponent: View {
    @Binding var notificationTime: Date
    
    var body: some View {
        DatePicker(
            "Set Notification Time",
            selection: $notificationTime,
            displayedComponents: [.hourAndMinute]
        )
        .datePickerStyle(.wheel)
        .labelsHidden()
        .padding()
        
    }
}


struct SetReminderView: View {
    @Binding var showNewScreen: Bool
    @State var notificationTime: Date = Date()

    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                
                Button {
                    showNewScreen = false
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                        Spacer()
                    }
                }
                
                Text("Set reminder")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color.Neutral.s10)
                    .padding()
                                
                Text("to remind you categorized your daily transaction")
                    .font(.caption)
                    .foregroundColor(Color.Neutral.s50)
                    .padding([.top, .leading], 5)
                
                Divider()
                    .frame(height: 2)
                    .overlay(Color.Neutral.s80)
                    .padding()
                
                Button("Change") {
                    NotificationManager.instance.requestAuthorization()
        //                SetTimeComponent(notificationTime: $notificationTime)

                }
                
                Button("Time trigger") {
                    NotificationManager.instance.scheduleNotification()
                }
                
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            // TODO: color apply guide doesnt exist
            .background(Color.Main.s70)
            
            .presentationDragIndicator(.visible)
//            .presentationDetents([.fraction(0.5), .large])

            .gesture(DragGesture().onEnded { value in
                if value.translation.height > 50 { // Adjust the threshold as needed
                    showNewScreen = false
                }
            })
            
            // TODO: move this, should be on input category card
            .onAppear{
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
    }
}
