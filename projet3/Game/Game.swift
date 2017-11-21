//
//  Game.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Game {
    
    var teamsArray = [Team]()
    
    func start() {
        print("")
        print("=====================================================")
        print("Welcome and get ready for the next and deadly battle!")
        print("=====================================================")
        for i in 0..<2 {
            createNewTeam()
            createNewTeamCharacters(index: i)
        }
        
        print("The 2 teams are ready to fight!")
        fight()
    }
    
    func createNewTeam() {
        
        var error: Bool = false
        var nameTeam: String = ""
        repeat {
            if error == true {
                print("This name is already used. Please type a different and unique name for your team.")
            }
            else {
                print("")
                print("====================================")
                print("Please type your name for your team:")
                print("====================================")
            }
            nameTeam = inputString()
            error = false
            for t in teamsArray {
                if t.name == nameTeam {
                    error = true
                    break
                }
            }
        } while error == true
        teamsArray.append(Team(name: nameTeam))
    }
    
    func createNewTeamCharacters(index: Int) { 
        
        repeat {
            var userChoice = 0
            var nameCharacter: String = ""
            var error: Bool = false
            
            repeat {
                if error == true {
                    print("The selected name is alreadry picked. Please choose an another name for your character.")
                }
                else {
                    print("Please type an unique character's name")
                }
                nameCharacter = inputString()
                error = false
                for t in teamsArray {
                    for c in t.characterArray {
                        if  c.characterName == nameCharacter {
                            error = true
                            break
                        }
                    }
                    if error == true {
                        break
                    }
                }
            } while error == true
            
            repeat {
                if error == true {
                    print("Please choose a character with the right keys (1,2,3,4)")
                }
                else {
                    print("")
                    print("====================================================================================")
                    print("Please select a character for your team:"
                        +  "\n1. Warrior, a character equipped with a sword and possesses balance combat stats"
                        +  "\n2. Mage, a support character with the ability to heal"
                        +  "\n3. Giant, a character with great defense and stamina but low offense"
                        +  "\n4. Dwarf, a character equipped with an axe, can deal great damage but low stamina")
                    print("====================================================================================")
                }
                userChoice = inputInt()
                
                if userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 {
                    error = true
                }
                else {
                    error = false
                }
            } while error == true
            
            var character : Character
            switch userChoice {
            case 1:
                character = Warrior(name: nameCharacter)
                
            case 2:
                character = Mage(name: nameCharacter)
                
            case 3:
                character = Giant(name: nameCharacter)
                
            case 4:
                character = Dwarf(name: nameCharacter)
                
            default:
                chararacter = Warrior(name: nameCharacter)
                break
            }
            teamsArray[index].life += char.maxHealth
            teamsArray[index].characterArray.append(character)
        } while teamsArray[index].characterArray.count < 3
    }
    
    func fight() {
        GameDescription()
    }
    
    func GameDescription() {
        print("==================================")
        print("Games's Teams")
        for t in teamsArray {
            t.teamDescription()
        }
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
}
