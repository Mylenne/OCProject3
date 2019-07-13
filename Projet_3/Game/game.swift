//
//  game.swift
//  Projet_3
//
//  Created by Mylenne  on 11/07/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

class Game {
    // Instance of the class Team to create team 1 & team 2
    let team1 = Team()
    let team2 = Team()
    var rounds = 0
    
    func start() {
        // Build the two teams
        self.buildTeams()
        
        // Make teams fight each other
        self.battle()
        
        // Show game results
        self.showResults()
    }
    
    // Build team 1 and team 2
    func buildTeams() {
        print("Hello Team 1!☺😊")
        team1.build()
        
        print("Hello Team 2!☺😊")
        team2.build()
    }
    
    // Battle
    func battle() {
        print("The fight can begin now!!")
        
        // Battle while neither one of the teams is dead
        while !(team1.isDead() || team2.isDead()) {
            self.rounds += 1
            team1.fight(team: team2)
            
            if !(team1.isDead() || team2.isDead()) {
                team2.fight(team: team1)
            }
        }
    }
    
    // Congratulate a team that won over the other
    func congratulate(winner: Team, looser: Team) {
        print("Congratulations to \(winner.playerName) in team \(winner.name), you won!!!😉😊👍")
        print("Sorry \(looser.playerName) in team \(looser.name), you loose 💩🍼")
    }
    
    // Show results
    func showResults() {
        print(" You have played \(self.rounds) round(s)")
        
        if team1.isDead() {
            self.congratulate(winner: team2, looser: team1)
        } else if team2.isDead() {
            self.congratulate(winner: team1, looser: team2)
        }
        
        if !team1.isDead() && !team2.isDead() {
            print("Draw!!")
        }
        
        print("END GAME")
    }
}
