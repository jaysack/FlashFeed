//
//  Article.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

struct Article: Decodable {
    
    // MARK: - Attributes
    let source: Source
    let author: String?
    let title: String
    let descr: String?
    let url: String
    let image: String?
    let publishedAt: String
    let content: String?
    
    
    // MARK: - Decodable Enum
    private enum CodingKeys: String, CodingKey {
        case image = "urlToImage"
        case source, author, title, descr, url, publishedAt, content
    }
    
    
    // MARK: - Fetch Image
    func getImage(completion: @escaping (UIImage?) -> Void) {
        
        guard let img = image else { return }
        
        CacheManager.shared.retrieve(image: img) { dat in
            
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
    }
}
