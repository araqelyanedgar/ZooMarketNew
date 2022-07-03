//
//  HomeDataSource.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 02.06.22.
//

import UIKit

struct HomeSection {
    let title: String?
    let type: HomeSectionType
    let items: [HomeItem]
    
    var isFavorite: Bool?
}

enum HomeSectionType {
    case brands
    case alsoLike
}

struct HomeItem {
    let id: Int
    let name: String
    let image: String
}

protocol HomeDataSourceDelegate: AnyObject {
    func updateInfo()
}

class HomeDataSource: NSObject, UICollectionViewDataSource {
    weak var delegate: HomeDataSourceDelegate?
    let repository: ItemsRepository
    
    private (set)var sections = [HomeSection]()
    var brands: [Brand] = []
    
    init(repository: ItemsRepository) {
        self.repository = repository
        super.init()
        
        repository.delegate = self
        brands = repository.getBrands()
        updateSections()
    }
    
    func updateSections() {
        var brandItems: [HomeItem] = []
        brands.forEach { brand in
            brandItems.append(
                HomeItem(id: brand.id, name: brand.name, image: brand.image)
            )
        }
        let brandSection = HomeSection(title: "Brands", type: .brands, items: brandItems)
        sections = [ brandSection, makeAlsoLikeSection() ]
    }
    
    private func makeAlsoLikeSection() -> HomeSection {
        let firstItem = HomeItem(id: 0, name: "", image: "")
        let secondItem = HomeItem(id: 1, name: "", image: "")
        let thirdItem = HomeItem(id: 2, name: "", image: "")
        let forthItem = HomeItem(id: 3, name: "", image: "")
        
        return HomeSection(
            title: "You May Also Like",
            type: .alsoLike,
            items: [firstItem, secondItem, thirdItem, forthItem])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section.type {
        case .brands:
            return makeBrands(in: collectionView, indexPath: indexPath)
        case .alsoLike:
            return makeAlsoLike(in: collectionView, indexPath: indexPath)
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: HomeViewController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier,
            for: indexPath
        ) as! HeaderView
        return headerView
    }
    
    func makeBrands(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell
        else {
            fatalError("Failed to dequeue a StatusCollectionViewCell")
        }
        cell.set(data: brands[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    func makeAlsoLike(in collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlsoLikeCell", for: indexPath) as? AlsoLikeCell
        else {
            fatalError("Failed to dequeue a StatusCollectionViewCell")
        }
        return cell
    }
}

extension HomeDataSource: BrandCellDelegate {
    func likeButtonPressed(with brand: Brand) {
        repository.set(brand: brand)
    }
}

extension HomeDataSource: ItemsRepositoryDelegate {
    func updateBrands(brands: [Brand]) {
        self.brands = brands
        delegate?.updateInfo()
    }
}
