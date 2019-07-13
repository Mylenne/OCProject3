//
//  Utils.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation


class Utils {
    // Array of all the names created in the game except for the player names
    static var allNames = [String]()
    
    // Array with all the name used as a player name
    static var playerNames = [String]()
    
    // Function that check the response of the gamer, if he writes nothing, it will ask again till the answer is accepted
    static func read() -> String {
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
    
    // Function that verify if the name is already used, if not it adds the new name in the array allNames
    static func readName() -> String {
        let name = Utils.read()
        
        if Utils.allNames.contains(name) {
            print("Name already used, choose again:")
            return readName()
        } else if Int(name) != nil {
            print("You cannot have a number as a name, write again:")
            return readName()
        } else {
            Utils.allNames.append(name)
            return name
        }
    }
    
    // Function that make sure the player name choosen doesn't exist yet
    static func readPlayerName() -> String {
        let name = Utils.read()
        
        if Utils.playerNames.contains(name) {
            print("Name already used, add your last name to your name:")
            return readPlayerName()
        } else {
            Utils.playerNames.append(name)
            return name
        }
    }
    
    // Function that reads a number that must be between minimum and maximum
    static func readNumber(minimum: Int, maximum: Int) -> Int {
        if let number = Int(Utils.read()) {
            if number >= minimum && number <= maximum {
                return number
            } else {
                print("Error, choose an integer between 1 and \(maximum):")
                return readNumber(minimum: minimum, maximum: maximum)
            }
        } else {
            print("Error, choose again:")
            return readNumber(minimum: minimum, maximum: maximum)
        }
    }

}
