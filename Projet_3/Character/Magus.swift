//
//  Magus.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Magus structure
class Magus: Character {
    // Maximum life points Magus type can have
    static let maxPoints = 20
    
    // Default weapon Magus type has
    static let defaultWeapon = Magic()
    
    // Initialize Magus properties
    init(name:String) {
        super.init(name: name, lifePoint: Magus.maxPoints, weapon: Magus.defaultWeapon, maxLifePoint: Magus.maxPoints, type: "Magus")
    }
    
    // Present Magus type
    static func present() -> String {
        return "The Magus has \(Magus.maxPoints) maximum life points and has \(Magus.defaultWeapon.strengh) points of healing power given by his \(Magus.defaultWeapon.name)."
    }
    
    // If it's a Magus it will add points to his team mate and not take away points, from his enemy
    // It cannot give more points that what his team mate has initalialy
    override func actionOn(character: Character) {
        character.lifePoint = character.lifePoint + self.weapon.strengh
        
        if character.lifePoint > character.maxLifePoint {
            character.lifePoint = character.maxLifePoint
        }
        
        print("\(self.name) has saved your team mate, \(character.name) by healing him with his \(self.weapon.name), he has now \(character.lifePoint) ")
    }
}
