//
//  Magic.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Magic stucture
class Magic: Weapon {
    // Name of weapon
    static let name = "magic"
    
    // Type of magic
    static let magics = ["black", "white"]
    
    // Points of attack of the weapon
    static let damage = 30
    
    // Type of magic
    var type: String
    
    // Description of the weapon
    override var description: String {
        return "Thanks to this \(self.type) \(self.name), you will be able to save your team mate by \(self.strengh) life points"
    }
    
    // Initialize Magic properties
    init() {
        self.type = Magic.magics[Int(arc4random_uniform(UInt32(Magic.magics.count)))]
        super.init(strengh: Magic.damage, name: Magic.name)
    }
}
