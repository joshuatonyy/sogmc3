//
//  sogmc3App.swift
//  sogmc3
//
//  Created by Joshua on 18/06/23.
//

import SwiftUI

@main
struct sogmc3App: App {
    let context = CoreDataManager.instance.context
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context)
        }
    }
}
