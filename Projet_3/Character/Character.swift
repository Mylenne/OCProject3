//
//  Character.swift
//  Projet_3
//
//  Created by Mylenne  on 03/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Character {
    
    var name: String
    var lifePoint: Int
    var weapon: Weapon
    // maxLifePoint are the Maximum life points that the character can have,
    //the Magus won't be able to give more points than what his team mate initially has, at the beginning of the game
    let maxLifePoint: Int
    
    init(name: String, lifePoint: Int, weapon: Weapon, maxLifePoint: Int){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.maxLifePoint = maxLifePoint
    }
    
    // Introduce the characters lifepoint and strengh
    func present() {
        print("\nThe character has \(self.lifePoint) life points, and can take away \(weapon.strengh) points from his enemy.")
    }
    
    // Count the life points
    func actionOn(character: Character) {
        if character.weapon is Wings {
            print("\nYour opponent, \(character.name) has \(character.weapon) and he escaped from your attack. /n So he still has \(character.lifePoint) left.")
        } else {
            character.lifePoint = character.lifePoint - self.weapon.strengh
            print("\nThe \(character.name) has lost \(self.weapon.strengh) and has now \(character.lifePoint) ")
        }
    }
    
    // See if the character is dead
    func isDead() -> Bool {
        return self.lifePoint <= 0
    }
    // Box with new weapon
    func boxAppear () {
        // if the character is not a Magus it will give one of the randonAttackerWeapon as his new weapon.
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


