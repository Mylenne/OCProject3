//
//  switch character.swift
//  Projet_3
//
//  Created by Mylenne  on 06/06/2019.
//  Copyright © 2019 MirmitandBawi. All rights reserved.
//

import Foundation

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
