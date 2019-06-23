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
    // type of weapon
    static let type = "Sword"
    // Point of attack of the weapon
    static let damage = 10
     // Description of the weapon
    static let description = "This weapon take (Sword.damage) points from the opponent"
    // Initialize Sword properties
    init() {
        super.init(strengh: Sword.damage, name: Sword.type)
    }
}
