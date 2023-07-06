//
//  Color+Theme.swift
//  sogmc3
//
//  Created by Dimas on 20/06/23.
//

import SwiftUI

extension Color {
    
    /// The primary color for the app
    struct Main {
        
        static let s10 = Color("main-10")
        static let s20 = Color("main-20")
        static let s30 = Color("main-30")
        static let s40 = Color("main-40")
        static let s50 = Color("main-50")
        static let s60 = Color("main-60")
        static let s70 = Color("main-70")
        static let s80 = Color("main-80")
        static let s90 = Color("main-90")
        static let s100 = Color("main-100")
        
        private init() {}
    }
    
    struct Neutral {
        
        /// Used in Neutral background and white text
        static let s10 = Color("neutral-10")
        
        /// Used in item background Hover and secondary background
        static let s20 = Color("neutral-20")
        
        // Used when an item background pressed
        static let s30 = Color("neutral-30")
        
        /// Used when an item background is selected
        static let s40 = Color("neutral-40")
        
        /// Used in borders and dividers
        static let s50 = Color("neutral-50")
        
        /// Used when a text is disabled
        static let s60 = Color("neutral-60")
        
        /// Used in placeholder text
        static let s70 = Color("neutral-70")
        
        /// Used in caption text and secondary text
        static let s80 = Color("neutral-80")
        
        /// Used in body text and inactive text
        static let s90 = Color("neutral-90")
        
        /// Used in headings and active text
        static let s100 = Color("neutral-100")
        
        private init() {}
    }
    
    struct Background {
        static let main = Color("background-main")
        
        private init() {}
    }
    
    struct CardColor {
        static let main = Color("cardColor-main")
       
        private init() {}
    }
    
    struct Semantic {
        
        struct Success {
            static let main = Color("success-main")
           
            private init() {}
        }
        
        struct Info {
            static let main = Color("info-main")
           
            private init() {}
        }
        
        struct Warning {
            static let main = Color("warning-main")
            
            private init() {}
        }
        
        struct Danger {
            static let main = Color("danger-main")
            static let fill = Color("danger-fill")
            
            private init() {}
        }
        
        private init() {}
    }
    
    struct CategoryColor {
        static let blue = Color("categoryColor-blue")
        static let green = Color("categoryColor-green")
        static let red = Color("categoryColor-red")
        
        static let assessmentOthers = Color("categoryColor-assessment-green")
        static let assessmentNeeds = Color("categoryColor-assessment-red")
        static let assessmentWants = Color("categoryColor-assessment-orange")
    
        private init() {}
    }
    
    struct ButtonColor {
        static let main = Color("button-main")
        static let unclicked = Color("button-unclicked")
        
        private init() {}
    }
    
    struct DividerColor {
        static let main = Color("divider-main")
        
        private init() {}
    }
}
