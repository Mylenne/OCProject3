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
    // Maximum life points Colossus type can have
    static let maxPoints = 200
    
    // Default weapon Colossus type has
    static let defaultWeapon = Fist()
    
    // Initiliaze Colossus properties
    init(name: String) {
        super.init(name: name, lifePoint: Colossus.maxPoints, weapon: Colossus.defaultWeapon, maxLifePoint: Colossus.maxPoints, type: "Colossus")
    }
    
    // Present Colossus type
    static func present() -> String {
        return "The Colossus has \(Colossus.maxPoints) maximum life points and has \(Colossus.defaultWeapon.strengh) points of attack with his \(Colossus.defaultWeapon.name)."
    }
}
