//
//  ViewModel.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation

protocol ViewModelDelegate {
    func update()
    var preventFurtherRequests: Bool { get set }
}

class ViewModel {
    
    // MARK: - Services
    let NM = NetworkManager.shared
    
    
    // MARK: - Variables
    var delegate: ViewModelDelegate?
    var sources = [Source]()
    var categories = [String]()
    var articles = [Article]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.update()
            }
        }
    }
    

    // MARK: - Fetching Data Functions
    func loadSources(in language: String) {
        
        NM.fetchSources(in: language) { [weak self] (sources) in
            self?.sources = sources
            
            for source in sources {
                
                // Add category into array if needed
                if let category = source.category, !(self?.categories.contains(category))! {
                    self?.categories.append(category)
                }
            }
        }
    }
    
    func loadArticles(in country: String, for category: String? = nil) {
        NM.fetchArticles(in: country, for: category) { [weak self] (articles) in
            // Update container array
            guard let articles = articles else { return }
            self?.articles = articles
        }
    }
    
    func loadNextBatch(in country: String, of currentCategory: String, for pageNumber: Int) {
        NM.fetchArticles(in: country, for: currentCategory, page: pageNumber) { [weak self] (articles) in
            
            // Block further request if needed
            guard let articles = articles else {
                self?.delegate?.preventFurtherRequests = true
                return
            }
            
            // Block further requests if no more article available on server
            if articles.count < 20 {
                self?.delegate?.preventFurtherRequests = true
                print("Fetched last available article in category: \(currentCategory.capitalized)")
            }
            
            // Append to container array
            self?.articles += articles
        }
    }
    
    
    // MARK: - Utility Functions
    func getCategory(of article: Article) -> String {

        for source in sources where article.source.name == source.name {
            
            if let category = source.category {
                return category
            }
        }
        return "other"
    }
}
