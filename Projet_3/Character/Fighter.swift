//
//  Fighter.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Fighter stucture
class Fighter: Character {
    // Maximum life points Fighter type can have
    static let maxPoints = 100
    
    // Default weapon Fighter type has
    static let defaultWeapon = Sword()

    // Initialize Fighter properties
    init(name: String) {
        super.init(name: name, lifePoint: Fighter.maxPoints, weapon: Fighter.defaultWeapon, maxLifePoint: Fighter.maxPoints, type: "Fighter")
    }
    
    // Present Fighter type
    static func present() -> String {
        return "The Fighter has \(Fighter.maxPoints) maximum life points and has \(Fighter.defaultWeapon.strengh) points of attack given by his \(Fighter.defaultWeapon.name)."
    }
}
