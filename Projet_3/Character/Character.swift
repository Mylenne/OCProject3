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
    
    // Number of life points of the character
    var lifePoint: Int
    
    // Weapon of the character
    var weapon: Weapon
    
    // maxLifePoint is the Maximum life points that the character can have,
    // The Magus won't be able to give more points than what his team mate initially has, at the beginning of the game
    let maxLifePoint: Int
    
    // Initialize character properties
    init(name: String, lifePoint: Int, weapon: Weapon, maxLifePoint: Int){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.maxLifePoint = maxLifePoint
    }
    
    // Introduce the characters lifepoint and strengh
    func present() {
        print("\(self.name), the \(self) has \(self.lifePoint) life points and can take away \(self.weapon.strengh) points. He has a \(self.weapon.name). \(self.weapon.description())")
    }
    
    // Function that create the choosen character by a switch
    public static func create() -> Character {
        var character: Character
        let choice = readCharacterNumber()
        
        switch choice {
        case 1: // FIGHTER
            print("Give your character a name:")
            let line = readName()
            character = Fighter(name: line)
            character.present()
            print("\n")
            
        case 2: // MAGUS
            print("Give your character a name:")
            let line = readName()
            character = Magus(name: line)
            character.present()
            print("\n")
            
        case 3: //COLOSSUS
            print("Give your character a name:")
            let line = readName()
            character = Colossus(name: line)
            character.present()
            print("\n")
            
        case 4: // DWARF
            print("Give your character a name:")
            let line = readName()
            character = Dwarf(name: line)
            character.present()
            print("\n")
            
        default :
            return self.create()
        }
        return character
    }
    
    // Check if the character is dead
    func isDead() -> Bool {
        return self.lifePoint <= 0
    }
    
    // Count the life points after fight
    func actionOn(character: Character) {
        if character.weapon is Wings {
            print("\nYour opponent, \(character.name) has \(Wings.wings) and he escaped from your attack. /n So he still has \(character.lifePoint) left.")
        } else {
            character.lifePoint = character.lifePoint - self.weapon.strengh
            
            if character.lifePoint < 0 {
                character.lifePoint = 0
            }
            print("\n\(character.name), the \(character), has been attacked by \(self.name), the \(self) with a \(self.weapon), he has lost \(self.weapon.strengh) life points and has now only \(character.lifePoint) points left 😢")
        }
    }
    
    // Box with new weapons
    func boxAppear () {
        // If the character is not a Magus it will give one of the randonAttackerWeapon as his new weapon.
        if !(self is Magus) {
            let randomWeapons = [Dagger(), Sword(), Wings(), Ax()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomWeapons.count)))
            self.weapon = randomWeapons[randomNumber]
            print("\nThe character has found a treasures box and has changed his old weapon to a \(self.weapon.name). \(self.weapon.description()) 👏.")
            
            // If a magus found the box he will have a healing type of power and not a lethal one
        } else {
            let randomMagusWeapon = [MagicWand(), Magic()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomMagusWeapon.count)))
            self.weapon = randomMagusWeapon[randomNumber]
            print("\nThe character has found a treasures box and has changed his old weapon to a \(self.weapon.name). \(self.weapon.description()) 👏.")
        }
    }
}
