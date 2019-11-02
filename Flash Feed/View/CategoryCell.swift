//
//  CategoryCell.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var cellLip: UIView!
    
    // MARK: - Variable(s)
    static let identifier = "CategoryCell"
    var category: String! {
        didSet {
            categoryTitle.text = self.category.uppercased()
        }
    }
    
    override var isSelected: Bool {
        didSet {
    
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.setCellState()
            }
        }
    }
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setup UI
        setCellState()
        cellLip.backgroundColor = THEME.CURRENT.CATEGORY_LIP
    }
    
    
    // MARK: - Function(s)
    fileprivate func setCellState() {
        categoryTitle.textColor = isSelected ? THEME.CURRENT.CATEGORY_TITLE_SELECTED : THEME.CURRENT.CATEGORY_TITLE
        cellLip.alpha = isSelected ? 1 : 0.15
    }

}
