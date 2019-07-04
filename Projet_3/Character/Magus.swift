//
//  Magus.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Magus structure, which is a character
class Magus: Character {
    // Maximum life points that the Magus can have, and has at the beginning of the game
    static let maxPoints = 50
    
    // Default weapon that the Magus has
    static let defaultWeapon = Magic()
    
    // Type of character
    static let type = "Magus"
    
    // Initialize Magus properties
    init(name:String) {
        super.init(name: name, lifePoint: Magus.maxPoints, weapon: Magus.defaultWeapon, maxLifePoint: Magus.maxPoints)
    }
    
    // Present the Magus
    static func present() -> String {
        return "The \(Magus.type) has \(Magus.maxPoints) life points and has \(Magus.defaultWeapon.strengh) points of healing power given by his \(Magus.defaultWeapon.name)."
    }
    
    // If it's a magus it will add points to his team mate and not take away points, from his enemy
    // It cannot give more points that what his team mate has initalialy
    override func actionOn(character: Character) {
        character.lifePoint = character.lifePoint + self.weapon.strengh
        if character.lifePoint > character.maxLifePoint {
            character.lifePoint = character.maxLifePoint
        }
        print("\(self.name) has save your team mate, \(character.name) by healing him and has now with his \(self.weapon.name), he has now \(character.lifePoint) ")
        
    }
}




