//
//  TimeComponent.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 27/06/23.
//

import SwiftUI

struct TimeComponent: View {
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TimeComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimeComponent()
    }
}
