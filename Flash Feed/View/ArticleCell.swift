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
    // Labels
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleCategory: JSLabelCategory!
    @IBOutlet weak var articleDate: UILabel!
    
    // UI Element(s)
    @IBOutlet weak var categoryLine: UIView!
    @IBOutlet weak var bgView: UIView!
    
    
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
        
        applyTheme()
    }

    
    // MARK: - Set Category
    fileprivate func applyTheme() {
        categoryLine.backgroundColor = THEME.CURRENT.TINT
        bgView.backgroundColor = THEME.CURRENT.BACKGROUND
        articleTitle.textColor = THEME.CURRENT.CARD_TITLE
        articleDate.textColor = THEME.CURRENT.CARD_LABEL
    }
    
    fileprivate func setCategory(_ category: String) {

        // Set Label
        if category == "general" {
            articleCategory.text = "  TRENDING NOW  "
        } else {
            articleCategory.text = "  \(category.uppercased())  "
        }
    }
    
}
