//
//  TableViewDataSource.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 03.07.22.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: HomeDataSourceDelegate?
    let repository: ItemsRepository
    
    private (set)var sections = [HomeSection]()
    var brands: [Brand] = []
    
    init(repository: ItemsRepository) {
        self.repository = repository
        super.init()
        
        brands = repository.getBrands()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = brands[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCell",
            for: indexPath
        ) as! FavoritesCell
        
        cell.nameLabel.text = data.name
        cell.animalImageView.image = UIImage(named: data.image)
        return cell
    }
}
