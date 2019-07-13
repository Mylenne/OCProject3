//
//  MagicWand.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Magic Wand Structure
class MagicWand: Weapon {
    // Name of weapon
    static let name = "wand"
    
    // Array of possible wand material
    static let wandMaterials = ["cedar wood", "birch wood", "unicorn wood", "acacia wood", "chesnut wood", "cherry wood", "apple wood", "hazel wood"]
    
    // Point of attack of the weapon
    static let damage = 35
    
    // Handle of the wand
    var handle: String
    
    // Wand shaft of the wand
    var wandShaft : String 
    
    // Description of the weapon
    override var description: String {
        return "This magnificent \(self.name) is composed of a wand shaft created in pure \(self.wandShaft) and a handle made in \(self.handle) as well, that gives \(self.strengh) points back"
    }
    
    // Initialize MagicWand properties
    init() {
        self.wandShaft = MagicWand.wandMaterials[Int(arc4random_uniform(UInt32(MagicWand.wandMaterials.count)))]
        self.handle = wandShaft
        super.init(strengh: MagicWand.damage, name: MagicWand.name)
    }
}
