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
            for character in team1.choosenCharacter {
                print("In \(team1.name), the \(character) as \(character.name) had \(character.lifePoint) life point.")
            }
            
            
            
            for character in team2.choosenCharacter {
                print("In \(team2.name), the \(character) as \(character.name) has \(character.lifePoint) life point.")
            }
        case "3":
            print("END GAME")
            
        default:
            print("erreur")
        }
    }
}

menu()
