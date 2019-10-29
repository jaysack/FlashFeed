//
//  Endpoints.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation

struct ENDPOINT {
    
    static let BASE = "https://newsapi.org/v2/"
    
    struct SOURCE {
        static let BASE = "\(ENDPOINT.BASE)sources"
    }
    
    struct HEADLINES {
        static let BASE = "\(ENDPOINT.BASE)top-headlines"
    }
    
}
