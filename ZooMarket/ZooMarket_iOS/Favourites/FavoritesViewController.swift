//
//  FavouritesViewController.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 24.05.22.
//

import UIKit

class FavoritesViewController: UITableViewController {
    var coordinator: FavoritesCoordinator?
    var dataSource: TableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favourites"
        
        tableView.dataSource = dataSource
        tableView.register(FavoritesCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}
