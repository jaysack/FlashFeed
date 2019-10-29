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
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    
    @IBOutlet weak var lineDivider: UIView!
    
    
    // MARK: - Variables
    static let identifier = "ArticleDetailCell"
    var article: Article! {
        didSet {
            setTitle(self.article.title, to: articleTitle)
            setAuthor(self.article.author, to: articleAuthor)
            setContent(self.article.content, to: articleContent)
            setDate(self.article.publishedAt, to: articleDate)
            setImage(from: self.article, to: articleImage)
            setDescription(self.article.descr, to: articleDescription)
        }
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
