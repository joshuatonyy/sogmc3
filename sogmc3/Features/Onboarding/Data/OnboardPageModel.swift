//
//  OnboardPageModel.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 26/06/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var slidingPage = Page(description: "Our Assessment will give you a clearer picture of your personality.", imageUrl: "Placeholder", tag: 0)
    
    static var slidingPages: [Page] = [
        Page(description: "Imagine if there was a tool that could revolutionize your financial life. Say hello to our app!", imageUrl: "Onboarding1", tag: 0),
        Page(description: "Get ready for improved focus, creativity, and a brighter financial future. Our app has it all.", imageUrl: "Onboarding2", tag: 1),
        Page(description: "Introducing our powerful budget tracking and recommendation tool. It's designed to empower you on your financial journey.", imageUrl: "Onboarding3", tag: 2),
        Page(description: "Discover the key to understanding your financial habits. Our app unlocks valuable insights to help you make informed decisions.", imageUrl: "Onboarding4", tag: 3),
        Page(description: "Unleash your financial potential and achieve lasting success. Join us on this transformative journey with our feature-rich app.", imageUrl: "Onboarding5", tag: 4),
    ]
}
