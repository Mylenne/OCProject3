//
//  Sword.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Sword structure
class Sword: Weapon {
    // Name of weapon
    static let name = "sword"
    
    // Array of material possible
    static let blades = ["stone", "copper", "bronze", "bone", "adamantine"]
    
    // Point of attack of the weapon
    static let damage = 10
    
    // Blade of the weapon
    var blade : String
    
    // Hilt of the sword
    let hilt = "leather"
    
    // Description of the weapon
    override func description() -> String {
        return "This \(self.name) take away \(self.strengh) points. The blade is made of \(self.blade) and the hilt is in \(self.hilt)."
    }
    
    // Initialize Sword properties
    init() {
        self.blade = Sword.blades[Int(arc4random_uniform(UInt32(Sword.blades.count)))]
        super.init(strengh: Sword.damage, name: Sword.name)
    }
}
