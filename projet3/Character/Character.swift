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
    var classeName: String
    let maxHealth: Int
    var currentHealth: Int
    var weapon: Weapon
    
    init(characterName: String, classeName: String, maxHealth: Int, currentHealth: Int, weapon: Weapon) {
        self.characterName = characterName
        self.classeName = classeName
        self.maxHealth = maxHealth
        self.currentHealth = currentHealth
        self.weapon = weapon
    }
    
    func characterDescription() {
        print("")
        print("==================================")
        print("Character's name: \(self.characterName)"
            + "\nClasse: \(classeName)"
            + "\nHP: \(currentHealth)/\(maxHealth)"
            + "\nWeapon's Stats: \(self.weapon.atk) atk, \(self.weapon.mag) mag"
            + "")
    }
    
    func attack(targetEnnemy: Character) {
        targetEnnemy.currentHealth -= self.weapon.atk
        if self.currentHealth < 0 {
            self.currentHealth = 0
        }
    }
    
    func heal(targetAlly: Character) {
        if targetAlly.currentHealth > 0 {
            targetAlly.currentHealth += self.weapon.mag
            if targetAlly.currentHealth > targetAlly.maxHealth {
                targetAlly.currentHealth = targetAlly.maxHealth
            }
        }
    }
}
