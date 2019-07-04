//
//  Fist.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Fist strucutre
class Fist: Weapon {
    // Name of weapon
    static let name = "fist"
    
    // Point of attack of the weapon
    static let damage = 5
    
    // Description of the weapon
    override func description() -> String {
        return "Those fist can take away \(self.strengh) points"
    }
    
    // Initialize Fist properties
    init(){
        super.init(strengh: Fist.damage, name: Fist.name)
    }
}
