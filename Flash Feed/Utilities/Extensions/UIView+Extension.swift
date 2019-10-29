//
//  UIView+Extension.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/28/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

extension UIView {
    
    // Set Title Label
    func setTitle(_ title: String, to label: UILabel) {
        
        // Remove source name
        let endIndex = title.lastIndex(of: "-")
        let text = title[..<endIndex!]
        
        label.text = String(text)
    }
    
    
    // Set Author Label
    func setAuthor(_ author: String?, to label: UILabel) {
        
        if let writer = author {
            label.text = writer
        } else {
            label.text = "Unknown Author"
        }
    }
    
    
    // Set Content
    func setContent(_ content: String?, to label: UILabel) {
        
        if let content = content {
            label.text = content
        } else {
            label.text = ""
        }
    }
    
    
    // Set Description Label
    func setDescription(_ description: String?, to label: UILabel) {
        
        if let descr = description {
            label.text = descr
        } else {
            label.text = ""
        }
    }
    
    
    // Set Date Label (MMM dd, yyyy format)
    func setDate(_ publishedDate: String, to label: UILabel) {
        
        // Generate Date
        let date = DateFormatter().date(publishedDate)
        
        // Convert into correct String format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        // Assign to UILabel
        label.text = dateFormatter.string(from: date ?? Date())
    }
    
    
    // Set Date Label ('XX hours ago' format)
    func setDateFromNowFormat(_ publishedDate: String, to label: UILabel) {
        
        // Convert to date type
        let date = DateFormatter().date(publishedDate)
        
        // Get user friendly format
        label.text = date?.timeAgoDisplay()
    }
    
    
    // Set ImageView
    func setImage(from article: Article, to imageView: UIImageView) {
        
        article.getImage { (img) in
            if let image = img {
                imageView.image = image
            }
        }
    }
}
