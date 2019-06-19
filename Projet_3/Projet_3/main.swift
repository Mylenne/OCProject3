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

// NUMBER OF ROUND FOR CASE 3 : END GAME
var numberOfRound: Int = 0


// MENU
func menu() {
    print("What do you want to do?"
        + "\n1.😺 Start new game 😊"
        + "\n2.😈 Ready to Fight? 😠"
        + "\n3.💀 End game 😱")

    
    let choice = readMenuNumber()
    switch choice {
    case 1: // FIRST SECTION
        numberOfRound = 0
        // TEAM NAME FIRST TEAM
        print("Name your team:")
        team1.name = readName()
        print("Your team name is now \(team1.name)")
        
        // PLAYER NAME FIRST TEAM
        print("Your name:")
        team1.playerName = readPlayerName()
        print("Welcome \(team1.playerName) 😃, you are now in the \(team1.name)'s team ")
        
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
        team2.name = readName()
        print("Your team name is now \(team2.name)")
        
        // SECOND TEAM PLAYER NAME
        print("Your name:")
        team2.playerName = readPlayerName()
        print("Welcome \(team2.playerName) 😃, you are now in the \(team2.name)'s team")
        
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
        
    case 2: //FIGHTS // SECOND SECTION
        if !team1.isDead() && !team2.isDead() {
            
            // COUNT OF ROUND PLAYED
            // WHILE NEITHER ONE OF THE TEAM IS DEAD, FIGHT
            while !(team1.isDead() || team2.isDead()) {
                numberOfRound += 1
                
                team1.fight(team: team2)
                if !(team1.isDead() || team2.isDead()) {
                    team2.fight(team: team1)
                }
            }
           print("GAME OVER, Go to End Game to see the result 😁👀")
        
        } else {
            print("press 1 before the fight")
        }
        
        menu()
        
    case 3: // LAST / THIRD SECTION
        if numberOfRound >= 1 {
            print(" You have played \(numberOfRound) round")
            if team1.isDead() {
                print("Congratulation to \(team2.playerName) in team \(team2.name), you won!!!😉😊👍")
                print("Sorry to \(team1.playerName) in team \(team1.name), you loose 💩🍼")
            } else {
                print("Congratulation to \(team1.playerName) in team \(team1.name), you won!!!😉😊👍")
                print("Sorry to to \(team2.playerName) in team \(team2.name), you loose 💩🍼 ")
            }
            print("END GAME")
        } else {
            print("You exited the game 👎")
        }
    default:
        print("error")
    }
}

menu()
