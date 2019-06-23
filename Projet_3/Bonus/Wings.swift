//
//  Wings.swift
//  Projet_3
//
//  Created by Mylenne  on 14/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Wings (bonus in the game) structure
class Wings: Weapon {
    // type of weapon
    static let type = "Wings"
    // Point of attack of the weapon
    static let damage = 20
    // Description of the weapon
    static let description = "This weapon take (Wings.damage) points from the opponent"
    // Initialize Wings properties
    init() {
        super.init(strengh: Wings.damage, name: Wings.type)
    }
}

