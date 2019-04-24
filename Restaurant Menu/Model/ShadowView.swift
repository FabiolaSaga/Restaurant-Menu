//
//  ShadowView.swift
//  Restaurant Menu
//
//  Created by Fabiola Saga on 4/24/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform:  nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
        
        layer.cornerRadius = 5
    }
}
