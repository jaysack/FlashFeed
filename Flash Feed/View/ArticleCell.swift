//
//  ArticleCell.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleCategory: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    
    
    // MARK: - Variables
    static let identifier = "ArticleCell"
    
    var article: Article! {
        didSet {
            setTitle(self.article.title, to: articleTitle)
            setDateFromNowFormat(self.article.publishedAt, to: articleDate)
            setImage(from: self.article, to: articleImage)
        }
    }
    
    var category: String! {
        didSet {
            setCategory(self.category)
        }
    }
    

    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    // MARK: - Set Category
    fileprivate func setCategory(_ category: String) {

        // Set Label
        if category == "general" {
            articleCategory.text = "  TRENDING NOW  "
        } else {
            articleCategory.text = "  \(category.uppercased())  "
        }
        
        // Set Color
        switch category {
        case CATEGORY.GENERAL:
            articleCategory.textColor = CATEGORY.COLOR.GENERAL
            
        case CATEGORY.BUSINESS:
            articleCategory.textColor = CATEGORY.COLOR.BUSINESS
            
        case CATEGORY.ENTERTAINMENT:
            articleCategory.textColor = CATEGORY.COLOR.ENTERTAINMENT
            
        case CATEGORY.HEALTH:
            articleCategory.textColor = CATEGORY.COLOR.HEALTH
            
        case CATEGORY.SCIENCE:
            articleCategory.textColor = CATEGORY.COLOR.SCIENCE
            
        case CATEGORY.SPORTS:
            articleCategory.textColor = CATEGORY.COLOR.SPORTS
            
        case CATEGORY.TECH:
            articleCategory.textColor = CATEGORY.COLOR.TECH
            
        default:
            articleCategory.textColor = UIColor.lightGray
        }
    }
    
}
