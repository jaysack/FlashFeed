//
//  Decodable.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation


struct SourceResponse: Decodable {
    
    let status: String
    let sources: [Source]
}


struct ArticleResponse: Decodable {
    
    let status: String
    let totalResults: Int
    let articles: [Article]
}
