//
//  Magus.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Magus: Character {
    static let maxPoints = 50
    static let defaultWeapon = Magic()
    
    init(name:String) {
        super.init(name: name, lifePoint: Magus.maxPoints, weapon: Magus.defaultWeapon, maxLifePoint: Magus.maxPoints)
    }
    
    static func present() -> String {
        return "The Magus has \(Magus.maxPoints) life points and has \(Magus.defaultWeapon.strengh) point of healing power given by his \(Magus.defaultWeapon.name)."
    }
    
    // If it's a magus it will add points to his team mate and not take away points, from his enemy
    // It cannot give more points that what his team mate has initalialy
    override func actionOn(character: Character) {
        character.lifePoint = character.lifePoint + self.weapon.strengh
        if character.lifePoint > character.maxLifePoint {
            character.lifePoint = character.maxLifePoint
        }
        print("\(self.name) has save your team mate, \(character.name) by healing him and has now with his \(Magus.defaultWeapon.name), he has now \(character.lifePoint) ")
        
    }
}




