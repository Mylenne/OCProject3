//
//  Ax.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Ax structure
class Ax: Weapon {
    // type of weapon
    static let type = "Ax"
    // Point of attack of the weapon
    static let damage = 50
    // Description of the weapon
    static let description = "This weapon take (Ax.damage) points from the opponent"
    // Initialize Ax properties
    init() {
        super.init(strengh: Ax.damage, name: Ax.type)
    }
}
