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
    
    func isDead ()-> Bool {
        
        var additionLifePoint = 0
        for character in choosenCharacter {
            additionLifePoint += character.lifePoint
        }
        let dead = (additionLifePoint == 0)
        return dead
    }
}



class Character {
    var name: String
    var lifePoint: Int
    var weapon: CharacterWeapon
    
    init(name: String, lifePoint: Int, weapon: CharacterWeapon){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
    }
}

class CharacterWeapon {
    var name: String
    
    init(name: String){
        self.name = name
    }
}

class HealingPower: CharacterWeapon {
    var healingCapacity: Int
    
    init(name: String, healingCapacity: Int) {
        self.healingCapacity = healingCapacity
        super.init(name: name)
    }
}

class LethalWeapon: CharacterWeapon {
    var destructionCapacity: Int
    
    init(name: String, destructionCapacity: Int) {
        self.destructionCapacity = destructionCapacity
        super.init(name: name)
    }
}


let dagger = LethalWeapon(name: "Dagger", destructionCapacity: -5)
let nunchuku = LethalWeapon(name: "Nunchuku", destructionCapacity: -10)
let sai = LethalWeapon(name: "Sai", destructionCapacity: -15)
let maul = LethalWeapon (name: "Maul", destructionCapacity: -20)
let halberd = LethalWeapon(name: "Halberd", destructionCapacity: -40)
let bowAndArrow = LethalWeapon(name: "Bow and Arrow", destructionCapacity: -25)


let wand = HealingPower(name: "Wand", healingCapacity: 35)
let healingSword = HealingPower(name: "Healing Sword", healingCapacity: 40)
let healingDust = HealingPower(name: "Healing dust", healingCapacity: 15)
let potion = HealingPower(name: "Potion", healingCapacity: 10)
let lifeLiquor = HealingPower(name: "Life liquor", healingCapacity: 20)
let magicHat = HealingPower(name: "Magic hat", healingCapacity: 25)

let sword = LethalWeapon(name: "sword", destructionCapacity: -10)
let magic = HealingPower(name: "magic", healingCapacity: 30)
let hands = LethalWeapon(name: "hands", destructionCapacity: -5)
let ax = LethalWeapon(name: "hand", destructionCapacity: -50)





class Fighter: Character {
    init(){
        super.init(name: "", lifePoint: 100, weapon: sword)
    }
}

class Magus: Character {
    
    init() {
        super.init(name: "", lifePoint: 50, weapon: magic)
    }
}

class Colossus: Character {
    
    init() {
        super.init(name: "", lifePoint: 200, weapon: hands)
    }
}


class Dwarf: Character {
    
    init() {
        super.init(name: "", lifePoint: 30, weapon: ax)
    }
}




let team1 = Team()
let team2 = Team()


var allNames = [String]()

func name() -> String {
    let name = read()
    if allNames.contains(name){
        print("Name already used, choose again:")
        return read()
    } else {
        allNames.append(name)
        return name
    }
}


func read() -> String {
    if let line = readLine() {
        if line == "" {
            print("Error please write again:")
            return read()
        } else {
            return line
        }
    } else {
        return read()
    }
}

var switchMenu = [1, 2, 3]

func readMenuNumber() -> Int {
    if let resultNumber = Int(read()) {
        
        if switchMenu.contains(resultNumber) {
            return resultNumber
        } else {
            return readMenuNumber()
        }
    } else {
        return readMenuNumber()
    }
}

var switchCharacter = [1, 2, 3, 4]

func readCharacterNumber() -> Int {
    
    if let resultNumber = Int(read()) {
        
        if switchCharacter.contains(resultNumber) {
            return resultNumber
        } else {
            return readCharacterNumber()
        }
    } else {
        return readCharacterNumber()
    }
}

var choosenCharacter = [0, 1, 2]

func readChoosenCharacter() -> Int {
    
    if let resultNumber = Int(read()) {
        if choosenCharacter.contains(resultNumber) {
            return resultNumber
        }else {
            return readChoosenCharacter()
        }
    }else {
        return readChoosenCharacter()
    }
}






var playerNames = [String]()

