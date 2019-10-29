//
//  DetailVC.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var articleCollectionView: UICollectionView!
    
    
    // MARK: - Variables
    static let identifier = "DetailVC"
    var vm: ViewModel!
    var startIndex: Int!
    var sectionTitle: String!
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCustomCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setScrollPosition()
        setNavigationTitle(with: sectionTitle.capitalized)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    

    // MARK: - Functions
    fileprivate func registerCustomCell() {
        let articleCell = UINib(nibName: ArticleDetailCell.identifier, bundle: nil)
        articleCollectionView.register(articleCell, forCellWithReuseIdentifier: ArticleDetailCell.identifier)
    }
    
    fileprivate func setScrollPosition() {
        articleCollectionView.scrollToItem(at: IndexPath(item: startIndex, section: 0), at: .centeredHorizontally, animated: true)
        articleCollectionView.layoutSubviews()
    }
    
    // MARK: - IBActions

    
    
}


// MARK: - Collection View Extension
extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Config. cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleDetailCell.identifier, for: indexPath) as! ArticleDetailCell
        cell.article = vm.articles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.width
//        return CGSize(width: width, height: 600)
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

}
