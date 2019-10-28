//
//  CacheManager.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation


final class CacheManager {
    
    // MARK: - Singleton Stack
    static let shared = CacheManager()
    private init() {}
    
    
    // MARK: - Variable
    private let cache = NSCache<NSString, NSData>()
    
    
    // MARK: - Retrieve
    func retrieve(image: String, completion: @escaping (Data?) -> Void) {
        
        // Check image availability
        if let data = cache.object(forKey: image as NSString) {
            completion(data as Data)
            return
        }
        
        // Fetch image if not in cache
        guard let url = URL(string: image) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                print("JSError: Unable to fetch image ~> \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = dat {
                
                // Save image in cache
                self.cache.setObject(data as NSData, forKey: image as NSString)
                
                // Pass thru completion
                DispatchQueue.main.async {
                    // Return on Main Thread
                    completion(data)
                }
            }
        }.resume()
    }
    
}
