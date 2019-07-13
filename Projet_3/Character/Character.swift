//
//  Character.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Character structure
class Character: CustomStringConvertible {
    // Character's name
    var name: String
    
    // Character's type
    var type: String
    
    // Character's number of life points
    var lifePoint: Int
    
    // maxLifePoint is the Maximum life points that the character can have,
    // The Magus won't be able to give more points than what his team mate initially has, at the beginning of the game
    let maxLifePoint: Int
    
    // Character's weapon
    var weapon: Weapon
    
    // Character's description used when converting an instance to a string thanks to CustomStringConvertible
    var description: String {
        return "\(name), the \(self.type) has \(self.lifePoint) life points and can take away \(self.weapon.strengh) points. He has a \(self.weapon.name)."
    }
    
    // Initialize character properties
    init(name: String, lifePoint: Int, weapon: Weapon, maxLifePoint: Int, type: String){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.maxLifePoint = maxLifePoint
        self.type = type
    }
    
    // Box with new weapons
    func boxAppear () {
        // If the character is not a Magus it will give one of the randonAttackerWeapon as his new weapon.
        if !(self is Magus) {
            let randomWeapons = [Dagger(), Sword(), Wings(), Ax()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomWeapons.count)))
            self.weapon = randomWeapons[randomNumber]
            print("\nThe character has found a treasures box and has changed his old weapon to a \(self.weapon.name). \(self.weapon) 👏.")
        } else {
             // If a magus found the box he will have a healing type of power and not a lethal one
            let randomMagusWeapon = [MagicWand(), Magic()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomMagusWeapon.count)))
            self.weapon = randomMagusWeapon[randomNumber]
            print("\nThe character has found a treasures box and has changed his old weapon to a \(self.weapon.name). \(self.weapon) 👏.")
        }
    }
    
    // Count the life points after fight
    func actionOn(character: Character) {
        if character.weapon is Wings {
            print("\nYour opponent, \(character.name) has wings and he escaped from your attack. /n So he still has \(character.lifePoint) left.")
        } else {
            character.lifePoint = character.lifePoint - self.weapon.strengh
            
            if character.lifePoint < 0 {
                character.lifePoint = 0
            }
            
            print("\n\(character.name), the \(character.type), has been attacked by \(self.name), the \(self.type) with a \(self.weapon.name), he has lost \(self.weapon.strengh) life points and has now only \(character.lifePoint) points left 😢")
        }
    }
    
    // Check if the character is dead
    func isDead() -> Bool {
        return self.lifePoint <= 0
    }
}
