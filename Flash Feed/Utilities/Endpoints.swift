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
        static let DEFAULT = "\(ENDPOINT.SOURCE.BASE)?apiKey=\(API.KEY.NEWS)"
    }
    
    struct HEADLINES {
        static let BASE = "\(ENDPOINT.BASE)top-headlines"
        static let DEFAULT = "\(ENDPOINT.HEADLINES.BASE)?apiKey=\(API.KEY.NEWS)"
    }
    
}