func readPlayerName() -> String {
    let name = read()
    if playerNames.contains(name){
        print("Name already used, add your last name to your name:")
        return readPlayerName()
    } else {
        playerNames.append(name)
        print("Welcome \(name)")
        return name
    }
}

func chance (attacker: Character) {
    if !(attacker is Magus) {
        let randomAttackerWeapon = [dagger, nunchuku, sai, maul, halberd, bowAndArrow]
        let randomNumber = Int(arc4random_uniform(UInt32(randomAttackerWeapon.count)))
        attacker.weapon = randomAttackerWeapon[randomNumber]
        
    } else {
        let randomMagusWeapon = [wand, healingSword, healingDust, potion, lifeLiquor, magicHat]
        let randomNumber = Int(arc4random_uniform(UInt32(randomMagusWeapon.count)))
        attacker.weapon = randomMagusWeapon[randomNumber]
    }
    if let weapon = attacker.weapon as? LethalWeapon {
        print("The character has found a box and has changed his old weapon to a \(attacker.weapon) that he just found and has now the capacity to take away \(weapon.destructionCapacity) point from his opponent")
    }
}



// NUMBER OF ROUND FOR CASE 3 : END GAME
var numberOfRound = 0

// COUNT OF POINTS DURING BATTLES OR HEALING
func TeamMove(attacker: Character, opponent: Character) {
    if attacker is Magus && opponent.lifePoint > 0 && ((opponent is Fighter && opponent.lifePoint < 100) || (opponent is Magus && opponent.lifePoint < 50) || (opponent is Colossus && opponent.lifePoint < 200) || (opponent is Dwarf && opponent.lifePoint < 30)) {
        if let weapon = attacker.weapon as? HealingPower {
            opponent.lifePoint = opponent.lifePoint + weapon.healingCapacity
        }
        if opponent is Fighter && opponent.lifePoint > 100 {
            opponent.lifePoint = 100
        }
        if opponent is Magus && opponent.lifePoint > 50 {
            opponent.lifePoint = 50
        }
        if opponent is Colossus  && opponent.lifePoint > 200 {
            opponent.lifePoint = 200
        }
        else if opponent is Dwarf && opponent.lifePoint > 30 {
            opponent.lifePoint = 30
        }
        print("You saved your teammate and he now has \(opponent.lifePoint)")
    }
    if !(attacker is Magus)  {
        if let weapon = attacker.weapon as? LethalWeapon {
            opponent.lifePoint = opponent.lifePoint + weapon.destructionCapacity
        }
    }
    if opponent.lifePoint <= 0 {
        opponent.lifePoint = 0
        if let index = team1.choosenCharacter.firstIndex(where: { $0 === opponent} ) {
            team1.choosenCharacter.remove(at: index)
        } else {
            if let index = team2.choosenCharacter.firstIndex(where: { $0 === opponent} ) {
                team2.choosenCharacter.remove(at: index)
            }
        }
    }
    if opponent.lifePoint >= 1 && !(attacker is Magus) {
        if let weapon = attacker.weapon as? LethalWeapon {
            print("The opponent has lost \(weapon.destructionCapacity) points and has now only  \(opponent.lifePoint) life points remaining")
        } else {
            if let weapon = attacker.weapon as? LethalWeapon{
                weapon.destructionCapacity = 0
                print("The opponent is dead and has lost \(weapon.destructionCapacity), you cannot save him with a Magus")
                
            }
        }
    }
}
func atLeast3CharactersChoosen() -> Bool {
    var answer = false
    if team1.choosenCharacter.count != 3 {
        answer = false
    } else if team1.choosenCharacter.count == 3 {
        answer = true
    }
    return answer
}

func atLeast3CharactersChoosenTeam2() -> Bool {
    var answer = false
    if team2.choosenCharacter.count != 3 {
        answer = false
    } else if team2.choosenCharacter.count == 3 {
        answer = true
    }
    return answer
}



