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
    
    func scheduleNotification(schedule: DateComponents) {
        let content = UNMutableNotificationContent()
        
        content.title = "TRADGET"
        content.subtitle = "Hey slacker, quickly categorize your transaction now! Where's your commitment?"
        content.sound = .default
        content.badge = 1
                
        let trigger = UNCalendarNotificationTrigger(dateMatching: schedule, repeats: true)
        
        // MARK: push notification calendar-based trigger (date & time)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

struct SetReminderView: View {
    @State private var notificationTime: Date
    @State var showTimePicker: Bool = false
    
    init() {
        let dateFromUserDefault: Date
        if let date = UserDefaults.standard.object(forKey: "notificationTime") as? Date {
            dateFromUserDefault = date
        } else {
            dateFromUserDefault = .init(timeIntervalSinceNow: 3600)
        }
        
        self._notificationTime = State(wrappedValue: dateFromUserDefault)
        print("userDefault read with \(notificationTime)")
        NotificationManager.instance.scheduleNotification(schedule: Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
)

    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Set reminder")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.Neutral.s10)
                .padding()
                            
            Text("to remind you categorized your daily transaction")
                .font(.caption)
                .foregroundColor(Color.Neutral.s50)
                .padding(.leading, 15)
            
            Divider()
                .frame(height: 2)
                .overlay(Color.Neutral.s80)
                .padding([.bottom, .leading, .trailing], 13)
            
            HStack{
                Text("\(formattedTime)")
                    .font(.system(.title))
                    .fontWeight(.bold)
                    .foregroundColor(Color.Neutral.s20)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    showTimePicker.toggle()
                }) {
                    Text("Change")
                        .padding(10)
                        .foregroundColor(Color.Neutral.s30)
                }
                .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.Button.main)
                )
                .padding()
        
            }
            
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Background.main)
        .presentationDragIndicator(.visible)
        
        // TODO: move this, should be on input category card
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
        
        .sheet(isPresented: $showTimePicker) {
            TimePickerComponent(notificationTime: $notificationTime, showTimePicker: $showTimePicker)
        }
        .onAppear {
            let dateFromUserDefault: Date
            if let date = UserDefaults.standard.object(forKey: "notificationTime") as? Date {
                dateFromUserDefault = date
            } else {
                dateFromUserDefault = .init(timeIntervalSinceNow: 3600)
            }
            notificationTime = dateFromUserDefault
            
            NotificationManager.instance.scheduleNotification(schedule: Calendar.current.dateComponents([.hour, .minute], from: notificationTime))

        }
    }
    
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: notificationTime)
    }

}
