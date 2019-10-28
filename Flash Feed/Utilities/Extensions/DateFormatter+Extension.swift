//
//  DateFormatter+Extension.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation


extension DateFormatter {
    
    func date(_ dateString: String) -> Date? {
        
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.timeZone = TimeZone(abbreviation: "UTC")
        self.locale = Locale(identifier: "en_US_POSIX")
        
        return self.date(from: dateString)
    }
}
