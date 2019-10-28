//
//  CategoriesVC.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    // MARK: - Variable(s)
    let categories = [
        CATEGORY.GENERAL,
        CATEGORY.BUSINESS,
        CATEGORY.ENTERTAINMENT,
        CATEGORY.HEALTH,
        CATEGORY.TECH,
        CATEGORY.SPORTS,
        CATEGORY.SCIENCE
    ]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - Collection View Extension
extension CategoriesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
