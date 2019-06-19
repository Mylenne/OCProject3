//
//  Dwarf.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Dwarf: Character {
    static let maxPoints = 30
    static let defaultWeapon = Ax()
    
    init(name: String) {
        super.init(name: name, lifePoint: Dwarf.maxPoints, weapon: Dwarf.defaultWeapon, maxLifePoint: Dwarf.maxPoints)
    }
    
    static func present() -> String {
       return "The Dwarf has \(Dwarf.maxPoints) life points and has \(Dwarf.defaultWeapon.strengh) point of attack given by his weapon, \(Dwarf.defaultWeapon.name)."
    }
}



