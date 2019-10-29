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
    var currentCategory: String = CATEGORY.GENERAL
    var currentPageNumber: Int = 1
    var lastTableViewIndex: Int = 0
    var fetchingMore: Bool = false
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        registerCustomCells()
        registerNotification()
        setNavigationTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vm.delegate = self
    }

    
    // MARK: - Functions
    fileprivate func setNavigationTitle() {
        self.navigationItem.title = "FlashFeed"
    }
    
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
    
    fileprivate func registerNotification() {
        
        NotificationCenter.default.addObserver(forName: NOTIFICATION.CATEGORY, object: nil, queue: .main) { [weak self] note in
            
            if let userInfo = note.userInfo as? [String: String] {
                
                // Reset number of pages to load (only if new categry selected)
                if self?.currentCategory != userInfo["category"] {
                    self?.currentPageNumber = 1
                    self?.lastTableViewIndex = 1
                }
                
                // Load specific category
                self?.currentCategory = userInfo["category"]!
                self?.vm.loadArticles(in: COUNTRY.USA, for: userInfo["category"])
                
            }
        }
    }
    
    fileprivate func beginBatchFetch() {
        fetchingMore = true
    }
    
    fileprivate func stopBatchFetch() {
        fetchingMore = false
    }
    
    fileprivate func presentDetailVC(from startIndex: Int) {
        
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailVC.identifier) as? DetailVC {
            
            if let navigator = navigationController {
                
                detailVC.vm = self.vm
                detailVC.startIndex = startIndex
                
                navigator.pushViewController(detailVC, animated: true)
            }
        }
    }

}


// MARK: - View Model Extension
extension HomeVC: ViewModelDelegate {
    func update() {
        articlesTableView.reloadData()
        
        if currentPageNumber > 1 {
            articlesTableView.scrollToRow(at: IndexPath(row: lastTableViewIndex, section: 0), at: .bottom, animated: false)
        } else {
            articlesTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}


// MARK: - Table View Extension
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // If ViewModel not ready, return empty cell
        if vm.articles.isEmpty {
            return UITableViewCell()
        }
        
        // Prepare next batch
        if indexPath.row == (vm.articles.count - 1) {
            lastTableViewIndex = indexPath.row
        }
        
        // Get article
        let article = vm.articles[indexPath.row]
        
        // Config. cell
        if (indexPath.row == 1 || indexPath.row % 6 == 0 && indexPath.row != 0) && currentCategory == CATEGORY.GENERAL {
            let cell = tableView.dequeueReusableCell(withIdentifier: BigArticleCell.identifier, for: indexPath) as! BigArticleCell
            cell.article = article
            cell.category = vm.getCategory(of: article)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
            cell.article = article
            
            if currentCategory == CATEGORY.GENERAL {
                cell.category = vm.getCategory(of: article)
            } else {
                cell.category = currentCategory
            }
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Deselect cell
        tableView.deselectRow(at: IndexPath(row: indexPath.row, section: 0), animated: true)
        
        // Present Article
        presentDetailVC(from: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            
            if !fetchingMore {
                
                // Allow API requests
                beginBatchFetch()
                
                // Load next batch
                currentPageNumber += 1
                vm.loadNextBatch(in: COUNTRY.USA, of: currentCategory, for: currentPageNumber)

                // Stop further requests
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    self?.stopBatchFetch()
                }
            }
        }
    }
    
}

