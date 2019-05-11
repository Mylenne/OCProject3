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
        super.init(name: "", lifePoint: 200, weapon: "hand", destructionCapacity: -5, healingCapacity: 0)
    }
}


class Dwarf: Character {
    
    init() {
        super.init(name: "", lifePoint: 30, weapon: "ax", destructionCapacity: -50, healingCapacity: 0)
    }
}


let team1 = Team()
let team2 = Team()

// IF ONE OF THE TWO TEAMS HAS ALL THEIR CHARACTERS DEAD: THE GAME IS OVER
func notAllDead() -> Bool {
    if  team1.choosenCharacter[0].lifePoint != 0 && team1.choosenCharacter[1].lifePoint != 0 && team1.choosenCharacter[2].lifePoint != 0  || team2.choosenCharacter[0].lifePoint != 0 && team2.choosenCharacter[1].lifePoint != 0 && team2.choosenCharacter[2].lifePoint != 0
    {
        return true
    } else {
        return false
    }
}

// NUMBER OF ROUND FOR CASE 3 : END GAME
var numberOfRound = 0

// COUNT OF POINTS DURING BATTLES OR HEALING
func TeamMove(attacker: Character, opponent: Character) {
    if attacker is Magus && opponent.lifePoint > 0 && ((opponent is Fighter && opponent.lifePoint < 100) || (opponent is Magus && opponent.lifePoint < 50) || (opponent is Colossus && opponent.lifePoint < 200) || (opponent is Dwarf && opponent.lifePoint < 50)) {
        opponent.lifePoint = opponent.lifePoint + attacker.healingCapacity
        print("You saved your teammate and he now has \(opponent.lifePoint)")
    }
    
    if !(attacker is Magus)  {
        opponent.lifePoint = opponent.lifePoint + attacker.destructionCapacity
    }
    if opponent.lifePoint <= 0 {
        opponent.lifePoint = 0
    }
    if opponent.lifePoint > 0 && !(attacker is Magus) {
        print("The opponent has lost \(attacker.destructionCapacity) points and has now only or still \(opponent.lifePoint) life points left")
    } else {
        opponent.destructionCapacity = 0
        opponent.healingCapacity = 0
        print("The opponent is dead and has lost \(attacker.destructionCapacity), you cannot save him with a Magus")
    }
}


