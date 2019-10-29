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
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImage: JSImageView!
    @IBOutlet weak var articleCategory: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
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
    }
    
    
    // MARK: - Set Article
    fileprivate func setupUI() {
        
        // Shadow
        self.layer.shadowOpacity = SHADOW.OPACITY
        self.layer.shadowRadius = SHADOW.RADIUS
        self.layer.shadowOffset = SHADOW.OFFSET
        self.layer.shadowColor = SHADOW.COLOR
    
        // Background View
        bgView.layer.cornerRadius = CORNER.RADIUS
        
        // Labels
        articleDate.textColor = COLOR.DARK
        articleDescription.textColor = COLOR.DARK
    }

    
    // MARK: - Set Category
    fileprivate func setCategory(_ category: String) {
        
        // Set Label
        if category == "general" {
            articleCategory.text = "  TRENDING NOW  "
        } else {
            articleCategory.text = "  \(category.uppercased())  "
        }

        articleCategory.textColor = UIColor.white
    }
    
}
