//
//  AlsoLikeCell.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 07.06.22.
//

import UIKit

class AlsoLikeCell: BaseCell {
    var nameLabel: UILabel!
    var likeButton: UIButton!
    var isFav = true
    
    override func initViews() {
        backgroundColor = .systemBlue
        
        initNameLabel()
        initLikeButton()
        initConstructHierarchy()
        activateConstraints()
        
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    @objc func likeButtonTapped() {
        if isFav {
        likeButton.setImage(
            UIImage(systemName: "heart"),
            for: .normal
        )
//            isFav.toggle()
        } else {
            likeButton.setImage(
                UIImage(systemName: "heart.fill"),
                for: .normal
            )
            isFav.toggle()
        }
    }
}

extension AlsoLikeCell {
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
