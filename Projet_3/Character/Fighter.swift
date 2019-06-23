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
    // Maximum life points that the Fighter can have, and has at the beginning of the game
    static let maxPoints = 100
    
    // Default weapon that the fighter has
    static let defaultWeapon = Sword()
    
    // Type of character
    static let type = "Fighter"
    
    // initialize fighter properties
    init(name: String) {
        super.init(name: name, lifePoint: Fighter.maxPoints, weapon: Fighter.defaultWeapon, maxLifePoint: Fighter.maxPoints)
    }
    
    // Present the fighter
    static func present() -> String {
        return "The FIGHTER has \(Fighter.maxPoints) life points and has \(Fighter.defaultWeapon.strengh) point of attack given by his weapon, \(Fighter.defaultWeapon.name)."
    }
}

