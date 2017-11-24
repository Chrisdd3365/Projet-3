//
//  Character.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Character { // A base class named "Character" to set things like name, classe, health, weapon and team associated to the characters
    
    var characterName: String
    var characterClasse: String
    let maxHealth: Int
    var currentHealth: Int
    var weapon: Weapon
    var myTeam: Team
    
    init(characterName: String, characterClasse: String, currentHealth: Int, weapon: Weapon, myTeam : Team) {
        self.characterName = characterName
        self.characterClasse = characterClasse
        self.currentHealth = currentHealth
        self.maxHealth = currentHealth
        self.weapon = weapon
        self.myTeam = myTeam
    }
    
    func characterDescription() { // A method named "characterDescription" to get a complete description of a character
        print("")
        print("=====================================================================")
        print("Character's name: \(self.characterName) "
            + "Classe: \(characterClasse) "
            + "HP: \(currentHealth)/\(maxHealth) "
            + "Weapon's Damage: \(self.weapon.damage)"
            + "")
    }
    
    func attack(targetEnnemy: Character) { // A method named "attack" for characters who can deal damages during the game
        targetEnnemy.currentHealth -= self.weapon.damage
        targetEnnemy.myTeam.life -= self.weapon.damage
        if self.currentHealth < 0 {
            self.currentHealth = 0
        }
    }
}
