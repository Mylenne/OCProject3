//
//  Ax.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Ax structure
class Ax: Weapon {
    // Name of weapon
    static let name = "ax"
    
    // Array of different axes possible
    static let axes = ["hatchet", "splitting Ax", "Felling Ax", "Carpenter's Ax", "Broad Ax", "Tomahawk Ax", "Double Bit Ax", "Battle Ax", "Viking Ax"]
    
    // Point of attack of the weapon
    static let damage = 50
    
    // Ax type
    var type: String
    
    // Description of the weapon
    override var description: String {
        return "This \(self.name) is a \(self.type) and it takes away \(self.strengh) points"
    }
    
    // Initialize Ax properties
    init() {
        self.type = Ax.axes[Int(arc4random_uniform(UInt32(Ax.axes.count)))]
        super.init(strengh: Ax.damage, name: Ax.name)
    }
}
