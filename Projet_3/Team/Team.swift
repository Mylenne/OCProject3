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
    
    
    func removeIfDead(character: Character) {
        if character.lifePoint <= 0 {
            character.lifePoint = 0
            if let index = self.choosenCharacter.firstIndex(where: { $0 === character} ) {
                self.choosenCharacter.remove(at: index)
            }
        }
    }
    
    func isDead ()-> Bool {
        
        var additionLifePoint = 0
        for character in choosenCharacter {
            additionLifePoint += character.lifePoint
        }
        let dead = (additionLifePoint == 0)
        return dead
    }
    
    func fight(team: Team) {
        
        print("\(self.name) please choose your attacker in the following choices:")
        
        //DISPLAY OF THE CHARACTERS AND LIFEPOINTS
        for character in self.choosenCharacter {
            print("In \(self.name), the \(character) as \(character.name) had \(character.lifePoint) life points ")
        }
        
        // CHOICES OF CHARACTERS TO ATTACK OR HEAL
        var numberAttackerChoosenByTeam1 = 1
        for character in self.choosenCharacter {
            print("Press \(numberAttackerChoosenByTeam1) to choose in \(self.name), the \(character), \(character.name) as your attacker or healer.")
            numberAttackerChoosenByTeam1 += 1
        }
        
        let line = readChoosenCharacter(aliveCharacters: self.choosenCharacter.count)
        let numberAttacker = line
        let attacker = self.choosenCharacter[numberAttacker-1]
        var opponent: Character
        
        // BOX APPEAR
        
        let randomNumber = arc4random_uniform(UInt32(10))
        if randomNumber == 2 {
            attacker.boxAppear()
        }
        
        if !(attacker is Magus) {
            print("\(self.name) you choosed \(attacker.name) , the \(attacker)")
            print("\(self.name) please choose your opponent in \(team.name) in the following choices:")
            for character in team.choosenCharacter {
                print("In \(team.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
            }
            
            
            // CHOICE OPPONENT OF THE TEAM 1 IN THE TEAM 2
            var number = 1
            for character in team.choosenCharacter {
                print("Press \(number) to choose in \(team.name), the \(character) , \(character.name) as your opponent")
                number += 1
            }
            
            let numberOpponent = readChoosenCharacter(aliveCharacters: team.choosenCharacter.count)
            opponent = team.choosenCharacter[numberOpponent-1]
            print("\(self.name),  you choosed the \(attacker.name), the \(attacker) as your attacker and \(opponent.name), the \(opponent) as your opponent.")
            
            
            
            // IF ITS MAGUS IT HEALS IT DOESNT ATTACK
        } else {
            print("\(self.name) please choose your teammate in \(self.name) in the following choices to heal him:")
            for character in self.choosenCharacter {
                print("In \(self.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
            }
            
            var numberTeamMate = 1
            for character in self.choosenCharacter {
                print("Press \(numberTeamMate) to choose in \(self.name), the \(character) , \(character.name) as your teammate")
                numberTeamMate += 1
                
            }
            
            let numberForTeamMate = readChoosenCharacter(aliveCharacters: self.choosenCharacter.count)
            opponent = self.choosenCharacter[numberForTeamMate-1]
            print("\(self.name) you choosed \(opponent.name) , the \(opponent)")
            // Written opponentForTeamMove1 But it's the teammate choosen to be healed
            
        }
        
        attacker.actionOn(character: opponent)
        
        team.removeIfDead(character: opponent)
    }
}
