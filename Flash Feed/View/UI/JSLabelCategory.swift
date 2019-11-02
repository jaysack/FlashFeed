//
//  JSLabelCategory.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/30/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class JSLabelCategory: UILabel {
    
    // MARK: - Variable
    override var text: String? {
        didSet {
            setTextColor(for: oldValue!)
        }
    }
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Function(s)
    fileprivate func setTextColor(for category: String) {
        
        if THEME.IS_DARK {
            self.textColor = THEME.CURRENT.TINT
            
        } else {
            switch self.text! {
            case "  TRENDING NOW  ":
                self.textColor = CATEGORY.COLOR.GENERAL
                
            case "  BUSINESS  ":
                self.textColor = CATEGORY.COLOR.BUSINESS
                
            case "  ENTERTAINMENT  ":
                self.textColor = CATEGORY.COLOR.ENTERTAINMENT
                
            case "  HEALTH  ":
                self.textColor = CATEGORY.COLOR.HEALTH
                
            case "  SCIENCE  ":
                self.textColor = CATEGORY.COLOR.SCIENCE
                
            case "  SPORTS  ":
                self.textColor = CATEGORY.COLOR.SPORTS
                
            case "  TECHNOLOGY  ":
                self.textColor = CATEGORY.COLOR.TECH
                
            default:
                self.textColor = UIColor.lightGray
            }
        
            // Background Color
            self.backgroundColor = THEME.CURRENT.BACKGROUND
        }

    }
    
}

