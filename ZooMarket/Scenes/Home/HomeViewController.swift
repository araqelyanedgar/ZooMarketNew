//
//  HomeViewController.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class HomeViewController: UIViewController {
    var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Home"
    }
}