func menu() {
    print("What do you want to do?"
        + "\n1. Start new game"
        + "\n2. Battles"
        + "\n3. End game")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            // TEAM NAME
            print("Choose a team name:")
            team1.name = readLine()!
            print("Your team name is now \(team1.name)")
            
            // PLAYER NAME
            print("Your name:")
            team1.playerName = readLine()!
            print(" Welcome \(team1.playerName), you are now in the \(team1.name)'s team")
            
            
            // CHOICES FOR THE 3 CHARACTERS BY TEAM
            for _ in 0..<3 {
                print("Team 1, choose 3 characters one by one for your team:"
                    + "\n1. The FIGHTER has 100 life point and can take away 10 point from his opponent with his sword."
                    + "\n2. The MAGUS has 50 life point, he has the power to heals people in his own team"
                    + "\n3. The COLOSSUS has 200 life point and fights with his bare hands which can take away 5 points from his opponent"
                    + "\n4. The DWARF has 30 life point,has ax and can take 50 point away from his opponent.")
                
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
                    // RECALL MEMBERS OF TEAM 1
                    for character in team1.choosenCharacter {
                        print("\(character) as \(character.name) has \(character.lifePoint) life point")
                    }
                }
            }
            
            // SECOND TEAM NAME
            print("Second team, please choose a team name:")
            team2.name = readLine()!
            print("Your team name is now \(team2.name)")
            
            // SECOND TEAM PLAYER NAME
            print("Your name:")
            if let line = readLine() {
                let name = String(line)
                team2.playerName = name
                print("Welcome \(team2.playerName), you are now in the \(team2.name)'s team")
            }
            
            
            
            // CHOICE OF 3 CHARACTERS
            for roundChar in 0..<3 {
                print("Team 2, choose \(3-roundChar) characters one by one for your team:"
                    + "\n1. The FIGHTER has 100 life point and can take away 10 point from his opponent with his sword."
                    + "\n2. The MAGUS has 50 life point, he has the power to heals people in his own team"
                    + "\n3. The COLOSSUS has 200 life point and fights with his bare hands which can take away 5 points from his opponent"
                    + "\n4. The DWARF has 30 life point,has ax and can take 50 point away from his opponent.")
                
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
                        print("Give your character a name:")
                        if let line = readLine() {
                            let name = String(line)
                            aMagus.name = name
                            team2.choosenCharacter.append(aMagus)
                            print("Your magus is now called \(aMagus.name)")
                        }
                        
                    case"3": //COLOSSUS
                        let aColossus = Colossus()
                        print("Give your character a name:")
                        if let line = readLine() {
                            let name = String(line)
                            aColossus.name = name
                            team2.choosenCharacter.append(aColossus)
                            print("Your colossus is now called \(aColossus.name)")
                        }
                        
                    case"4": // DWARF
                        let aDwarf = Dwarf()
                        print("Give your character a name:")
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
            // RECALL MEMBER OF TEAM 2
            for character in team2.choosenCharacter {
                print("\(character) as \(character.name) ")
            }
            // DISPLAY OF THE MENU TO BEGIN A BATTLE
            menu()
            
        case "2": //FIGHTS
            // COUNT OF ROUND PLAYED
            while notAllDead() == true {
                numberOfRound += 1
                
                //DISPLAY OF THE CHARACTERS AND LIFEPOINTS
                print("\(team1.name) please choose your attacker in the following choices:")
                //DISPLAY OF THE CHARACTERS AND LIFEPOINTS
                for character in team1.choosenCharacter {
                    print("In \(team1.name), the \(character) as \(character.name) had \(character.lifePoint) life points ")
                }
                
                // CHOICES OF CHARACTERS TO ATTACK OR HEAL
                var numberAttackerChoosenByTeam1 = 1
                for character in team1.choosenCharacter {
                    print("Press \(numberAttackerChoosenByTeam1) to choose in \(team1.name), the \(character), \(character.name) as your attacker or healer.")
                    numberAttackerChoosenByTeam1 += 1
                }
                
                // CHOICE ATTACKER FOR TEAM 1
                var attackerForTeamMove1 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
                var opponentForTeamMove1 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
                
                if let line = readLine() {
                    let numberForAttacker = Int(line)!
                    attackerForTeamMove1 = team1.choosenCharacter[numberForAttacker-1]
                    if !(attackerForTeamMove1 is Magus) {
                        print("\(team1.name) you choosed \(attackerForTeamMove1.name) , the \(attackerForTeamMove1)")
                        print("\(team1.name) please choose your opponent in \(team2.name) in the following choices:")
                        for character in team2.choosenCharacter {
                            print("In \(team2.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
                        }
                        
                        // CHOICE OPPONENT OF THE TEAM 1 IN THE TEAM 2
                        var numberOpponentChoosenByTeam1 = 1
                        for character in team2.choosenCharacter {
                            print("Press \(numberOpponentChoosenByTeam1) to choose in \(team2.name), the \(character) , \(character.name) as your opponent")
                            numberOpponentChoosenByTeam1 += 1
                        }
                        
                        if let line = readLine() {
                            let numberForOpponent = Int(line)
                            opponentForTeamMove1 = team2.choosenCharacter[numberForOpponent!-1]
                            print("\(team1.name) you choosed \(opponentForTeamMove1.name) , the \(opponentForTeamMove1)")
                        }
                        
                        
                        print("\(team1.name),  you choosed the \(attackerForTeamMove1.name), the \(attackerForTeamMove1) as your attacker and \(opponentForTeamMove1.name), the \(opponentForTeamMove1) as your opponent.")
                        
                        TeamMove(attacker: attackerForTeamMove1, opponent: opponentForTeamMove1)
                        // IF ITS MAGUS IT HEALS IT DOESNT ATTACK
                    } else {
                        print("\(team1.name) please choose your teammate in \(team1.name) in the following choices to heal him:")
                        for character in team1.choosenCharacter {
                            print("In \(team1.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
                        }
                        
                        var numberTeamMate = 1
                        for character in team1.choosenCharacter {
                            print("Press \(numberTeamMate) to choose in \(team1.name), the \(character) , \(character.name) as your teammate")
                            numberTeamMate += 1
                            
                        }
                        
                        if let line = readLine() {
                            let numberForTeamMate = Int(line)
                            opponentForTeamMove1 = team1.choosenCharacter[numberForTeamMate!-1]
                            print("\(team1.name) you choosed \(opponentForTeamMove1.name) , the \(opponentForTeamMove1)")
                            // Written opponentForTeamMove1 But it's the teammate choosen to be healed
                            TeamMove(attacker: attackerForTeamMove1, opponent: opponentForTeamMove1)
                        }
                    }
                }
                
                
                // TEAM MOVE 2
                
                // CHOOSE AN ATTACKER AND AN OPPONENT
                print("\(team2.name) please choose your attacker in the following choices:")
                for character in team2.choosenCharacter {
                    print("In \(team2.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
                }
                
                // CHOICE OF AN ATTACKER OR A HEALER
                var attackerForTeamMove2 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
                var opponentForTeamMove2 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
                
                var numberAttackerChoosenByTeam2 = 1
                for character in team2.choosenCharacter {
                    print("Press \(numberAttackerChoosenByTeam2) to choose in \(team2.name), the \(character), \(character.name) as your attacker or your healer.")
                    numberAttackerChoosenByTeam2 += 1
                }
                
                // FIGHTS IF IT S NOT A MAGUS : CHOICES CHARACTERS FROM TEAM 1 TO CHOOSE AN OPPONENT
                if let line = readLine() {
                    let numberForAttacker = Int(line)!
                    attackerForTeamMove2 = team2.choosenCharacter[numberForAttacker-1]
                    if !(attackerForTeamMove2 is Magus) {
                        print("\(team2.name) you choosed \(attackerForTeamMove2.name) , the \(attackerForTeamMove2)")
                        print("\(team2.name) please choose your opponent in the \(team1.name) in the following choices:")
                        for character in team1.choosenCharacter {
                            print("In \(team1.name), the \(character) as \(character.name) had \(character.lifePoint) life points .")
                        }
                        // TEAM 2 CHOOSE AN OPPONENT FROM TEAM 1
                        var numberOpponentChoosenByTeam2 = 1
                        var opponentForTeamMove2 = Character(name: "", lifePoint: 0, weapon: "", destructionCapacity: 0, healingCapacity: 0)
                        for character in team1.choosenCharacter {
                            print("Press \(numberOpponentChoosenByTeam2) to choose in \(team2.name), the \(character) , \(character.name) as your opponent.")
                            numberOpponentChoosenByTeam2 += 1
                        }
                        if let line = readLine() {
                            let numberForOpponent = Int(line)
                            opponentForTeamMove2 = team1.choosenCharacter[numberForOpponent!-1]
                            print("\(team2.name) you choosed \(opponentForTeamMove2.name) , the \(opponentForTeamMove2)")
                        }
                        
                        print("\(team2.name),  you choosed the \(attackerForTeamMove2.name), the \(attackerForTeamMove2) as your attacker and \(opponentForTeamMove2.name), the \(opponentForTeamMove2) as your opponent.")
                        
                        TeamMove(attacker: attackerForTeamMove2, opponent: opponentForTeamMove2)
                        
                    } else {
                        print("\(team2.name) please choose your teammate in \(team2.name) in the following choices to heal him:")
                        for character in team2.choosenCharacter {
                            print("In \(team2.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
                        }
                        
                        var numberTeamMate = 1
                        for character in team2.choosenCharacter {
                            print("Press \(numberTeamMate) to choose in \(team2.name), the \(character) , \(character.name) as your teammate")
                            numberTeamMate += 1
                            
                        }
                        
                        if let line = readLine() {
                            let numberForTeamMate = Int(line)
                            opponentForTeamMove2 = team2.choosenCharacter[numberForTeamMate!-1]
                            print("\(team2.name) you choosed \(opponentForTeamMove2.name) , the \(opponentForTeamMove2)")
                            // Written opponentForTeamMove2 But it's the teammate choosen to be healed
                            TeamMove(attacker: attackerForTeamMove2, opponent: opponentForTeamMove2)
                        }
                    }
                }
            }
        case "3":
            print(" You have played \(numberOfRound) round")
            print("END GAME")
            
        default:
            print("error")
        }
    }
}



menu()

