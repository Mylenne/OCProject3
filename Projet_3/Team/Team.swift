//
//  team.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Team {
    
    var playerName = ""
    var name = ""
    var choosenCharacter = [Character]()
   
    // REMOVE DEAD CHARACTER FROM ARRAY "CHOOSENCHARACTER"
    func removeIfDead(character: Character) {
        if character.isDead() {
            character.lifePoint = 0
            print("\(character.name) is Dead")
            if let index = self.choosenCharacter.firstIndex(where: { $0 === character} ) {
                self.choosenCharacter.remove(at: index)
            }
        }
    }
    
    // FUNCTION THAT MAKE SURE ALL CHARACTER IS DEAD
    func isDead() -> Bool {
        return self.choosenCharacter.isEmpty
    }
    
    // IF THERE IS ONLY A MAGUS LEFT, GAME OVER FOR TEAM BECAUSE HE CAN ONLY HEAL
    func magusLeft() -> Bool {
        if (self.choosenCharacter.count == 1) && (self.choosenCharacter[0] is Magus) {
            self.choosenCharacter[0].lifePoint = 0
            self.removeIfDead(character: self.choosenCharacter[0])
            print("Team \(self.name) you only have a Magus left and a Magus can only heal, game over 😥😭💀")
            return true
        }
        return false
    }
    
    // Function fight between 2 characters
    func fight(team: Team) {
        // if the characters of the team left isn't only a magus:
        
        if !self.magusLeft() {
            print("\(self.name) please choose your attacker in the following choices:")
            //DISPLAY OF THE CHARACTERS AND LIFEPOINTS
            print("In the \(self.name) team: ")
            for character in self.choosenCharacter {
                print( "\(character.name), the \(character) has \(character.lifePoint) life points left ")
            }
            print("")
            
            // CHOICES OF CHARACTERS TO ATTACK OR HEAL
            var number = 1
            for character in self.choosenCharacter {
                    print("Press \(number) to choose \(character.name), the \(character), as your attacker .")
                    number += 1
            }
            
            // CHOICE MADE BY GAMER OF THE ATTACKER BETWEEN ALIVE CHARACTER
            let line = readChoosenCharacter(aliveCharacters: self.choosenCharacter.count)
            let attacker = self.choosenCharacter[line-1]
            var opponent: Character
            
            // BOX APPEAR
            let randomNumber = arc4random_uniform(UInt32(10))
            if randomNumber == 2 {
                attacker.boxAppear()
            }
            
            // IF THE ATTACKER IS NOT A MAGUS, INTRODUCING CHOICE AS AN OPPONENT FOR HIM
            if !(attacker is Magus) {
                print("\(self.name) you choosed \(attacker.name) , the \(attacker)")
                print("\(self.name) please choose your opponent in \(team.name) in the following choices: \nIn the \(team.name) team:")
                
        
                for character in team.choosenCharacter {
                    print("\(character.name), the \(character) has \(character.lifePoint) life points left.")
                }
                 print("")
                
                // CHOICE POSSIBLE AS OPPONENT OF THE TEAM 1 IN THE TEAM 2
                var number = 1
                for character in team.choosenCharacter {
                    print("Press \(number) to choose in \(team.name), the \(character), \(character.name).")
                    number += 1
                }
                
                // CHOICE MADE BY THE TEAM FOR AN OPPONENT
                let numberOpponent = readChoosenCharacter(aliveCharacters: team.choosenCharacter.count)
                opponent = team.choosenCharacter[numberOpponent-1]
                print("\(self.name),  you choosed the \(attacker.name), the \(attacker) as your attacker and \(opponent.name), the \(opponent) as your opponent.")
                
                
                
                // IF ITS MAGUS IT HEALS IT DOESNT ATTACK
            } else {
                print("\(self.name) please choose your teammate in \(self.name) in the following choices to heal him: \nIn the \(self.name) team:")
                
                for character in self.choosenCharacter {
                    print("\(character.name), the \(character) has \(character.lifePoint) life points left.")
                }
                
                // INTRODUCING WHICH TEAMMATE HE WANTS TO SAVE
                var number = 1
                for character in self.choosenCharacter {
                    print("Press \(number) to save \(character.name), the \(character)")
                    number += 1
                }
                
                // CHOICE MADE AS TEAMMATE HE WANTS TO SAVE
                let numberTeamMate = readChoosenCharacter(aliveCharacters: self.choosenCharacter.count)
                opponent = self.choosenCharacter[numberTeamMate-1]
                print("\(self.name) you choosed \(opponent.name) , the \(opponent)")
                // Written opponentForTeamMove1 But it's the teammate choosen to be healed
                
            }
            // ATTACKER ATTACKS OPPONENT
            attacker.actionOn(character: opponent)
            // REMOVED IF OPPONENT IS DEAD FROM HIS OWN TEAM
            team.removeIfDead(character: opponent)
        }
    }
}
