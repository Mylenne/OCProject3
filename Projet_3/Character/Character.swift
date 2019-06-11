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
    let maxLifePoint: Int
    
    init(name: String, lifePoint: Int, weapon: Weapon, maxLifePoint: Int){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.maxLifePoint = maxLifePoint
    }
    
    func present() {
        print(" \(self.lifePoint), \(weapon.strengh)")
    }
    
    func stronger(character: Character) -> Character {
        if self.weapon.strengh > character.weapon.strengh {
            return self
        } else if self.weapon.strengh < character.weapon.strengh {
            return character
        } else if self.lifePoint > character.lifePoint {
            return self
        } else if self.lifePoint < character.lifePoint {
            return character
        } else {
            return self
        }
    }
    func actionOn(character: Character) {
        character.lifePoint = character.lifePoint - self.weapon.strengh
        print("The \(character.name) has lost \(self.weapon.strengh) and has now \(character.lifePoint) ")
    }
    func isDead() -> Bool {
        return self.lifePoint <= 0
    }
    func boxAppear () {
        if !(self is Magus) {
            let randomAttackerWeapon = [Dagger(), Sword(), Fist()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomAttackerWeapon.count)))
            self.weapon = randomAttackerWeapon[randomNumber]
            
        } else {
            let randomMagusWeapon = [MagicWand(), Magic()]
            let randomNumber = Int(arc4random_uniform(UInt32(randomMagusWeapon.count)))
            self.weapon = randomMagusWeapon[randomNumber]
        }
        print("The character has found a box and has changed his old weapon to a \(self.weapon) that he just found and has now the capacity to take away \(self.weapon.strengh) point from his opponent")
        
    }
}
