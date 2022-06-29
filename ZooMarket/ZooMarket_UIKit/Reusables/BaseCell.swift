//
//  BaseCell.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 21.06.22.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super .init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {}
}
