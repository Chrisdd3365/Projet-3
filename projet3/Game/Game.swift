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
    var lootluck = 80 // Switch lootluck to 0 to have a 100% of treasure chest
    
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
            
            switch userChoice {
            case 1:
                let warrior = Warrior(name: nameCharacter, myTeam: teamsArray[index])
                teamsArray[index].characterArray.append(warrior)
            case 2:
                let mage = Mage(name: nameCharacter, myTeam: teamsArray[index])
                teamsArray[index].characterArray.append(mage)
            case 3:
                let giant = Giant(name: nameCharacter, myTeam: teamsArray[index])
                teamsArray[index].characterArray.append(giant)
            case 4:
                let dwarf = Dwarf(name: nameCharacter, myTeam: teamsArray[index])
                teamsArray[index].characterArray.append(dwarf)
            default:
                break
            }
        }
    }
    
    func fight() {
        
        var choiceCharacter: Character
        var choiceTarget: Character
        var turn = 0
        
        repeat {
            for i in 0..<2 {
                print("")
                print("It's your turn to play")
                
                choiceCharacter = self.chooseCharacter(t: teamsArray[i], typeOfAsk: "Please press 1 or 2 or 3 to choose a character to fight with: ")
                self.loot(character: choiceCharacter)
                
                if let mage = choiceCharacter as? Mage {
                    print("")
                    print("What character do you want to heal?")
                    print("")
                    choiceTarget = self.chooseCharacter(t: teamsArray[i], typeOfAsk: "Please press 1 or 2 or 3 to choose a character to heal: ")
                    if choiceCharacter.weapon is UltimateScepter {
                        print("")
                        print("\(choiceCharacter.characterName) has healed \(choiceTarget.characterName) for \((choiceCharacter.weapon as! UltimateScepter).magic) points!  ")
                    } else {
                        print("")
                        print("\(choiceCharacter.characterName) has healed \(choiceTarget.characterName) for \((choiceCharacter.weapon as! Scepter).magic) points!  ")
                    }
                    mage.heal(targetAlly: choiceTarget)
                    print("\(choiceTarget.characterName) has now \(choiceTarget.currentHealth) HP! ")
                }
                else {
                    print("")
                    print("What character do you want to attack?")
                    print("")
                    if i == 0 {
                        // Select a single target from team 2
                        choiceTarget = self.chooseCharacter(t: teamsArray[i + 1], typeOfAsk: "Please press 1 or 2 or 3 to choose a target: ")
                        choiceCharacter.attack(targetEnnemy: choiceTarget)
                        if choiceTarget.currentHealth <= 0 {
                            print("")
                            print("\(choiceTarget.characterName) is dead! ")
                        }
                    } else {
                        // Select a single target from team 1
                        choiceTarget = self.chooseCharacter(t: teamsArray[i - 1], typeOfAsk: "Please press 1 or 2 or 3 to choose a target: ")
                        choiceCharacter.attack(targetEnnemy: choiceTarget)
                        if choiceTarget.currentHealth <= 0 {
                            print("")
                            print("\(choiceTarget.characterName) is dead! ")
                        }
                    }
                    print("")
                    print("\(choiceCharacter.characterName) has attacked \(choiceTarget.characterName) for \(choiceCharacter.weapon.damage) points! ")
                    print("\(choiceTarget.characterName) has now \(choiceTarget.currentHealth) HP left! ")
                }
            }
            turn += 1
        } while teamsArray.count >= 1
        
        var winnerName: String
        if teamsArray.count == 1 {
            winnerName = teamsArray[0].name
        } else {
            winnerName = teamsArray[1].name
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
        
        var stringError = ""
        let stringError1 = "Please press 1 or 2 or 3 to choose a character: "
        let stringError2 = "Please choose a character still alive: "
        
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
    
    func loot(character: Character) { // Generate a random chest loot with a random weapon to a random player during the game
        
        let dice1 = arc4random_uniform(100) // Generate a random number to get a chest loot during the game
        
        if dice1 >= lootluck {
            
            var announcement = "You are lucky, a treasure chest appeared in front of you! "
            let modif = 30
            
            if character is Mage {
                let ultimateScepter = UltimateScepter()
                if character.weapon is UltimateScepter {
                    print("")
                    announcement += "\nIt's the Ultimate Scepter with \(modif) magic power! " + "\nBut you've already equipped it! "
                } else {
                    character.weapon = ultimateScepter // Equip the ultimate scepter to the choosen mage
                    ultimateScepter.magic = modif
                    announcement += "\nIt's the Ultimate Scepter with \(modif) magic power!" + "\nYou've now equipped your new scepter! "
                }
            }
            else {
                let ultimateWeapon = UltimateWeapon()
                if character.weapon is UltimateWeapon {
                    print("")
                    announcement += "\nIt's the Ultimate Weapon with \(modif) attack power!" + "\nBut you've already equipped it! "
                }
                else {
                    character.weapon = ultimateWeapon // Equip the ultimate weapon to the choosen character
                    ultimateWeapon.damage = modif
                    announcement += "\nIt's the Ultimate Weapon with \(modif) attack power!" + "\nYou've now equipped your new weapon! "
                }
            }
            print("")
            print(announcement)
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
