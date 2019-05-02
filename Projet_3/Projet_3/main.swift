//
//  main.swift
//  Projet_3
//
//  Created by Mylenne  on 18/03/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation



class Team  {
    var playerName = ""
    var name = ""
    var choosenCharacter = [Character]()
}


class Character {
    var name: String
    var lifePoint: Int
    var weapon: String
    var destructionCapacity: Int
    var healingCapacity: Int
    
    init(name: String, lifePoint: Int, weapon: String, destructionCapacity: Int, healingCapacity: Int){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.destructionCapacity = destructionCapacity
        self.healingCapacity = healingCapacity
    }
}


class Fighter: Character {
    init(){
        super.init(name: "", lifePoint: 100, weapon: " a sword", destructionCapacity: -10, healingCapacity: 0)
    }
}

class Magus: Character {
    
    init() {
        super.init(name: "", lifePoint: 50, weapon: "magic", destructionCapacity: 0, healingCapacity: 40)
    }
}

class Colossus: Character {
    
    init() {
        super.init(name: "", lifePoint: 200, weapon: "hand", destructionCapacity: -1, healingCapacity: 0)
    }
}


class Dwarf: Character {
    
    init() {
        super.init(name: "", lifePoint: 30, weapon: "ax", destructionCapacity: -10, healingCapacity: 0)
    }
}

func TeamMove(attacker: Character, opponent: Character) {
    
}

let team1 = Team()
let team2 = Team()

func menu() {
    print("What do you want to do?"
        + "\n1. Start new game"
        + "\n2. Battles"
        + "\n3. End game")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            // NOM DE LEQUIPE
            print("Choose a team name:")
            team1.name = readLine()!
            print("Your team name is now \(team1.name)")
            
            // NOM DU JOUEUR
            print("Your name:")
            if let line = readLine() {
                let name = String(line)
                team1.playerName = name
                print(" Welcome \(team1.playerName), you are now in the \(team1.name)'s team")
            }
            
            // CHoisir les 3 personnages
            for _ in 0..<3 {
                print(" For your first character which one do you choose in your team?"
                    + "\n1. Fighter"
                    + "\n2. Magus"
                    + "\n3. Colossus"
                    + "\n4. Dwarf")
                if let choice = readLine() {
                    switch choice {
                    case"1": // FIGHTER
                        let aFighter = Fighter()
                        print("Give your character a name:")
                        if let line = readLine() {
                            let name = String(line)
                            aFighter.name = name
                            team1.choosenCharacter.append(aFighter)
                            print("Your fighter is now called \(aFighter.name)")
                        }
                        
                    case"2": // MAGUS
                        let aMagus = Magus()
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aMagus.name = name
                            team1.choosenCharacter.append(aMagus)
                            print("Your magus is now called \(aMagus.name)")
                        }
                        
                    case"3": //COLOSSUS
                        let aColossus = Colossus()
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aColossus.name = name
                            team1.choosenCharacter.append(aColossus)
                            print("Your colossus is now called \(aColossus.name)")
                        }
                        
                    case"4": // DWARF
                        let aDwarf = Dwarf()
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aDwarf.name = name
                            team1.choosenCharacter.append(aDwarf)
                            print("Your dwarf is now called \(aDwarf.name)")
                        }
                        
                    default:
                        print("Answer not accepted as a choice for the character")
                    }
                    
                    for character in team1.choosenCharacter {
                        print("\(character) as \(character.name) has \(character.lifePoint) life point")
                    }
                }
            }
            
            // NOM DE LEQUIPE
            print("Second team, please choose a team name:")
            
            
            team2.name = readLine()!
            print("Your team name is now \(team2.name)")
            
            // NOM DU JOUEUR
            print("Your name:")
            if let line = readLine() {
                let name = String(line)
                team2.playerName = name
                print("Welcome \(team2.playerName), you are now in the \(team2.name)'s team")
            }
            
            
            // CHoisir les 3 personnages
            for _ in 0..<3 {
                print(" Team 2 , please choose your 3 characters:"
                    + "\n1. Fighter"
                    + "\n2. Magus"
                    + "\n3. Colossus"
                    + "\n4. Dwarf")
                
                if let choice = readLine() {
                    switch choice {
                    case"1": // FIGHTER
                        let aFighter = Fighter()
                        print("Give your character a name:")
                        if let line = readLine() {
                            let name = String(line)
                            aFighter.name = name
                            team2.choosenCharacter.append(aFighter)
                            print("Your fighter is now called \(aFighter.name)")
                        }
                        
                    case"2": // MAGUS
                        let aMagus = Magus()
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aMagus.name = name
                            team2.choosenCharacter.append(aMagus)
                            print("Your magus is now called \(aMagus.name)")
                        }
                        
                    case"3": //COLOSSUS
                        let aColossus = Colossus()
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aColossus.name = name
                            team2.choosenCharacter.append(aColossus)
                            print("Your colossus is now called \(aColossus.name)")
                        }
                        
                    case"4": // DWARF
                        let aDwarf = Dwarf()
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aDwarf.name = name
                            team2.choosenCharacter.append(aDwarf)
                            print("Your dwarf is now called \(aDwarf.name)")
                        }
                        
                    default:
                        print("Answer not accepted as a choice for the character")
                    }
                }
            }
            
            for character in team2.choosenCharacter {
                print("\(character) as \(character.name) ")
            }
            
            menu()
            
        case "2": //Les combats
            //affichage des personnages et des points de vie
            for character in team1.choosenCharacter {
                print("In \(team1.name), the \(character) as \(character.name) had \(character.lifePoint) life points.")
            }
            for character in team2.choosenCharacter {
                print("In \(team2.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
            }
            
            
            
            // compte rendu de la dernière action
            // Choix du personnage à jouer
            var numberOfChar1 = 1
            
            for character in team1.choosenCharacter {
                print("Press \(numberOfChar1) to choose in \(team1.name), the \(character), \(character.name) as your attacker.")
                numberOfChar1 += 1
            }
            var attackerForTeamMove1 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
            if let line = readLine() {
                let numberForAttacker = Int(line)
                attackerForTeamMove1 = team1.choosenCharacter[numberForAttacker!-1]
                print("\(team1.name) you choosed \(attackerForTeamMove1.name) , the \(attackerForTeamMove1)")
            }
            
            var numberOfChar2 = 1
            var opponentForTeamMove1 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
            for character in team2.choosenCharacter {
                print("Press \(numberOfChar2) to choose in \(team2.name), the \(character) , \(character.name) as your opponent.")
                numberOfChar2 += 1
                
            }
            if let line = readLine() {
                let numberForOpponent = Int(line)
                opponentForTeamMove1 = team2.choosenCharacter[numberForOpponent!-1]
                print("\(team1.name) you choosed \(opponentForTeamMove1.name) , the \(opponentForTeamMove1)")
            }
            
            TeamMove(attacker: attackerForTeamMove1, opponent: opponentForTeamMove1)
            print("\(team1.name),  you choosed the \(attackerForTeamMove1.name), the \(attackerForTeamMove1) as your attacker and \(opponentForTeamMove1.name), the \(opponentForTeamMove1) as your opponent.")
            
            // choix de la cible du personnage
            print("")
            // action du personnage
            
        case "3":
            print("END GAME")
            
        default:
            print("erreur")
        }
    }
}

menu()
