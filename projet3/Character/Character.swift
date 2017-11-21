//
//  Character.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Character {
    
    var characterName: String
    var characterClasse: String
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
    
    func characterDescription() { 
        print("")
        print("==================================")
        print("Character's name: \(self.characterName) "
            + "Classe: \(characterClasse) "
            + "HP: \(currentHealth)/\(maxHealth) "
            + "Weapon's Damage: \(self.weapon.damage)"
            + "")
    }
    
    func attack(targetEnnemy: Character) {
        targetEnnemy.currentHealth -= self.weapon.damage
        if self.currentHealth < 0 {
            self.currentHealth = 0
        }
    }
    
    
}
