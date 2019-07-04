//
//  main.swift
//  Projet_3
//
//  Created by Mylenne  on 18/03/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

// Instance of the class Team to create team 1 & team 2
var team1 = Team()
var team2 = Team()

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
    case 1: // FIRST SECTION: creation of the 2 teams
        numberOfRound = 0
        team1 = Team.create()
        team2 = Team.create()
        
        // Display of the menu to begin a battle
        menu()
    case 2: // SECOND SECTION : Fights
        // If the player go to case 2 before player if will send him to the else and so, the menu again
        if !team1.isDead() && !team2.isDead() {
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
    case 3: // THIRD SECTION : Result of the fight
        // The result appear only if the players have played
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
