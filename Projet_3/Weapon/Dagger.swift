//
//  Dagger.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Dagger structure
class Dagger: Weapon {
    // Name of weapon
    static let name = "dagger"
    
    // Array of possible materials for the Dagger
    static let materials = ["steel", "golden", "silver", "valerian steel", "asgard steel"]
    
    // Point of attack of the weapon
    static let damage = 5
    
    // Handle of the weapon
    var handle: String
    
    // Blade of the weapon
    var blade : String
    
    // Description of the weapon
    override func description() -> String {
        return "This \(self.name) take away \(self.strengh) points. It has a handle made of \(self.handle) and a \(self.blade) blade"
    }
    
    // Initialize Dagger properties
    init() {
        self.blade = Dagger.materials[Int(arc4random_uniform(UInt32(Dagger.materials.count)))]
        self.handle = self.blade
        super.init(strengh: Dagger.damage, name: Dagger.name )
    }
}
