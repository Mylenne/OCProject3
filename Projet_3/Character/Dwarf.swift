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
    // Maximum life points Dwarf type can have
    static let maxPoints = 30
    
    // Default weapon Dwarf type has
    static let defaultWeapon = Ax()
  
    // Initialize Dwarf properties
    init(name: String) {
        super.init(name: name, lifePoint: Dwarf.maxPoints, weapon: Dwarf.defaultWeapon, maxLifePoint: Dwarf.maxPoints, type: "Dwarf")
    }
    
    // Present Dwarf type
     static func present() -> String {
        return "The Dwarf has \(Dwarf.maxPoints) maximum life points and has \(Dwarf.defaultWeapon.strengh) points of attack given by his \(Dwarf.defaultWeapon.name)."
    }
}
