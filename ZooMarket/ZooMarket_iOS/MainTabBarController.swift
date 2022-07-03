//
//  MainTabBarController.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeCoordinator = HomeCoordinator()
    let favouritesCoordinator = FavoritesCoordinator()
    let settingsCoordinator = SettingsCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBlue

        
        
        viewControllers = [
            homeCoordinator.navigationController,
            favouritesCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        
        setAppearance()
    }
    
    func setAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemYellow
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
        tabBar.tintColor = .black
    }
}
