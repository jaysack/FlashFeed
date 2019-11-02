//
//  Theme.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 11/1/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    
    // Primary Colors
    var ACCENT: UIColor { get }
    var BACKGROUND: UIColor { get }
    var TINT: UIColor { get }
    var OTHER: UIColor { get }

    // Card Colors
    var CARD_TITLE: UIColor { get }
    var CARD_DESCRIPTION: UIColor { get }
    var CARD_LABEL: UIColor { get }
    var CARD_BIG_LABEL: UIColor { get }
    var CARD_BIG_CATEGORY_LABEL: UIColor { get }
    var CARD_COLOR: UIColor { get }
    
    // Article Colors
    var ARTICLE_TITLE: UIColor { get }
    var ARTICLE_DESCRIPTION: UIColor { get }
    var ARTICLE_TEXT: UIColor { get }
    var ARTICLE_ACCENT: UIColor { get }
    
    // Category Selector
    var CATEGORY_TITLE: UIColor { get }
    var CATEGORY_TITLE_SELECTED: UIColor { get }
    var CATEGORY_LIP: UIColor { get }
}

struct THEME {
    
    static let IS_DARK: Bool = false
    static var CURRENT: ThemeProtocol = THEME.LIGHT()
    
    // Light Theme
    struct LIGHT: ThemeProtocol {
        
        var ACCENT = COLOR.RED
        var BACKGROUND = COLOR.WHITE
        var TINT = COLOR.DARK_BLUE
        var OTHER = COLOR.GRAY
        
        var CARD_TITLE = COLOR.WHITE
        var CARD_DESCRIPTION = COLOR.DARK_BLUE
        var CARD_LABEL = COLOR.WHITE
        var CARD_BIG_LABEL = COLOR.DARK_BLUE
        var CARD_BIG_CATEGORY_LABEL = COLOR.WHITE
        var CARD_COLOR = COLOR.RED
        
        var ARTICLE_TITLE = COLOR.DARK_BLUE
        var ARTICLE_DESCRIPTION = COLOR.GRAY
        var ARTICLE_TEXT = COLOR.DARK_BLUE
        var ARTICLE_ACCENT = COLOR.RED
        
        var CATEGORY_TITLE = COLOR.DARK_BLUE
        var CATEGORY_TITLE_SELECTED = COLOR.RED
        var CATEGORY_LIP = COLOR.RED
    }
    
    // Dark Theme
    struct DARK: ThemeProtocol {
        
        var ACCENT = COLOR.GRAY
        var BACKGROUND = COLOR.DARK_BLUE
        var TINT = COLOR.WHITE
        var OTHER = COLOR.RED
        
        var CARD_TITLE = COLOR.WHITE
        var CARD_DESCRIPTION = COLOR.DARK_BLUE
        var CARD_LABEL = COLOR.WHITE
        var CARD_BIG_LABEL = COLOR.DARK_BLUE
        var CARD_BIG_CATEGORY_LABEL = COLOR.DARK_BLUE
        var CARD_COLOR = COLOR.GRAY
        
        var ARTICLE_TITLE = COLOR.WHITE
        var ARTICLE_DESCRIPTION = COLOR.GRAY
        var ARTICLE_TEXT = COLOR.WHITE
        var ARTICLE_ACCENT = COLOR.RED
        
        var CATEGORY_TITLE = COLOR.GRAY
        var CATEGORY_TITLE_SELECTED = COLOR.WHITE
        var CATEGORY_LIP = COLOR.GRAY 
    }
}
