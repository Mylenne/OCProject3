//
//  Wings.swift
//  Projet_3
//
//  Created by Mylenne  on 14/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Wings (bonus in the game) structure
class Wings: Weapon {
    // Possible type of Wings
    static let wings = ["Angel wings", "Evil Wings"]
    
    // Name of weapon
    static let name = "Wings"
    
    // Points of attack of the weapon
    static let damage = 20
    
    // Type of Wings
    var type: String
    
    // Description of the weapon
    override func description() -> String {
        return "Those \(self.name) are \(self.type) and can take away \(self.strengh) point."
    }
    
    // Initialize Wings properties
    init() {
        self.type = Wings.wings[Int(arc4random_uniform(UInt32(Wings.wings.count)))]
        super.init(strengh: Wings.damage, name: Wings.name)
    }
}
