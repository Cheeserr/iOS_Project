//
//  Card.swift
//  iOS_Project
//
//  Created by Aleksandra on 19/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import Foundation
import SpriteKit

class Card: SKSpriteNode {
    
    var matched = false
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: UIColor.clear, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
