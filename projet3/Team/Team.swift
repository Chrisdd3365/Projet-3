//
//  Team.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Team {
    
    var team = [Character]()
    let infiniteLoop = true
    var name: String = ""
    
    func start() {
        var userChoice = 0
        repeat {
            mainMenu()
        repeat {
            userChoice = inputInt()
        } while userChoice != 1
        switch userChoice {
        case 1:
            selectTeam()
        default:
            break
        }
    }  while infiniteLoop
}

func mainMenu() {
    print("")
    print("=====================================================")
    print("Welcome and get ready for the next and deadly battle!"
        + "\n1. New Game")
    print("=====================================================")
}

func selectTeam() {
    var userChoice = 0
    
    print("")
    print("========================")
    print("Please select your team:"
        + "\n1. Team 1"
        + "\n2. Team 2")
    print("========================")
    
    repeat {
        userChoice = inputInt()
    }       while userChoice != 1 && userChoice != 2
    switch userChoice {
    case 1:
        typeNamePlayer(team: Team)
    case 2:
        typeNamePlayer(team: Team)
    default:
        break
    }
}

    func typeNamePlayer(team: Team) {
    
    
    print("")
    print("======================")
    print("Please type your name:")
    print("======================")
    
    if let choice = readLine() {
        team.name = choice
    }
    self.selectCharacterScreen()
}

    func selectCharacterScreen() {
    var userChoice = 0
    var nameCharacter: String = ""
    var character = Character()
        
    print("")
    print("==================================================================================")
    print("Please select 3 characters for your team:"
        +  "\n1. Fighter, a character equipped with a sword and possesses balance combat stats"
        +  "\n2. Mage, a support character with the ability to heal"
        +  "\n3. Giant, a character with great defense and stamina but low offense"
        +  "\n4. Dwarf, a character equipped with an axe, can deal great damage but low stamina")
    print("==================================================================================")
    
        repeat {
                userChoice = inputInt()
            }   while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
    
                switch userChoice {
            case 1:
                let warrior = Warrior()
                team.append(warrior)
            case 2:
                let mage = Mage()
                team.append(mage)
            case 3:
                let giant = Giant()
                team.append(giant)
            case 4:
                let dwarf = Dwarf()
                team.append(dwarf)
            default:
                break
    }
    while team.count < 4 {
        team.append(character)
    }
    if let choice = readLine() {
        character.nameCharacter = choice
    }
    self.selectCharacterScreen()
}

    func showTeam() {
        for character in team {
            character.showCharacter()
    }
}

    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
}

