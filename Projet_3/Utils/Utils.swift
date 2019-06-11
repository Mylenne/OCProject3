//
//  Function.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


var allNames = [String]()

func name() -> String {
    let name = read()
    if allNames.contains(name) {
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
            print("Error, choose again:")
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
            print("Error, choose again:")
            return readCharacterNumber()
        }
    } else {
        return readCharacterNumber()
    }
}

func readChoosenCharacter(aliveCharacters: Int) -> Int {
    
    if let resultNumber = Int(read()) {
        if resultNumber <= aliveCharacters && resultNumber > 0 {
            return resultNumber
        } else {
            print("Error, choose again:")
            return readChoosenCharacter(aliveCharacters: aliveCharacters)
        }
    } else {
        return readChoosenCharacter(aliveCharacters: aliveCharacters)
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

func createCharacter() -> Character{
    var character: Character
    let choice = readCharacterNumber()
    
    switch choice {
    case 1: // FIGHTER
        print("Give your character a name:")
        let line = name()
        character = Fighter(name: line)
        print("Your fighter is now called \(character.name)")
        
    case 2: // MAGUS
        
        print("Give your character a name:")
        let line = name()
        character = Magus(name: line)
        print("Your magus is now called \(character.name)")
        
    case 3: //COLOSSUS
        print("Give your character a name:")
        let line = name()
        character = Colossus(name: line)
        print("Your colossus is now called \(character.name)")
        
    case 4: // DWARF
        print("Give your character a name:")
        let line = name()
        character = Dwarf(name: line)
        print("Your dwarf is now called \(character.name)")
        
    default :
        return createCharacter()
    }
    
    return character
}
