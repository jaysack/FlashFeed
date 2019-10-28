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
}

class ViewModel {
    
    // MARK: - Services
    let NM = NetworkManager.shared
    
    
    // MARK: - Variables
    var delegate: ViewModelDelegate?
    var sources = [Source]()
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
        }
    }
    
    func loadArticles(in country: String) {
        NM.fetchArticles(in: country) { [weak self] (articles) in
            self?.articles = articles
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
