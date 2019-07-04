//
//  Utils.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


// Function that check the response of the gamer, if he writes nothing it will ask again till the answer is accepted
func read() -> String {
    if var line = readLine() {
        line = line.capitalized
        if line == "" {
            print("Error please write again:")
            return read()
        } else {
            return line
        }
    } else {
        print("Error, write again:")
        return read()
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

// Array of all the names created except the player names created
var allNames = [String]()

// Function that verify if the name is already use, if not it adds the new name in the array allNames
func readName() -> String {

    
    let name = read()
    if allNames.contains(name) {
        print("Name already used, choose again:")
        return readName()
    } else if Int(name) != nil {
        print("You cannot have a number as a name, write again:")
       return readName()
    } else {
        allNames.append(name)
        return name
    }
}


// Array with all the possibilities of the Menu
var switchMenu = [1, 2, 3]

// Function that make sure that the gamer choose beetween 1 to 3 to make sure that is no bug
func readMenuNumber() -> Int {
    if let resultNumber = Int(read()) {
        
        if switchMenu.contains(resultNumber) {
            return resultNumber
        } else {
            print("Error, choose again:")
            return readMenuNumber()
        }
    } else {
        print("Error, choose again:")
        return readMenuNumber()
    }
}

// Array with all the choices possible to choose a type of character, magus colossus, fighter, dwarf
var switchCharacter = [1, 2, 3, 4]

// Function that make sure that the gamer choose between 1 to 4 to choose what type of character he wants to create

func readCharacterNumber() -> Int {
    
    if let resultNumber = Int(read()) {
        if switchCharacter.contains(resultNumber) {
            return resultNumber
        } else {
            print("Error, choose again:")
            return readCharacterNumber()
        }
    } else {
        print("Error, choose again:")
        return readCharacterNumber()
    }
}

// function that show only the numnber of the alive characters, to play with
func readChoosenCharacter(aliveCharacters: Int) -> Int {
    if let resultNumber = Int(read()) {
        if resultNumber <= aliveCharacters && resultNumber > 0 {
            return resultNumber
        } else {
            print("Error, choose again:")
            return readChoosenCharacter(aliveCharacters: aliveCharacters)
        }
    } else {
        print("Error, choose again:")
        return readChoosenCharacter(aliveCharacters: aliveCharacters)
    }
}

// Array with all the name used as a player name
var playerNames = [String]()

// function that make sure the player name choosen doesn't exist yet
func readPlayerName() -> String {
    let name = read()
    if playerNames.contains(name) {
        print("Name already used, add your last name to your name:")
        return readPlayerName()
    } else {
        playerNames.append(name)
        return name
    }
}



