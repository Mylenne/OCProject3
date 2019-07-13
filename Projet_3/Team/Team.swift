//
//  Team.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

class Team {
    // Maximum number of members
    static let maxMembers = 3
    
    // The player's name in the team
    var playerName = ""
    
    // The name of the team
    var name = ""
    
    // Array of team members
    var members = [Character]()
    
    // Build the team
    func build() {
        // Team name
        print("Please name your team:")
        self.name = Utils.readName()
        
        // Player name
        print("Your name:")
        self.playerName = Utils.readPlayerName()

        print("Welcome \(self.playerName) 😃, you are now in the \(self.name)'s team ")
        
        // Introducing characters
        print("Team \(self.name), choose \(Team.maxMembers) members one by one for your team.")
        while self.members.count < Team.maxMembers {
            // Create the character and add it to members array
            self.createAndAddMember()
        }
        
        // Present team members created
        self.presentMembers()
    }
    
    // Create and add a member to the team
    func createAndAddMember() {
        if (self.members.count < Team.maxMembers) {
            print("Character \(self.members.count + 1), choose between:"
                + "\n1. \(Fighter.present()) "
                + "\n2. \(Magus.present())"
                + "\n3. \(Colossus.present())"
                + "\n4. \(Dwarf.present())")
            let choice = Utils.readNumber(minimum: 1, maximum: 4)
            
            switch choice {
            case 1: // FIGHTER
                print("Give your fighter a name:")
                let fighter = Fighter(name: Utils.readName())
                self.members.append(fighter)
                print("\(fighter)\(fighter.weapon)\n")
            case 2: // MAGUS
                print("Give your magus a name:")
                let magus = Magus(name: Utils.readName())
                self.members.append(magus)
                print("\(magus)\(magus.weapon)\n")
            case 3: //COLOSSUS
                print("Give your colossus a name:")
                let colossus = Colossus(name: Utils.readName())
                self.members.append(colossus)
                print("\(colossus)\(colossus.weapon)\n")
            case 4: // DWARF
                print("Give your dwarf a name:")
                let dwarf = Dwarf(name: Utils.readName())
                self.members.append(dwarf)
                print("\(dwarf)\(dwarf.weapon)\n")
            default :
                print("Unknown character number")
            }
        }
    }
    
    // Print team members description
    func presentMembers() {
        for character in self.members {
            print(character)
        }
        
        print("")
    }
    
    // Choose a member in the team
    func chooseMember() -> Character {
        var number = 1
        
        for character in self.members  {
            print("Press \(number) to choose \(character.name), the \(character.type).")
            number += 1
        }
        
        let index = Utils.readNumber(minimum: 1, maximum: self.members.count)
        return self.members[index-1]
    }
    
    // Fight another team
    func fight(team: Team) {
        // If the two teams have only magus characters or the remaining character of the current team is a magus
        // then there can be no fight
        if self.onlyMagus() && team.onlyMagus() {
            print("Team \(self.name) and team \(team.name) you only have Magus characters in your teams, the game is tied 😥😭💀")
            self.members = []
            team.members = []
        } else if !self.magusLeft() {
            // Choice of the attacker made by the player, between alive characters
            print("\(self.name) please choose your attacker in your team:")
            self.presentMembers()
            let attacker = self.chooseMember()
            var opponent: Character
            
            // Box with treasure appears
            let randomNumber = arc4random_uniform(UInt32(10))
            if randomNumber == 2 {
                attacker.boxAppear()
            }
            
            // If the attacker is not a magus, introducing choice as an opponent for the player
            if !(attacker is Magus) {
                print("\(self.name) please choose your opponent in \(team.name):\n")
                team.presentMembers()
                opponent = team.chooseMember()
            } else {
                // If it's magus it heals it doesn't attacks and must choose a team mate from his own team
                print("\(self.name), choose your team mate in \(self.name) to heal him:")
                self.presentMembers()
                opponent = self.chooseMember()
            }
            
            // Attacker attacks opponent or save team mate
            attacker.actionOn(character: opponent)

            // Removed of opponent is dead from his own team
            team.removeIfDead(character: opponent)
        }
    }
    
    // Removes dead character from members
    func removeIfDead(character: Character) {
        if character.isDead() {
            character.lifePoint = 0
            print("\(character.name) is Dead")
            
            if let index = self.members.firstIndex(where: { $0 === character} ) {
                self.members.remove(at: index)
            }
        }
    }
    
    // A team is dead if it has no members
    func isDead() -> Bool {
        return self.members.isEmpty
    }
    
    // Returns true if the current team has only magus characters
    func onlyMagus() -> Bool {
        var hasOnlyMagus = true
        
        for character in members {
            if !(character is Magus) {
                hasOnlyMagus = false
            }
        }
        
        return hasOnlyMagus
    }
    
    // If there is only a magus left, game over for team because he can only heal
    func magusLeft() -> Bool {
        if (self.members.count == 1) && (self.members[0] is Magus) {
            self.members[0].lifePoint = 0
            self.removeIfDead(character: self.members[0])
            
            print("Team \(self.name) you only have a Magus left and a Magus can only heal, game over 😥😭💀")
            return true
        }
        
        return false
    }
}
