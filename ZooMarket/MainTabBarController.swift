//
//  MainTabBarController.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeCoordinator = HomeCoordinator()
    let favouritesCoordinator = FavouritesCoordinator()
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
    }
}
