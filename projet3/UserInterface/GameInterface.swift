//
//  UserInterface.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class GameInterface {
    
    var characters1 = [Character]()
    var characters2 = [Character]()
    let player1 = Player(playerName: "")
    let player2 = Player(playerName: "")
    
    func start() {
        
        var userChoice = 0
        mainMenu()
        repeat {
            userChoice = inputInt()
        }
            while userChoice != 1
        switch userChoice {
        case 1:
            typeNamePlayer1()
        default:
            break
        }
    }
    
    func mainMenu() {
        print("")
        print("=====================================================")
        print("Welcome and get ready for the next and deadly battle!"
            + "\n1. New Game")
        print("=====================================================")
    }
    
    func typeNamePlayer1() {
        
        print("")
        print("=================================")
        print("Please type your name for team 1:")
        print("=================================")
        
        if let choice = readLine() {
            player1.playerName = choice
        }
        self.selectCharacterScreen1()
    }
    
    func typeNamePlayer2() {
        
        print("")
        print("=================================")
        print("Please type your name for team 2:")
        print("=================================")
        
        if let choice = readLine() {
            player2.playerName = choice
        }
        self.selectCharacterScreen2()
    }
    
    func selectCharacterScreen1() {
        
        var userChoice = 0
        var nameCharacter: String = ""
        var error: Bool = false
        
        repeat {
            if error == true {
                print("Please type a valid character's name. His name must be unique.")
            }
            else {
                print("Please type an unique character's name")
            }
            nameCharacter = inputString()
            error = false
            for c in characters1 {
                if  c.characterName == nameCharacter {
                    error = true
                    break
                }
            }
        } while error == true
        
        
        print("")
        print("====================================================================================")
        print("Please select a character for your team:"
            +  "\n1. Warrior, a character equipped with a sword and possesses balance combat stats"
            +  "\n2. Mage, a support character with the ability to heal"
            +  "\n3. Giant, a character with great defense and stamina but low offense"
            +  "\n4. Dwarf, a character equipped with an axe, can deal great damage but low stamina")
        print("====================================================================================")
        
        repeat {
            userChoice = inputInt()
        } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
        
        switch userChoice {
        case 1:
            let warrior = Warrior()
            characters1.append(warrior)
        case 2:
            let mage = Mage()
            characters1.append(mage)
        case 3:
            let giant = Giant()
            characters1.append(giant)
        case 4:
            let dwarf = Dwarf()
            characters1.append(dwarf)
        default:
            break
        }
        if characters1.count == 3 {
            for c in characters1 {
                c.showCharacter()
            }
            typeNamePlayer2()
        }
        
        self.selectCharacterScreen1()
    }
    
    
    func selectCharacterScreen2() {
        
        var userChoice = 0
        var nameCharacter: String = ""
        var error: Bool = false
        
        
        repeat {
            if error == true {
                print("Please type a valid character's name. His name must be unique.")
            }
            else {
                print("Please type an unique character's name")
            }
            nameCharacter = inputString()
            error = false
            for c in characters2 {
                if  c.characterName == nameCharacter {
                    error = true
                    break
                }
            }
        } while error == true
        
        
        print("")
        print("====================================================================================")
        print("Please select a character for your team:"
            +  "\n1. Warrior, a character equipped with a sword and possesses balance combat stats"
            +  "\n2. Mage, a support character with the ability to heal"
            +  "\n3. Giant, a character with great defense and stamina but low offense"
            +  "\n4. Dwarf, a character equipped with an axe, can deal great damage but low stamina")
        print("====================================================================================")
        
        repeat {
            userChoice = inputInt()
        } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
        
        switch userChoice {
        case 1:
            let warrior = Warrior()
            characters2.append(warrior)
        case 2:
            let mage = Mage()
            characters2.append(mage)
        case 3:
            let giant = Giant()
            characters2.append(giant)
        case 4:
            let dwarf = Dwarf()
            characters2.append(dwarf)
        default:
            break
        }
        if characters2.count == 3 {
            for c in characters2 {
                c.showCharacter()
            }
        }
        self.selectCharacterScreen2()
        self.fight()
    }
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    func inputString() -> String {
        guard let data = readLine() else { return "" }
        return data
    }
    
    func attack(target: Character) {
        let currentClasse = "Mage"
        for c in characters1 {
            if c.classe != currentClasse {
                target.currentLife -= c.atk
            }
        }
    }
    
    func heal(target: Character) {
        let currentClasse = "Mage"
        for c in characters1 {
            if c.classe == currentClasse {
                target.currentLife += c.mag
            }
        }
    }
    
    func moveSet(target: Character) {
        let currentClasse = "Mage"
        for c in characters1 {
            if c.classe == currentClasse {
                heal(target: <#T##Character#>)
            }
            else {
                attack(target: <#T##Character#>)
            }
        }
    }
    
    func fight() {
        var userChoice = 0
        var players: [Player] = [player1, player2]
        
        repeat {
            for p in players {
                if p.playerName == player1.playerName {
                    for _ in characters1 {
                        repeat {
                            userChoice = inputInt()
                        } while userChoice != 1 && userChoice != 2 && userChoice != 3
                        switch userChoice {
                        case 1:
                            moveSet()
                        case 2:
                            moveSet()
                        case 3:
                            moveSet()
                        default:
                            break
                        }
                    }
                }
            }
        } while currentLife > 0
        
        for c in characters1 {
            c.showCharacter()
        }
        for c in characters2 {
            c.showCharacter()
        }
    }
}
