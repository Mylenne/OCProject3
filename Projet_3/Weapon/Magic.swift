//
//  SpecialWeapon.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Magic stucture
class Magic: Weapon {
    // type of weapon
    static let type = "Magic"
    // Point of attack of the weapon
    static let damage = 30
    // Description of the weapon
    static let description = "This weapon take (Magic.damage) points from the opponent"
    // Initialize Magic properties
    init() {
        super.init(strengh: Magic.damage, name: Magic.type)
    }
}


