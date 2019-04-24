//
//  Order.swift
//  Restaurant Menu
//
//  Created by Fabiola Saga on 4/23/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
