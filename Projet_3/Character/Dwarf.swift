//
//  Dwarf.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Dwarf structure
class Dwarf: Character {
    // Maximum life points that the Dwarf can have, and has at the beginning of the game
    static let maxPoints = 30
    
    // Default weapon that the Colossus has
    static let defaultWeapon = Ax()
    
    // Type of character
    static let type = "Dwarf"
    // Initialize Dwarf properties
    init(name: String) {
        super.init(name: name, lifePoint: Dwarf.maxPoints, weapon: Dwarf.defaultWeapon, maxLifePoint: Dwarf.maxPoints)
    }
    
    // Present Dward
    static func present() -> String {
        return "The Dwarf has \(Dwarf.maxPoints) life points and has \(Dwarf.defaultWeapon.strengh) point of attack given by his weapon, \(Dwarf.defaultWeapon.name)."
    }
}



