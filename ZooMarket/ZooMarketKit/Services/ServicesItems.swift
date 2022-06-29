//
//  ServicesItems.swift
//  ZooMarket
//
//  Created by Edgar Arakelyan on 23.06.22.
//

import Foundation

class ServicesItems {
    var itemData = Bundle.main.decode(ItemData.self, from: "Items.json")
}
