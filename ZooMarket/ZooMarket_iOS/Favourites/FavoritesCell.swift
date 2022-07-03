//
//  FavoritesCell.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 02.07.22.
//

import UIKit

class FavoritesCell: UITableViewCell {
    var animalImageView: UIImageView!
    var nameLabel: UILabel!
    
    var data: Brand? {
        didSet {
            guard let data = data else { return }
            nameLabel.text = data.name
            animalImageView.image = UIImage(named: data.image)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        initImageView()
        initNameLabel()
        consructHierarchy()
        activateConstraints()
    }
}

extension FavoritesCell {
    func initImageView() {
        animalImageView = UIImageView()
        animalImageView.layer.cornerRadius = 50
        animalImageView.image = UIImage(named: "images-2")
        animalImageView.clipsToBounds = true
        animalImageView.contentMode = .scaleAspectFill
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = nameLabel.font.withSize(22)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func consructHierarchy() {
        addSubview(animalImageView)
        addSubview(nameLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            animalImageView.widthAnchor.constraint(equalToConstant: 100),
            animalImageView.heightAnchor.constraint(equalToConstant: 100),
            
            animalImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            animalImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            animalImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            nameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 70),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
