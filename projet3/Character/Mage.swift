//
//  Mage.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Mage: Character {
    
    init(name: String) {
        super.init(characterName: name, characterClasse: "Mage", currentHealth: 70, weapon: Scepter())
        
    }
    
    override func attack(targetEnnemy: Character) {
        print("I can't attack.")
    }
    
    func heal(targetAlly: Character) {  // à modifier
        if targetAlly.currentHealth > 0 {
            targetAlly.currentHealth += (weapon as! Scepter).magic
            if targetAlly.currentHealth > targetAlly.maxHealth {
                targetAlly.currentHealth = targetAlly.maxHealth
            }
        }
    }
}
