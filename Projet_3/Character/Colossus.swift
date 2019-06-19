//
//  Colossus.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Colossus: Character {
    static let maxPoints = 200
    static let defaultWeapon = Fist()
    
    init(name: String) {
        super.init(name: name, lifePoint: Colossus.maxPoints, weapon: Colossus.defaultWeapon, maxLifePoint: Colossus.maxPoints)
    }
    
    static func present() -> String {
        return "The Colossus has \(Colossus.maxPoints) life points and has \(Colossus.defaultWeapon.strengh) point of attack with his \(Colossus.defaultWeapon.name)."
    }
}