func menu() {
    print("What do you want to do?"
        + "\n1. Start new game"
        + "\n2. Battles"
        + "\n3. End game")
    
    
    let choice = readMenuNumber()
    switch choice {
    case 1:
        // TEAM NAME
        print("Choose a team name:")
        
        let name = read()
        team1.name = name
        print("Your team name is now \(team1.name)")
        
        
        // PLAYER NAME
        print("Your name:")
        
        let playerName: String = read()
        team1.playerName = playerName
        print(" Welcome \(team1.playerName), you are now in the \(team1.name)'s team")
        
        
        while !atLeast3CharactersChoosen() {
            print("Team 1, choose \(3 - team1.choosenCharacter.count) characters one by one for your team:"
                + "\n1. The FIGHTER has 100 life point and can take away 10 point from his opponent with his sword."
                + "\n2. The MAGUS has 50 life point, he has the power to heals people in his own team"
                + "\n3. The COLOSSUS has 200 life point and fights with his bare hands which can take away 5 points from his opponent"
                + "\n4. The DWARF has 30 life point,has ax and can take 50 point away from his opponent.")
            
            
            let choice = readCharacterNumber()
            switch choice {
            case 1: // FIGHTER
                let aFighter = Fighter()
                print("Give your character a name:")
                let line: String = read()
                aFighter.name = line
                team1.choosenCharacter.append(aFighter)
                print("Your fighter is now called \(aFighter.name)")
                
                
            case 2: // MAGUS
                let aMagus = Magus()
                print("Give your character a name:")
                let line = read()
                aMagus.name = line
                team1.choosenCharacter.append(aMagus)
                print("Your magus is now called \(aMagus.name)")
                
                
            case 3: //COLOSSUS
                let aColossus = Colossus()
                print("Give your character a name:")
                let line = read()
                aColossus.name = line
                team1.choosenCharacter.append(aColossus)
                print("Your colossus is now called \(aColossus.name)")
                
            case 4: // DWARF
                let aDwarf = Dwarf()
                print("Give your character a name:")
                let line = read()
                aDwarf.name = line
                team1.choosenCharacter.append(aDwarf)
                print("Your dwarf is now called \(aDwarf.name)")
                
                
            default:
                
                print("Answer not accepted as a choice for the character")
                
                // RECALL MEMBERS OF TEAM 1
                for character in team1.choosenCharacter {
                    print("\(character) as \(character.name) has \(character.lifePoint) life point")
                }
            }
        }
        
        // SECOND TEAM NAME
        print("Second team, please choose a team name:")
        let line = read()
        team2.name = line
        print("Your team name is now \(team2.name)")
        
        // SECOND TEAM PLAYER NAME
        print("Your name:")
        let line2 = read()
        team2.name = line2
        print("Welcome \(team2.playerName), you are now in the \(team2.name)'s team")
        
        
        
        
        // CHOICE OF 3 CHARACTERS
        while !atLeast3CharactersChoosenTeam2() {
            print("Team 2, choose \(3 - team2.choosenCharacter.count) characters one by one for your team:"
                + "\n1. The FIGHTER has 100 life point and can take away 10 point from his opponent with his sword."
                + "\n2. The MAGUS has 50 life point, he has the power to heals people in his own team"
                + "\n3. The COLOSSUS has 200 life point and fights with his bare hands which can take away 5 points from his opponent"
                + "\n4. The DWARF has 30 life point,has ax and can take 50 point away from his opponent.")
            
            let choice = readCharacterNumber()
            switch choice {
                
            case 1: // FIGHTER
                let aFighter = Fighter()
                print("Give your character a name:")
                let line = read()
                aFighter.name = line
                team2.choosenCharacter.append(aFighter)
                print("Your fighter is now called \(aFighter.name)")
                
            case 2: // MAGUS
                let aMagus = Magus()
                print("Give your character a name:")
                let line = read()
                aMagus.name = line
                team2.choosenCharacter.append(aMagus)
                print("Your magus is now called \(aMagus.name)")
                
                
            case 3: //COLOSSUS
                let aColossus = Colossus()
                print("Give your character a name:")
                let line = read()
                aColossus.name = line
                team2.choosenCharacter.append(aColossus)
                print("Your magus is now called \(aColossus.name)")
                
                
            case 4: // DWARF
                let aDwarf = Dwarf()
                print("Give your character a name:")
                let line = read()
                aDwarf.name = line
                team2.choosenCharacter.append(aDwarf)
                print("Your dwarf is now called \(aDwarf.name)")
                
            default:
                print("Answer not accepted as a choice for the character")
            }
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
            
            
            var attackerForTeamMove1: Character
            var opponentForTeamMove1: Character
            var attackerForTeamMove2: Character
            var opponentForTeamMove2: Character
            
            
            // CHOICE ATTACKER FOR TEAM 1
            //            var attackerForTeamMove1: Character
            //            var opponentForTeamMove1: Character
            
            let line = readChoosenCharacter()
            let numberForAttacker = line
            attackerForTeamMove1 = team1.choosenCharacter[numberForAttacker-1]
            
            
            // BOX APPEAR
            let randomNumber = arc4random_uniform(UInt32(10))
            if randomNumber == 2 {
                chance(attacker: attackerForTeamMove1)
            }
            
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
                
                let numberForOpponent = readChoosenCharacter()
                opponentForTeamMove1 = team2.choosenCharacter[numberForOpponent-1]
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
                
                let numberForTeamMate = readChoosenCharacter()
                opponentForTeamMove1 = team1.choosenCharacter[numberForTeamMate-1]
                print("\(team1.name) you choosed \(opponentForTeamMove1.name) , the \(opponentForTeamMove1)")
                // Written opponentForTeamMove1 But it's the teammate choosen to be healed
                TeamMove(attacker: attackerForTeamMove1, opponent: opponentForTeamMove1)
            }
            
            
            if !team2.isDead() {
                // TEAM MOVE 2
                
                // CHOOSE AN ATTACKER AND AN OPPONENT
                print("\(team2.name) please choose your attacker in the following choices:")
                for character in team2.choosenCharacter {
                    print("In \(team2.name), the \(character) as \(character.name) has \(character.lifePoint) life points.")
                }
                
                // CHOICE OF AN ATTACKER OR A HEALER
                //                var attackerForTeamMove2: Character
                //                var opponentForTeamMove2: Character
                
                var numberAttackerChoosenByTeam2 = 1
                for character in team2.choosenCharacter {
                    print("Press \(numberAttackerChoosenByTeam2) to choose in \(team2.name), the \(character), \(character.name) as your attacker or your healer.")
                    numberAttackerChoosenByTeam2 += 1
                }
                
                let numberForAttacker = readChoosenCharacter()
                attackerForTeamMove2 = team2.choosenCharacter[numberForAttacker-1]
                
                // BOX APPEAR
                let randomNumber = arc4random_uniform(UInt32(10))
                if randomNumber == 2 {
                    chance(attacker: attackerForTeamMove2)
                }
                
                
                // FIGHTS IF IT S NOT A MAGUS : CHOICES CHARACTERS FROM TEAM 1 TO CHOOSE AN OPPONENT
                if !(attackerForTeamMove2 is Magus) {
                    print("\(team2.name) you choosed \(attackerForTeamMove2.name) , the \(attackerForTeamMove2)")
                    print("\(team2.name) please choose your opponent in the \(team1.name) in the following choices:")
                    
                    for character in team1.choosenCharacter {
                        print("In \(team1.name), the \(character) as \(character.name) had \(character.lifePoint) life points .")
                    }
                    // TEAM 2 CHOOSE AN OPPONENT FROM TEAM 1
                    var numberOpponentChoosenByTeam2 = 1
                    var opponentForTeamMove2: Character
                    for character in team1.choosenCharacter {
                        print("Press \(numberOpponentChoosenByTeam2) to choose in \(team2.name), the \(character) , \(character.name) as your opponent.")
                        numberOpponentChoosenByTeam2 += 1
                    }
                    let numberForOpponent = readChoosenCharacter()
                    opponentForTeamMove2 = team1.choosenCharacter[numberForOpponent-1]
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
                    
                    let numberForTeamMate = readChoosenCharacter()
                    opponentForTeamMove2 = team2.choosenCharacter[numberForTeamMate-1]
                    print("\(team2.name) you choosed \(opponentForTeamMove2.name) , the \(opponentForTeamMove2)")
                    // Written opponentForTeamMove2 But it's the teammate choosen to be healed
                    TeamMove(attacker: attackerForTeamMove2, opponent: opponentForTeamMove2)
                }
            }
        }
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
