//
//  BigArticleCell.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class BigArticleCell: UITableViewCell {

    // MARK: - IBOutlets
    // UILabels
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImage: JSImageView!
    @IBOutlet weak var articleCategory: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    // UI Elements
    @IBOutlet weak var categoryLine: UIView!
    
    
    // MARK: - Variables
    static let identifier = "BigArticleCell"
    
    var article: Article! {
        didSet {
            setTitle(self.article.title, to: articleTitle)
            setDescription(self.article.descr ?? "", to: articleDescription)
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

        setupUI()
        applyTheme()
    }
    
    
    // MARK: - Set Article
    fileprivate func setupUI() {

        self.layer.shadowOpacity = SHADOW.OPACITY
        self.layer.shadowRadius = SHADOW.RADIUS
        self.layer.shadowOffset = SHADOW.OFFSET
        self.layer.shadowColor = SHADOW.COLOR
        bgView.layer.cornerRadius = CORNER.RADIUS
    }
    
    fileprivate func applyTheme() {
        
        // Background
        bgView.backgroundColor = THEME.CURRENT.CARD_COLOR
        
        // Labels
        articleTitle.textColor = THEME.CURRENT.CARD_TITLE
        articleDescription.textColor = THEME.CURRENT.CARD_DESCRIPTION
        articleDate.textColor = THEME.CURRENT.CARD_BIG_LABEL
        articleCategory.textColor = THEME.CURRENT.CARD_BIG_CATEGORY_LABEL
        articleCategory.backgroundColor = THEME.CURRENT.CARD_COLOR
        
        // UI Element(s)
        categoryLine.backgroundColor = THEME.CURRENT.CARD_TITLE
    }

    
    // MARK: - Set Category
    fileprivate func setCategory(_ category: String) {
        
        // Set Label
        if category == "general" {
            articleCategory.text = "  TRENDING NOW  "
        } else {
            articleCategory.text = "  \(category.uppercased())  "
        }
    }
    
}
