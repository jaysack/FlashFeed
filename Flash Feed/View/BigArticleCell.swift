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
            setTitle(self.article.title)
            setDescription(self.article.descr ?? "")
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
        
        setupUI()
    }
    
    
    // MARK: - Set Article
    fileprivate func setupUI() {
        
        self.layer.shadowOpacity = SHADOW.OPACITY
        self.layer.shadowRadius = SHADOW.RADIUS
        self.layer.shadowOffset = SHADOW.OFFSET
        self.layer.shadowColor = SHADOW.COLOR
    
        bgView.layer.cornerRadius = CORNER.RADIUS
    }
    
    fileprivate func setTitle(_ title: String) {
        
        // Remove source name
        let endIndex = title.lastIndex(of: "-")
        let text = title[..<endIndex!]
        
        articleTitle.text = String(text)
    }
    
    fileprivate func setDescription(_ description: String) {
        articleDescription.text = description
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
        
        // Set Label
        if category == "general" {
            articleCategory.text = "  TRENDING NOW  "
        } else {
            articleCategory.text = "  \(category.uppercased())  "
        }

        articleCategory.textColor = UIColor.white
    }
    
}
