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
            setTitle(self.article.title)
            setDate(self.article.publishedAt)
            setImage()
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

    
    // MARK: - Set Article
    fileprivate func setTitle(_ title: String) {
        
        // Remove source name
        let endIndex = title.lastIndex(of: "-")
        let text = title[..<endIndex!]

        articleTitle.text = String(text)
    }
    
    fileprivate func setDate(_ publishedDate: String) {
        
        // Convert to date type
        let date = DateFormatter().date(publishedDate)
        
        // Get user friendly format
        articleDate.text = date?.timeAgoDisplay()
    }
    
    fileprivate func setImage() {
        
        article.getImage { [weak self] (img) in
            if let image = img {
                self?.articleImage.image = image
            }
        }
    }
    
    
    // MARK: - Set Category
    fileprivate func setCategory(_ category: String) {
        articleCategory.text = "  \(category.uppercased())  "
    }
    
}
