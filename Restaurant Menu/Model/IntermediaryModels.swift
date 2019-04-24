//
//  IntermediaryModels.swift
//  Restaurant Menu
//
//  Created by Fabiola Saga on 4/23/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
