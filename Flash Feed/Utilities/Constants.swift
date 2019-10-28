//
//  Constants.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

// MARK: - Data
struct COUNTRY {
    
    static let USA = "us"
    static let FRANCE = "fr"
    static let MEXICO = "us"
    static let UNITED_KINGDOM = "us"
    static let GERMANY = "us"
    static let CANADA = "us"
    static let BELGIUM = "us"
    static let AUSTRALIA = "us"
    static let SWITZRELAND = "ch"
    static let NIGERIA = "ng"
}


struct LANGUAGE {
    static let ENGLISH = "en"
    static let FRENCH = "fr"
}


struct CATEGORY {
    
    static let GENERAL = "general"
    static let ENTERTAINMENT = "entertainment"
    static let BUSINESS = "business"
    static let HEALTH = "health"
    static let SCIENCE = "science"
    static let SPORTS = "sports"
    static let TECH = "technology"
    
    struct COLOR {
        
        static let GENERAL = UIColor(red: 9/255, green: 132/255, blue: 227/255, alpha: 1)
        static let ENTERTAINMENT = UIColor(red: 232/255, green: 67/255, blue: 147/255, alpha: 1)
        static let BUSINESS = UIColor(red: 0/255, green: 184/255, blue: 148/255, alpha: 1)
        static let HEALTH = UIColor(red: 108/255, green: 92/255, blue: 231/255, alpha: 1)
        static let SCIENCE = UIColor(red: 253/255, green: 203/255, blue: 110/255, alpha: 1)
        static let SPORTS = UIColor(red: 214/255, green: 48/255, blue: 49/255, alpha: 1)
        static let TECH = UIColor(red: 130/255, green: 88/255, blue: 159/255, alpha: 1)
        static let OTHER = UIColor(red: 99/255, green: 110/255, blue: 114/255, alpha: 1)
    }
}


struct NOTIFICATION {
    static let CATEGORY = Notification.Name("CategoryWasChanged")
}


struct CORNER {
    static let RADIUS: CGFloat = 5
}


struct SHADOW {
    static let OFFSET = CGSize(width: 0, height: 1.0)
    static let OPACITY: Float = 0.3
    static let RADIUS: CGFloat = 4
    static let COLOR = UIColor.black.cgColor
}


struct COLOR {
    static let PRIMARY = UIColor(red: 255/255, green: 107/255, blue: 107/255, alpha: 1)
    static let NEUTRAL = UIColor(red: 200/255, green: 214/255, blue: 229/255, alpha: 1)
    static let DARK = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
}


