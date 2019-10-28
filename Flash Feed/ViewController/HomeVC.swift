//
//  HomeVC.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var articlesTableView: UITableView!
    
    
    // MARK: - Variable(s)
    let vm = ViewModel()
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        registerCustomCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vm.delegate = self
    }

    
    // MARK: - Functions
    fileprivate func setupViewModel() {
        vm.loadSources(in: LANGUAGE.ENGLISH)
        vm.loadArticles(in: COUNTRY.USA)
    }
    
    fileprivate func registerCustomCells() {
        
        // Generate nib variables
        let articleCell = UINib(nibName: ArticleCell.identifier, bundle: nil)
        let bigArticleCell = UINib(nibName: BigArticleCell.identifier, bundle: nil)
        
        // Register cells
        articlesTableView.register(articleCell, forCellReuseIdentifier: ArticleCell.identifier)
        articlesTableView.register(bigArticleCell, forCellReuseIdentifier: BigArticleCell.identifier)
    }

}

// MARK: - View Model Extension
extension HomeVC: ViewModelDelegate {
    func update() {
        articlesTableView.reloadData()
    }
}


// MARK: - Table View Extension
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // If ViewModel not ready, return empty cell
        if vm.articles.isEmpty {
            return UITableViewCell()
        }
        
        // Get article
        let article = vm.articles[indexPath.row]
        
        // Config. cell
        if indexPath.row == 1 || indexPath.row % 6 == 0 && indexPath.row != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BigArticleCell.identifier, for: indexPath) as! BigArticleCell
            cell.article = article
            cell.category = vm.getCategory(of: article)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
            cell.article = article
            cell.category = vm.getCategory(of: article)
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 || indexPath.row % 6 == 0 && indexPath.row != 0 {
            return 380
        } else {
            return 227
        }
    }
    
}

