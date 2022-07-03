//
//  BrandCell.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 04.06.22.
//

import UIKit

protocol BrandCellDelegate: AnyObject {
    func likeButtonPressed(with brand: Brand)
}

class BrandCell: BaseCell {
    // FIXME: - Can cause a retain cycle
    var delegate: BrandCellDelegate?
    var nameLabel: UILabel!
    var likeButton: UIButton!
    private(set) var data: Brand!
    
    override func initViews() {
        backgroundColor = .systemRed
        
        initNameLabel()
        initLikeButton()
        initConstructHierarchy()
        activateConstraints()
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    func set(data: Brand) {
        self.data = data
        nameLabel.text = data.name
        
        let isFavourite = data.isFavorite ?? false
        if isFavourite {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("\(data.id) is liked")
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            print("Unliked")
        }
    }
    
    @objc func likeButtonTapped() {
        delegate?.likeButtonPressed(with: self.data)
    }
}

extension BrandCell {
    func initNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = "TEXT"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initLikeButton() {
        likeButton = UIButton(type: .system)
        likeButton.setImage(
            UIImage(systemName: "heart"),
            for: .normal
        )
        likeButton.tintColor = .white
        likeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initConstructHierarchy() {
        addSubview(nameLabel)
        addSubview(likeButton)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
