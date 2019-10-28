//
//  Article.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation

struct Article: Decodable {
    
    let source: Source
    let author: String?
    let title: String
    let descr: String?
    let url: String
    let image: String?
    let publishedAt: String
    let content: String?
}
