//
//  Fist.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Fist strucutre
class Fist: Weapon {
    // type of weapon
    static let type = "Fist"
    // Point of attack of the weapon
    static let damage = 5
    // Description of the weapon
    static let description = "This weapon take (Fist.damage) points from the opponent"
    // Initialize Fist properties
    init(){
        super.init(strengh: Fist.damage, name: Fist.type)
    }
}
