//
//  Game.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Game { // A base class to set the game itself
    
    var teamsArray = [Team]()
    
    func start() { // Start a new game when both the players have finished to create their 2 teams of 3 characters
        print("")
        print("=====================================================")
        print("Welcome and get ready for the next and deadly battle!")
        print("=====================================================")
        
        for i in 0..<2 { // Set at 2 because there is only 2 teams playing the game
            createNewTeam(index: i)
            createNewTeamCharacters(index: i)
        }
        print("")
        print("The 2 teams are ready to fight!")
        
        fight()
    }
    
    func createNewTeam(index: Int) { // Create a new team by typing an unique name for the team
        
        var error = false
        var nameTeam = ""
        
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
            
            for t in teamsArray { // This loop checks if the team's name choosen by the player is already used or not
                if t.name == nameTeam {
                    error = true
                }
            }
        } while error == true // Will repeat until there is no error from the player
    
        teamsArray.append(Team(name: nameTeam)) // Add the team's name choosen by the player
    }
    
    func createNewTeamCharacters(index: Int) { // Create 3 characters
        
        var userChoice = 0
        var nameCharacter = ""
        var error = false
        
        for i in 0..<3 { // This loop allows the 2 players to choose 3 characters for their team
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
                
                // This conditionner checks if the player uses 1, 2, 3, 4 as valid input
                if userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 {
                    error = true
                } else {
                    error = false
                }
            } while error == true // Will repeat there is no error from the player
            
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
                
                for t in teamsArray { // This loop checks if the character's name is already used or not
                    for c in t.characterArray {
                        if  c.characterName == nameCharacter {
                            error = true
                        }
                    }
                }
            } while error == true // Will repeat until there is no error from the player
            
            switch userChoice { // To add character of the player's choice to his team
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
    
    
    func fight() { // A method to set the fight during the game
        
        var choiceCharacter: Character // Character choosen to fight with
        var choiceTarget: Character // Target choosen to attack or to heal
        var turn = 0 // Count the number of turns
        var deathCount1 = 0 // Count the number of dead characters into the team 1
        var deathCount2 = 0 // Count the number of dead characters into the team 2
        
        repeat {
            for i in 0..<2 { // Set at 2 because there is only 2 teams
                print("")
                print("It's your turn to play! ")
                // To call the method "chooseCharacter" to begin the fight and select a character to fight with
                choiceCharacter = self.chooseCharacter(t: teamsArray[i], typeOfAsk: "Please press 1 or 2 or 3 to choose a character to fight with: ")
                
                self.loot(character: choiceCharacter) // To call the method "loot" for the treasure chest
                
                if let mage = choiceCharacter as? Mage { // If the character choosen is a Mage, the game will invite the player to heal an ally
                    print("")
                    print("What character do you want to heal?")
                    print("")
                    
                    choiceTarget = self.chooseCharacter(t: teamsArray[i], typeOfAsk: "Please press 1 or 2 or 3 to choose a character to heal: ")
                    
                    print("")
                    print("\(choiceCharacter.characterName) has healed \(choiceTarget.characterName) for \(choiceCharacter.weapon.magic) points! ")
                    
                    mage.heal(targetAlly: choiceTarget) // To call the method "heal" from sub-class "Mage"
                    
                    print("\(choiceTarget.characterName) has now \(choiceTarget.currentHealth) HP! ")
                }
                else { // If the character choosen is not a mage, the game will invite the player to attack a target
                    print("")
                    print("What character do you want to attack?")
                    print("")
                    
                    if i == 0 { // Select a single target from team 2
                        choiceTarget = self.chooseCharacter(t: teamsArray[i + 1], typeOfAsk: "Please press 1 or 2 or 3 to choose a target: ")
                        choiceCharacter.attack(targetEnnemy: choiceTarget) // To call the method "attack" from base class "Character"
                        
                        if choiceTarget.currentHealth <= 0 { // If choiceTarget's current health is below 0 or equal to 0
                            print("")
                            print("\(choiceTarget.characterName) is dead! ")
                            choiceTarget.currentHealth = 0 // To avoid to print negative health and it will only print "0 HP" instead
                            deathCount2 += 1 // If a character is dead, it will add "1" to the death count of team 2
                        }
                    } else { // Select a single target from team 1
                        choiceTarget = self.chooseCharacter(t: teamsArray[i - 1], typeOfAsk: "Please press 1 or 2 or 3 to choose a target: ")
                        choiceCharacter.attack(targetEnnemy: choiceTarget) // To call the method "attack" from base class "Character"
                        
                        if choiceTarget.currentHealth <= 0 { // If choiceTarget's current health is below 0 or equal to 0
                            print("")
                            print("\(choiceTarget.characterName) is dead! ")
                            choiceTarget.currentHealth = 0 // To avoid to print negative health and it will only print "0 HP" instead
                            deathCount1 += 1 // If a character is dead, it will add "1" to the death count of team 1
                        }
                    }
                    print("")
                    print("\(choiceCharacter.characterName) has attacked \(choiceTarget.characterName) for \(choiceCharacter.weapon.damage) points! ")
                    print("\(choiceTarget.characterName) has now \(choiceTarget.currentHealth) HP left! ")
                }
            }
            turn += 1 // Add "1" to the count of turn
        } while deathCount1 != 3 && deathCount2 != 3 // Will repeat until there are 3 dead characters of the same team
        
        var winnerName = ""
        // To announce the winner of the fight with the number of turns
        if deathCount1 == 3 {
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
    
    func chooseCharacter(t: Team, typeOfAsk: String) -> Character { // A method created to permit the player to choose a character and a target during the fight
        
        var userChoice = 0
        var error = false
        t.teamDescription() // To show a short description of the two teams when the players choose a character and a target during the fight
        
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
            // If the player doesn't use 1,2,3 as valid input, then stringError 1 and invite again the player to use valid input
            if userChoice != 1 && userChoice != 2 && userChoice != 3 {
                error = true
                stringError = stringError1
            }
            else {
                // If the character is dead or if the target(ally or ennemy) is dead, the player can't choose them and has to choose a character still alive
                if t.characterArray[userChoice-1].currentHealth <= 0 {
                    error = true
                    stringError = stringError2
                }
                else {
                    error = false
                }
            }
        } while error == true // Will repeat until there is no error
        return t.characterArray[userChoice-1] // Will return an input(1,2,3) associated to the index of the array(0,1,2 respectively)
    }
    
    func loot(character: Character) { // Generate a random chest loot with powerful weapon to a random choosen player during the game
        
        let dice1 = arc4random_uniform(100) // Generate a random number to get a chest loot during the game
        let lootluck = 80 // Switch lootluck to 0 to have a 100% of treasure chest
        
        if dice1 >= lootluck {
            
            var announcement = "You are lucky, a treasure chest appeared in front of you! "
            
            if character is Mage { // A "Mage" can't loot an ultimate weapon
                let ultimateScepter = UltimateScepter()
                if character.weapon is UltimateScepter {
                    print("")
                    announcement += "\nIt's the Ultimate Scepter with \(character.weapon.magic) magic power! " + "\nBut you've already equipped it! "
                } else {
                    character.weapon = ultimateScepter // Equip the ultimate scepter to the choosen mage
                    announcement += "\nIt's the Ultimate Scepter with \(character.weapon.magic) magic power!" + "\nYou've now equipped your new scepter! "
                }
            }
            else { // A character other than "Mage" can't loot an ultimate scepter
                let ultimateWeapon = UltimateWeapon()
                if character.weapon is UltimateWeapon {
                    print("")
                    announcement += "\nIt's the Ultimate Weapon with \(character.weapon.damage) attack power!" + "\nBut you've already equipped it! "
                }
                else {
                    character.weapon = ultimateWeapon // Equip the ultimate weapon to the choosen character
                    announcement += "\nIt's the Ultimate Weapon with \(character.weapon.damage) attack power!" + "\nYou've now equipped your new weapon! "
                }
            }
            print("")
            print(announcement)
        }
    }
    
    func inputInt() -> Int { // Inputs of different type other than Integer are not allowed
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    func inputString() -> String { // Inputs of different type other than String are not allowed
        guard let data = readLine() else { return "" }
        return data
    }
}
