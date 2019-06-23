//
//  Character.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Character structure
class Character {
    // Name of the character
    var name: String
    
    // Number of life point of the character
    var lifePoint: Int
    
    // Weapon of the character
    var weapon: Weapon
    
    // maxLifePoint are the Maximum life points that the character can have,
    //the Magus won't be able to give more points than what his team mate initially has, at the beginning of the game
    let maxLifePoint: Int
    
    // initialize character properties
    init(name: String, lifePoint: Int, weapon: Weapon, maxLifePoint: Int){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.maxLifePoint = maxLifePoint
    }
    
    // Introduce the characters lifepoint and strengh
    func present() {
        print("\(self.name), the \(self) has \(self.lifePoint) life points.")
    }
    
    //  Function that create the choosen character by a switch
    static func create() -> Character {
        var character: Character
        let choice = readCharacterNumber()
        
        switch choice {
        case 1: // FIGHTER
            print("Give your character a name:")
            let line = readName()
            character = Fighter(name: line)
            print("Your fighter is now called \(character.name)")
            
        case 2: // MAGUS
            print("Give your character a name:")
            let line = readName()
            character = Magus(name: line)
            print("Your magus is now called \(character.name)")
            
        case 3: //COLOSSUS
            print("Give your character a name:")
            let line = readName()
            character = Colossus(name: line)
            print("Your colossus is now called \(character.name)")
            
        case 4: // DWARF
            print("Give your character a name:")
            let line = readName()
            character = Dwarf(name: line)
            print("Your dwarf is now called \(character.name)")
            
        default :
            return self.create()
        }
        
        return character
    }
    
    
    // Count the life points after fight
    func actionOn(character: Character) {
        if character.weapon is Wings {
            print("\nYour opponent, \(character.name) has \(character.weapon) and he escaped from your attack. /n So he still has \(character.lifePoint) left.")
        } else {
            character.lifePoint = character.lifePoint - self.weapon.strengh
            print("\n\(character.name), the \(character), has been attacked by \(self.name), the \(self), has lost \(self.weapon.strengh) life points and has now only \(character.lifePoint) points left 😢")
        }
    }
    
    // Check if the character is dead
    func isDead() -> Bool {
        return self.lifePoint <= 0
    }
    
    // Box with new weapon
    func boxAppear () {
        // If the character is not a Magus it will give one of the randonAttackerWeapon as his new weapon.
        if !(self is Magus) {
            let randomWeapon = [Dagger(), Sword(), Fist(), Wings()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomWeapon.count)))
            self.weapon = randomWeapon[randomNumber]
            print("\nThe character has found a box and has changed his old weapon to a \(self.weapon). /n He now has the capacity to take away \(self.weapon.strengh) points from his opponent")
            // if a magus found the box he will have a healing type of power and not a harmful one
        } else {
            let randomMagusWeapon = [MagicWand(), Magic(), Wings()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomMagusWeapon.count)))
            self.weapon = randomMagusWeapon[randomNumber]
            print("\nThe character has found a box and has changed his old weapon to a \(self.weapon). \n that He now has the capacity heal \(self.weapon.strengh) points of his team mate.")
        }
    }
}


