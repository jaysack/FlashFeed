//
//  CategoriesVC.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    // MARK: - Variable(s)
    let categories = [
        "TOP STORIES",
        CATEGORY.BUSINESS,
        CATEGORY.ENTERTAINMENT,
        CATEGORY.HEALTH,
        CATEGORY.SCIENCE,
        CATEGORY.SPORTS,
        CATEGORY.TECH
    ]

    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Select first category
        categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
    }
}


// MARK: - Collection View Extension
extension CategoriesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.category = categories[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Add padding to number of characters
        let width = (categories[indexPath.row].count * 9) + 22
        return CGSize(width: width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get category
        let category = indexPath.row == 0 ? CATEGORY.GENERAL : categories[indexPath.row]
        
        // Send notification
        let userInfo: [String: String] = ["category": category]
        NotificationCenter.default.post(name: NOTIFICATION.CATEGORY, object: nil, userInfo: userInfo)
    }
    
}
