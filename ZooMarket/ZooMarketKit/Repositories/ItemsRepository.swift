//
//  ItemsRepository.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 23.06.22.
//

import Foundation

protocol ItemsRepositoryDelegate: AnyObject {
    func updateBrands(brands: [Brand])
}

class ItemsRepository {
    weak var delegate: ItemsRepositoryDelegate?
    let service = ServicesItems()
    private var brands: [Brand] = []
    static var shared = ItemsRepository()
    
    
//    var brands: [Brand] {
//        get {
//            return _brands
//        }
//        set {
//            _brands = newValue
//        }
//    }
    
    private init() {
        brands = service.itemData.data.brands
        delegate?.updateBrands(brands: brands)
    }
    
    func set(brand: Brand) {
        for (index, item) in brands.enumerated() {
            if item.id == brand.id {
                let isFav = brands[index].isFavorite ?? false
                brands[index].isFavorite = !isFav
            }
        }
        delegate?.updateBrands(brands: brands)
    }
    
    func getBrands() -> [Brand] {
        return brands
    }
}
