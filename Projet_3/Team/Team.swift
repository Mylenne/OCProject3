//
//  Team.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Team structure
class Team {
    // The player's name in the team
    var playerName = ""
    
    // The name of the team
    var name = ""
    
    // Array of all the character of the team
    var choosenCharacter = [Character]()
    
    // Function that removes dead character from array "choosenCharacter"
    func removeIfDead(character: Character) {
        if character.isDead() {
            character.lifePoint = 0
            print("\(character.name) is Dead")
            
            if let index = self.choosenCharacter.firstIndex(where: { $0 === character} ) {
                self.choosenCharacter.remove(at: index)
            }
        }
    }
    
    // Function that make sure all characters are dead
    func isDead() -> Bool {
        return self.choosenCharacter.isEmpty
    }
    
    // If there is only a magus left, game over for team because he can only heal
    func magusLeft() -> Bool {
        if (self.choosenCharacter.count == 1) && (self.choosenCharacter[0] is Magus) {
            self.choosenCharacter[0].lifePoint = 0
            self.removeIfDead(character: self.choosenCharacter[0])
            
            print("Team \(self.name) you only have a Magus left and a Magus can only heal, game over 😥😭💀")
            return true
        }
        return false
    }
    
    // Returns true if the current team has only magus characters
    func onlyMagus() -> Bool {
        var hasOnlyMagus = true
        
        for character in choosenCharacter {
            if !(character is Magus) {
                hasOnlyMagus = false
            }
        }
        
        return hasOnlyMagus
    }
    
    // Function that let the player choose a character from the team
    func chooseCharacter() -> Character {
        var number = 1
        for character in self.choosenCharacter  {
            print("Press \(number) to choose \(character.name), the \(character).")
            number += 1
        }
        let index = readChoosenCharacter(aliveCharacters: self.choosenCharacter.count)
        return self.choosenCharacter[index-1]
    }
    
    //Display of the characters and life points
    func presentCharacters() {
        for character in self.choosenCharacter {
            character.present()
        }
        print("")
    }
    
    // Create a team
    static func create() -> Team {
        let team = Team()
        
        // TEAM NAME
        print("Name your team:")
        team.name = readName()
        
        // PLAYER NAME
        print("Your name:")
        team.playerName = readPlayerName()
        print("Welcome \(team.playerName) 😃, you are now in the \(team.name)'s team ")
        
        // INTRODUCING CHARACTERS
        while team.choosenCharacter.count < 3 {
            print("Team \(team.name), choose \(3 - team.choosenCharacter.count) characters one by one for your team:"
                + "\n1. \(Fighter.present()) "
                + "\n2. \(Magus.present())"
                + "\n3. \(Colossus.present())"
                + "\n4. \(Dwarf.present())")
            
            // FUNCTION WITH SWITCH THAT CREATE THE CHARACTERS
            team.choosenCharacter.append(Character.create())
        }
        // RECALL MEMBERS OF THE TEAM
        team.presentCharacters()
        
        return team
    }
    
    // Function fight between 2 characters
    func fight(team: Team) {
        // If the two teams have only magus characters or the remaining character of the current team is a magus
        // then there can be no fight
        if self.onlyMagus() && team.onlyMagus() {
            print("Team \(self.name) and team \(team.name) you only have Magus characters in your teams, the game is tied 😥😭💀")
            self.choosenCharacter = []
            team.choosenCharacter = []
        } else if !self.magusLeft() {
            // Choice of the attacker made by the player, between alive characters
            print("\(self.name) please choose your attacker in your team:")
            self.presentCharacters()
            let attacker = self.chooseCharacter()
            var opponent: Character
            
            // Box with treasure appears
            let randomNumber = arc4random_uniform(UInt32(10))
            if randomNumber == 2 {
                attacker.boxAppear()
            }
            
            // If the attacker is not a magus, introducing choice as an opponent for the player
            if !(attacker is Magus) {
                print("\(self.name) please choose your opponent in \(team.name):\n")
                team.presentCharacters()
                opponent = team.chooseCharacter()
            } else {
                //If it's magus it heals it doesn't attacks and must choose a team mate from his own team
                print("\(self.name), choose your team mate in \(self.name) to heal him:")
                self.presentCharacters()
                opponent = self.chooseCharacter()
            }
            
            // Attacker attacks opponent or save team mate
            attacker.actionOn(character: opponent)

            // Removed of opponent is dead from his own team
            team.removeIfDead(character: opponent)
        }
    }
}
