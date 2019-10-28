//
//  ViewController.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variable(s)
    let vm = ViewModel()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        vm.loadSources(in: COUNTRY.USA)
        vm.loadArticles(in: COUNTRY.USA)
    }


}

