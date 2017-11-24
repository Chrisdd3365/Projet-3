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
    
    
    func start() { // Start a new game by creating two teams of 3 characters
        print("")
        print("=====================================================")
        print("Welcome and get ready for the next and deadly battle!")
        print("=====================================================")
        for i in 0..<2 {
            createNewTeam(index: i)
            createNewTeamCharacters(index: i)
        }
        print("")
        print("The 2 teams are ready to fight!")
        fight()
    }
    
    func createNewTeam(index: Int) { // Create a new team by typing an unique name for the player
        
        var error: Bool = false
        var nameTeam: String = ""
        repeat { // Create an unique name for the player
            if error == true {
                print("")
                print("==================================================================================")
                print("This name is already used. Please type a different and unique name for your team: ")
                print("==================================================================================")
            }
            else {
                print("")
                print("==================================")
                print("Please type the name for team N°\(index + 1): ")
                print("==================================")
            }
            nameTeam = inputString()
            error = false
            for t in teamsArray {
                if t.name == nameTeam {
                    error = true
                }
            }
        } while error == true
        teamsArray.append(Team(name: nameTeam))
    }
    
    func createNewTeamCharacters(index: Int) {
        
        var userChoice = 0
        var nameCharacter = ""
        var error = false
        
        for i in 0..<3 {
            repeat { 
                if error == true {
                    print("")
                    print("=========================================================")
                    print("Please choose a character with the right keys (1,2,3,4): ")
                    print("=========================================================")
                }
                else {
                    print("")
                    print("====================================================================================")
                    print("Please select a character N°\(i + 1) for your team: "
                        +  "\n1. Warrior, a character equipped with a sword and possesses balance combat stats"
                        +  "\n2. Mage, a support character with the ability to heal"
                        +  "\n3. Giant, a character with great defense and stamina but low offense"
                        +  "\n4. Dwarf, a character equipped with an axe, can deal great damage but low stamina")
                    print("====================================================================================")
                }
                userChoice = inputInt()
                if userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 {
                    error = true
                } else {
                    error = false
                }
            } while error == true
            
            repeat {
                if error == true {
                    print("")
                    print("=======================================================================================")
                    print("The selected name is already picked. Please choose an another name for your character: ")
                    print("=======================================================================================")
                }
                else {
                    print("")
                    print("========================================")
                    print("Please type an unique character's name: ")
                    print("========================================")
                }
                nameCharacter = inputString()
                error = false
                for t in teamsArray {
                    for c in t.characterArray {
                        if  c.characterName == nameCharacter {
                            error = true
                        }
                    }
                }
            } while error == true
            
            var character: Character
            switch userChoice {
            case 1:
                character = Warrior(name: nameCharacter, myTeam: teamsArray[index])
            case 2:
                character = Mage(name: nameCharacter, myTeam: teamsArray[index])
            case 3:
                character = Giant(name: nameCharacter, myTeam: teamsArray[index])
            case 4:
                character = Dwarf(name: nameCharacter, myTeam: teamsArray[index])
            default:
                character = Warrior(name: nameCharacter, myTeam: teamsArray[index])
                break
            }
            teamsArray[index].life += character.maxHealth
            teamsArray[index].characterArray.append(character)
        }
    }
    
    func gameDescription() {
        print("")
        print("=============")
        print("Games's Teams")
        print("=============")
        print("")
        for t in teamsArray {
            t.teamDescription()
        }
    }
    
    func fight() {
        
        var choiceCharacter: Character
        var choiceTarget: Character
        var turn = 0
        
        repeat {
            for i in 0..<2 {
                
                var indiceTarget = i
                choiceCharacter = self.chooseCharacter(t: teamsArray[i], typeOfAsk: "Please press 1 or 2 or 3 to choose a character to fight with: ")
                
                var message1: String = "Choose a target to "
                var message2: String = "has "
                var message3: String = "for "
                
                
                if choiceCharacter is Mage {
                    let weapon = Scepter()
                    message1 += "heal : "
                    message2 += "healed "
                    message3 += "\(weapon.magic)"
                }
                else {
                    message1 += "attack : "
                    message2 += "attacked "
                    message3 += "\(choiceCharacter.weapon.damage)"
                    if indiceTarget == 0 {
                        indiceTarget = 1
                    }
                    else {
                        indiceTarget = 0
                    }
                }
                
                choiceTarget = self.chooseCharacter(t: teamsArray[indiceTarget], typeOfAsk: message1)
                choiceCharacter.attack(targetEnnemy: choiceTarget)
                
                print("")
                print("\(choiceCharacter.characterName) \(message2)\(choiceTarget.characterName) \(message3) points! ")
                print("\(choiceTarget.characterName) has now \(choiceTarget.currentHealth) HP left! ")
                print("")
            }
            turn += 1
        } while teamsArray[0].life >= 0 && teamsArray[1].life >= 0
        
        var winnerName: String
        if teamsArray[0].life < 0 {
            winnerName = teamsArray[1].name
        } else {
            winnerName = teamsArray[0].name
        }
        print("")
        print("=========================================================")
        print("Congratulations \(winnerName)! Your team wins this deadly battle! ")
        print("You won in \(turn) turns! ")
        print("=========================================================")
        print("")
    }
    
    func chooseCharacter(t: Team, typeOfAsk: String) -> Character {
        
        var userChoice = 0
        var error = false
        t.teamDescription()
        
        print("")
        print(typeOfAsk)
        print("")
        
        let stringError1 = "Please press 1 or 2 or 3 to choose a character : "
        let stringError2 = "Please choose a character still alive : "
        var stringError = ""
        
        repeat {
            if error == true {
                print("")
                print(stringError)
                print("")
            }
            userChoice = inputInt()
            if userChoice != 1 && userChoice != 2 && userChoice != 3 {
                error = true
                stringError = stringError1
            }
            else {
                if t.characterArray[userChoice-1].currentHealth <= 0 {
                    error = true
                    stringError = stringError2
                }
                else {
                    error = false
                }
            }
        } while error == true
        return t.characterArray[userChoice-1]
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
