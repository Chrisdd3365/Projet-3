//
//  Character.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Character { // A base class to init parameters like "name", "classe", "health", "weapon" associated to the sub-class of "Character"
    
    let characterName: String
    let characterClasse: String
    let maxHealth: Int
    var currentHealth: Int
    var weapon: Weapon
    
    init(characterName: String, characterClasse: String, currentHealth: Int, weapon: Weapon) {
        self.characterName = characterName
        self.characterClasse = characterClasse
        self.currentHealth = currentHealth
        self.maxHealth = currentHealth
        self.weapon = weapon
    }
    
    func characterDescription() { // A method named "characterDescription" to get a complete description of a character
        print("")
        print("=====================================================================")
        print("Character's name: \(self.characterName) "
            + " Classe: \(characterClasse) "
            + " HP: \(currentHealth)/\(maxHealth) "
            + " Weapon's Damage: \(self.weapon.damage)"
            + "")
    }
    
    func attack(targetEnnemy: Character) { // A method named "attack" for characters who can deal damage during the game
        targetEnnemy.currentHealth -= self.weapon.damage
        if self.currentHealth < 0 { // To avoid the negative health issue and set the dead character's parameter
            self.currentHealth = 0
        }
    }
}
