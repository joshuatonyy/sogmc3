//
//  ReminderModel.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 26/06/23.
//

import SwiftUI

struct ReminderModel: Hashable, Codable, Identifiable {
    let id: UUID
    var date: Date
    var isActive: Bool

    init(date: Date, isActive: Bool){
        self.id = UUID()
        self.date = date
        self.isActive = isActive
    }
    
    static var defaultReminder: [ReminderModel] {
        get{
            [
                ReminderModel(date: Date(), isActive: true)
            ]
        }
    }
}
