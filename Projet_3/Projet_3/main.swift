//
//  main.swift
//  ici
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
    
    init(name: String){
        self.name = name
    }
}


class Fighter: Character {
    var lifePoint = 100
    var weapon = "a sword"
    var destructionCapacity = -10
    var healingCapacity = 0
}

class Magus: Character {
    
    var lifePoint = 50
    var weapon = "magic"
    var destructionCapacity = 0
    var healingCapacity = 40
}

class Colossus: Character {
    
    var lifePoint = 200
    var weapon = "hand"
    var destructionCapacity = -1
    var healingCapacity = 0
}

class Dwarf: Character {
    var lifePoint = 30
    var weapon = "ax"
    var destructionCapacity = -10
    var healingCapactity = 0
}


func menu() {
    print("What do you want to do?"
        + "\n1. Start new game"
        + "\n2. Battles"
        + "\n3. End game")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            // NOM DE LEQUIPE
            print("Choose a team name")
            let team1 = Team()
            team1.name = readLine()!
            print("Your team name is now \(team1.name)")
            
            // NOM DU JOUEUR
            print(" Votre nom")
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
                        let aFighter = Fighter(name: "")
                        print("Give your character a name:")
                        if let line = readLine() {
                            let name = String(line)
                            aFighter.name = name
                            team1.choosenCharacter.append(aFighter)
                            print("Your fighter is now called \(aFighter.name)")
                        }
                        
                    case"2": // MAGUS
                        let aMagus = Magus(name: "")
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aMagus.name = name
                            team1.choosenCharacter.append(aMagus)
                            print("Your magus is now called \(aMagus.name)")
                        }
                        
                    case"3": //COLOSSUS
                        let aColossus = Colossus(name: "")
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aColossus.name = name
                            team1.choosenCharacter.append(aColossus)
                            print("Your colossus is now called \(aColossus.name)")
                        }
                        
                    case"4": // DWARF
                        let aDwarf = Dwarf(name: "")
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
                        print("\(character) as \(character.name) ")
                    }
                }
            }
            
            // NOM DE LEQUIPE
            print("Second team, please choose a team name:")
            
            let team2 = Team()
            team2.name = readLine()!
            print("Your team name is now \(team2.name)")
            
            // NOM DU JOUEUR
            print("Votre nom")
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
                        let aFighter = Fighter(name: "")
                        print("Give your character a name:")
                        if let line = readLine() {
                            let name = String(line)
                            aFighter.name = name
                            team2.choosenCharacter.append(aFighter)
                            print("Your fighter is now called \(aFighter.name)")
                        }
                        
                    case"2": // MAGUS
                        let aMagus = Magus(name: "")
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aMagus.name = name
                            team2.choosenCharacter.append(aMagus)
                            print("Your magus is now called \(aMagus.name)")
                        }
                        
                    case"3": //COLOSSUS
                        let aColossus = Colossus(name: "")
                        print("Donner un nom au personnage")
                        if let line = readLine() {
                            let name = String(line)
                            aColossus.name = name
                            team2.choosenCharacter.append(aColossus)
                            print("Your colossus is now called \(aColossus.name)")
                        }
                        
                    case"4": // DWARF
                        let aDwarf = Dwarf(name: "")
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
            
        case "2": //Les combats
            print(" fonctions avec switch pour affichage des points etc")
            
        case "3": // Fin de partie
            print("END GAME")
            
        default:
            print("erreur")
        }
    }
}

menu()


