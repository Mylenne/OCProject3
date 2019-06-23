//
//  Dagger.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Dagger structure
class Dagger: Weapon {
    // type of weapon
    static let type = "Dagger"
    // Point of attack of the weapon
    static let damage = 5
    // Description of the weapon
    static let description = "This weapon take (Dagger.damage) points from the opponent"
    // Initialize dagger properties
    init() {
        super.init(strengh: Dagger.damage, name: Dagger.type)
        
    }
}
