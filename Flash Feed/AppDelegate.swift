//
//  AppDelegate.swift
//  Flash Feed
//
//  Created by Jonathan Sack on 10/27/19.
//  Copyright © 2019 Jonathan Sack. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    // MARK: - Lifecycle Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configStatusBar()
        configNavigationController()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    
    // MARK: - Functions
    fileprivate func configStatusBar() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent    
    }
    
    fileprivate func configNavigationController() {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        // Setup colors
        if THEME.IS_DARK {
            navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
            navigationBarAppearace.shadowImage = UIImage()
        }
        
        navigationBarAppearace.tintColor = THEME.CURRENT.BACKGROUND
        navigationBarAppearace.barTintColor = THEME.CURRENT.ACCENT
        
        // Setup font
        guard let font = UIFont(name: "HiraMinProN-W6", size: 24) else { return }
        
        navigationBarAppearace.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: font
        ]

    }

}

