//
//  BattleFantasy.swift
//  Projet_3
//
//  Created by Mylenne  on 13/07/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

class BattleFantasy {
    static func run() {
        print("Welcome to Battle Fantasy!! You will have to fight one against another team to win. Let's see who's the best! Good luck!😁😄")
        print("\n()=()   ()-()   ()=()   ()-()")
        print("('Y')   (':')   (^;^)   ('&')")
        print("q . p   d . b   C   C   c . c")
        print("()_()   ()_()   ()_()   ()=()\n")
        
        func menu() {
            print("Please write \"Play\" to start a game or \"Quit\" to quit Battle Fantasy")
            let choice = Utils.read()
            
            switch choice {
            case "Play":
                let game = Game()
                game.start()
                print("Do you want to play again?")
                menu()
            case "Quit":
                print("you quit the game 😥💩👎")
            default:
                print("You have to choose to play or to quit")
                menu()
            }
        }
        
        menu()
    }
}
