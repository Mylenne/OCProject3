//
//  Fighter.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Fighter: Character {
    static let maxPoints = 100
    static let defaultWeapon = Sword()
    
    init(name: String) {
        super.init(name: name, lifePoint: Fighter.maxPoints, weapon: Fighter.defaultWeapon, maxLifePoint: Fighter.maxPoints)
    }
    
    static func present() -> String {
        return "The FIGHTER has \(Fighter.maxPoints) life points and has \(Fighter.defaultWeapon.strengh) point of attack given by his weapon, \(Fighter.defaultWeapon.name)."
    }
}

