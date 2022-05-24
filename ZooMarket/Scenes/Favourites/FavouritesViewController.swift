//
//  FavouritesViewController.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class FavouritesViewController: UIViewController {
    var coordinator: FavouritesCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Favourites"
    }
}
