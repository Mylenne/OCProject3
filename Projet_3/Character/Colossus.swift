//
//  Colossus.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Colossus structure
class Colossus: Character {
    // Maximum life points that the Colossus can have, and has at the beginning of the game
    static let maxPoints = 200
    
    // Default weapon that the Colossus has
    static let defaultWeapon = Fist()
    
    // Type of character
    static let type = "Colossus"
    
    
    // Initiliaze Colossus properties
    init(name: String) {
        super.init(name: name, lifePoint: Colossus.maxPoints, weapon: Colossus.defaultWeapon, maxLifePoint: Colossus.maxPoints)
    }
    
    // Present Colossus
    static func present() -> String {
        return "The \(Colossus.type) has \(Colossus.maxPoints) life points and has \(Colossus.defaultWeapon.strengh) points of attack with his \(Colossus.defaultWeapon.name)."
    }
    
}


