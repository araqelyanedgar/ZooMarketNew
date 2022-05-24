//
//  FavouritesCoordinator.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class FavouritesCoordinator {
    let navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "heart"), tag: 1)
        
        let viewController = FavouritesViewController()
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
    }
}
