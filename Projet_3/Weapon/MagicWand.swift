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
    // type of weapon
    static let type = "Magic Wand"
    // Point of attack of the weapon
    static let damage = 35
    // Description of the weapon
    static let description = "This weapon take (MagicWand.damage) points from the opponent"
    // Initialize MagicWand properties
    init() {
        super.init(strengh: MagicWand.damage, name: MagicWand.type)
    }
}
