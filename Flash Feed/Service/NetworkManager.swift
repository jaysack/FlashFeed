//
//  NetworkManager.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Singleton Stack
    static let shared = NetworkManager()
    private init() {}
    
    
    // MARK: - Variable(s)
    let urlHeaders = ["X-Api-Key": API.KEY.NEWS]
    
    
    // MARK: - Fetch Sources
    func fetchSources(in country: String, completion: @escaping ([Source]) -> Void) {
        
        // Format URL
        guard let url = URL(string: "\(ENDPOINT.SOURCE.DEFAULT)&country=\(country)") else {
            print("JSError: Endpoint not valid")
            return
        }
        
        // Config. URL request
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 6.0)
        request.allHTTPHeaderFields = urlHeaders
        
        // Start URLSession
        URLSession.shared.dataTask(with: request, completionHandler: { (dat, _, err) in
            
            // Handle error(s)
            if let error = err {
                print("JSError: API request failed ~> \(error.localizedDescription)")
                return
            }
            
            // Unwrap Data
            guard let data = dat else { return }
            
            // Decode JSON
            do {
                let response = try JSONDecoder().decode(SourceResponse.self, from: data)
                completion(response.sources)
            } catch {
                print("JSError: Unable to decode data ~> \(error.localizedDescription)")
            }
        }).resume()
    }
    
    
    // MARK: - Fetch Articles
    func fetchArticles(in country: String, completion: @escaping ([Article]) -> Void) {
        
        // Format URL
        guard let url = URL(string: "\(ENDPOINT.HEADLINES.DEFAULT)&country=\(country)") else {
            print("JSError: Endpoint not valid")
            return
        }
        
        // Config. URL request
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 6.0)
        request.allHTTPHeaderFields = urlHeaders
        
        // Start URLSession
        URLSession.shared.dataTask(with: request, completionHandler: { (dat, _, err) in
            
            // Handle error(s)
            if let error = err {
                print("JSError: API request failed ~> \(error.localizedDescription)")
                return
            }
            
            // Unwrap Data
            guard let data = dat else { return }
            
            // Decode JSON
            do {
                let response = try JSONDecoder().decode(ArticleResponse.self, from: data)
                completion(response.articles)
            } catch {
                print("JSError: Unable to decode data ~> \(error.localizedDescription)")
            }
        }).resume()
    }
}
