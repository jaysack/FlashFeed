//
//  Source.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation

struct Source: Decodable {
    
    let id: String
    let name: String
    let descr: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
}
