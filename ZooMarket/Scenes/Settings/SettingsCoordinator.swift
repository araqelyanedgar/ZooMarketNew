//
//  SettingsCoordinator.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class SettingsCoordinator {
    let navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 2)
        
        let viewController = SettingsViewController()
        viewController.coordintor = self
        navigationController.viewControllers = [viewController]
    }
}
