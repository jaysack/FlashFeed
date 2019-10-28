//
//  ViewModel.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import Foundation

class ViewModel {
    
    // MARK: - Services
    let NM = NetworkManager.shared
    
    
    // MARK: - Variables
    var sources = [Source]()
    var articles = [Article]()
    

    // MARK: - Fetching Data Functions
    func loadSources(in country: String) {
        
        NM.fetchSources(in: country) { [weak self] (sources) in
            self?.sources = sources
            print(self?.sources)
        }
    }
    
    func loadArticles(in country: String) {
        NM.fetchArticles(in: country) { [weak self] (articles) in
            self?.articles = articles
            print(self?.articles)
        }
    }
}
