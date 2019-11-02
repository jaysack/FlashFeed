//
//  ArticleDetailCell.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class ArticleDetailCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleAuthorSpan: UILabel!
    @IBOutlet weak var articleImage: JSImageView!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    
    @IBOutlet weak var lineDivider: UIView!
    @IBOutlet weak var bgView: UIView!
    
    
    // MARK: - Variables
    static let identifier = "ArticleDetailCell"
    var article: Article! {
        didSet {
            setTitle(self.article.title, to: articleTitle)
            setAuthor(self.article.author, to: articleAuthor)
            setContent(self.article.content, to: articleContent)
            setDate(self.article.publishedAt, to: articleDate)
            setDescription(self.article.descr, to: articleDescription)
            setImage(from: self.article, to: articleImage)
        }
    }
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyTheme()
    }
    
    
    // MARK: - Private Function(s)
    fileprivate func applyTheme() {
        
        // Background
        bgView.backgroundColor = THEME.CURRENT.BACKGROUND
        
        // Labels
        articleTitle.textColor = THEME.CURRENT.ARTICLE_TITLE
        articleAuthorSpan.textColor = THEME.CURRENT.ARTICLE_TEXT
        articleAuthor.textColor = THEME.CURRENT.ARTICLE_TEXT
        articleDescription.textColor = THEME.CURRENT.ARTICLE_DESCRIPTION
        articleDate.textColor = THEME.CURRENT.ARTICLE_TEXT
        articleContent.textColor = THEME.CURRENT.ARTICLE_TEXT
        
        // UI Elements
        lineDivider.backgroundColor = THEME.CURRENT.ARTICLE_ACCENT
        
    }
    
    
    // MARK: - Auto Sizing Function
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    

}
