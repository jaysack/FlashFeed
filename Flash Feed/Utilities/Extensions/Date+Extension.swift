//
//  Date+Extension.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation


extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            let s = secondsAgo
            return "\(s) second\(s > 1 ? "s" : "") ago"
            
        } else if secondsAgo < hour {
            let m = secondsAgo / minute
            return "\(m) minute\(m > 1 ? "s" : "") ago"
            
        } else if secondsAgo < day {
            let h = secondsAgo / hour
            return "\(h) hour\(h > 1 ? "s" : "") ago"
            
        } else if secondsAgo < week {
            let d = secondsAgo / day
            return "\(d) day\(d > 1 ? "s" : "") ago"
            
        }
        let w = secondsAgo / week
        return "\(w) week\(w > 1 ? "s" : "") ago"
    }
}
