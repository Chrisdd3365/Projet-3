//
//  UserInterface.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class UserInterface {
    
    let infiniteLoop = true
    var characters = [Character]()
    
    func start() {
        var userChoice = 0
        repeat {
            mainMenu()
            repeat {
                userChoice = inputInt()
            }
                while userChoice != 1
                    switch userChoice {
                        case 1:
                            selectTeam()
                        default:
                            break
            }
        }   while infiniteLoop
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
            }
            while userChoice != 1 && userChoice != 2
                switch userChoice {
                    case 1:
                        typeNamePlayer()
                    case 2:
                        typeNamePlayer()
                    default:
                        break
                }
        }
    
    func typeNamePlayer() {
        let player = Name(name: "")
        
        print("")
        print("======================")
        print("Please type your name:")
        print("======================")
        
        if let choice = readLine() {
            player.name = choice
        }
        self.selectCharacterScreen()
    }
    
    func selectCharacterScreen() {
        
        var userChoice = 0
        var name: String = ""
        var error: Bool = false
        
        repeat {
            if error == true {
                print("Please type a valid character's name. His name must be unique.")
            }
            else {
                print("Please type an unique character's name")
            }
            name = inputString()
            error = false
            for c in characters {
                if c.nameCharacter == name {
                    error = false
                    break
                }
            }
        } while error == true
        
        
        print("")
        print("====================================================================================")
        print("Please select 3 characters for your team:"
            +  "\n1. Warrior, a character equipped with a sword and possesses balance combat stats"
            +  "\n2. Mage, a support character with the ability to heal"
            +  "\n3. Giant, a character with great defense and stamina but low offense"
            +  "\n4. Dwarf, a character equipped with an axe, can deal great damage but low stamina")
        print("====================================================================================")
        
        repeat {
            userChoice = inputInt()
        }   while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
        
        switch userChoice {
                case 1:
                    let warrior = Warrior()
                    characters.append(warrior)
                case 2:
                    let mage = Mage()
                    characters.append(mage)
                case 3:
                    let giant = Giant()
                    characters.append(giant)
                case 4:
                    let dwarf = Dwarf()
                    characters.append(dwarf)
                default:
                    break
        }
        while characters.count < 4{
            
        }
        self.selectCharacterScreen()
    }
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    func inputString() -> String {
        guard let data = readLine() else { return ""}
        guard let dataToString = String?(data) else { return ""}
        return dataToString
    }
}
