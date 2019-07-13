//
//  Weapon.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Weapon stucture
class Weapon: CustomStringConvertible {
    // Strengh of the weapon that the character has
    let strengh: Int
    
    // Name of the weapon
    let name: String
    
    // Weapon's description used when converting an instance to a string thanks to CustomStringConvertible
    var description: String {
        return "The weapon is a \(self.name) and can take away \(self.strengh) life points."
    }
    
    // Initialize weapon properties
    init(strengh: Int, name: String) {
        self.strengh = strengh
        self.name = name
    }
}
