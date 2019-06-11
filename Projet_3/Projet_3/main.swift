//
//  main.swift
//  Projet_3
//
//  Created by Mylenne  on 18/03/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//


import Foundation

let team1 = Team()
let team2 = Team()

let dagger = Dagger()
let sword = Sword()
let fist = Fist()
let magic = Magic()
let magicWand = MagicWand()

var attackerForTeamMove1: Character
var opponentForTeamMove1: Character
var attackerForTeamMove2: Character
var opponentForTeamMove2: Character



// NUMBER OF ROUND FOR CASE 3 : END GAME
var numberOfRound = 0



// MENU
func menu() {
    print("What do you want to do?"
        + "\n1. Start new game"
        + "\n2. Battles"
        + "\n3. End game")
    
    
    let choice = readMenuNumber()
    switch choice {
    case 1:
        // TEAM NAME FIRST TEAM
        print("Choose a team name:")
        let teamName = name()
        team1.name = teamName
        print("Your team name is now \(team1.name)")
        
        
        // PLAYER NAME FIRST TEAM
        print("Your name:")
        let playerName = readPlayerName()
        team1.playerName = playerName
        print(" Welcome \(team1.playerName), you are now in the \(team1.name)'s team")
        
        // INTRODUCING CHARACTERS
        while team1.choosenCharacter.count < 3 {
            print("Team 1, choose \(3 - team1.choosenCharacter.count) characters one by one for your team:"
                + "\n1. \(Fighter.present()) "
                + "\n2. \(Magus.present())"
                + "\n3. \(Colossus.present())"
                + "\n4. \(Dwarf.present())")
            
            // FUNCTION WITH SWITCH THAT CREATE THE CHARACTERS
            team1.choosenCharacter.append(createCharacter())
        }
        
        
        // RECALL MEMBERS OF TEAM 1
        for character in team1.choosenCharacter {
            print("\(character) as \(character.name) has \(character.lifePoint) life point")
        }
        
        
        
        // SECOND TEAM NAME
        print("Second team, please choose a team name:")
        let line = name()
        team2.name = line
        print("Your team name is now \(team2.name)")
        
        // SECOND TEAM PLAYER NAME
        print("Your name:")
        let line2 = readPlayerName()
        team2.name = line2
        print("Welcome \(team2.playerName), you are now in the \(team2.name)'s team")
        
        
        
        // CHOICE OF 3 CHARACTERS
        while team2.choosenCharacter.count < 3 {
            print("Team 2, choose \(3 - team2.choosenCharacter.count) characters one by one for your team:"
                + "\n1. \(Fighter.present()) "
                + "\n2. \(Magus.present())"
                + "\n3. \(Colossus.present())"
                + "\n4. \(Dwarf.present())")
            
            // FUNCTION WITH SWITCH THAT CREATE THE CHARACTERS
            team2.choosenCharacter.append(createCharacter())
        }
        
        
        // RECALL MEMBER OF TEAM 2
        for character in team2.choosenCharacter {
            print("\(character) as \(character.name) ")
        }
        // DISPLAY OF THE MENU TO BEGIN A BATTLE
        menu()
        
    case 2: //FIGHTS
        // COUNT OF ROUND PLAYED
        while !(team1.isDead() || team2.isDead()) {
            numberOfRound += 1
            
            team1.fight(team: team2)
            if !team2.isDead() {
                team2.fight(team: team1)
            }
        }
        
        print("GAME OVER, Go to End Game to see the result")
        
        menu()
        
    case 3:
        print(" You have played \(numberOfRound) round")
        if team1.isDead() {
            print("Congratulation to \(team2.playerName) in team \(team2.name) who won!!!")
        } else {
            print("Congratulation to \(team1.playerName) in team \(team1.name) who won!!!")
        }
        print("END GAME")
        
    default:
        print("error")
    }
}

menu()
