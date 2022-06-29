//
//  HomeCoordinator.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class HomeCoordinator {
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        
        let homeViewController = HomeFactory.createHomeViewController(coordinator: self)
        homeViewController.coordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [homeViewController]
    }
    
    func showItemDetailScene(brand: Brand) {
        let viewController = ItemDetailVeiwController(brand: brand)
        navigationController.pushViewController(
            viewController, animated: true)
    }
}
