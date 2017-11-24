//
//  Mage.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Mage: Character { // A super class named "Mage" to set things especially for this type of character
    
    init(name: String, myTeam: Team) {
        super.init(characterName: name, characterClasse: "Mage", currentHealth: 70, weapon: Scepter())
    }
    
    override func attack(targetEnnemy: Character) { // A mage can't attack in this game
        print("I can't attack.")
        self.heal(targetAlly: targetEnnemy)
    }
    
    func heal(targetAlly: Character) { // But a mage can heal in this game, thanks to this method named "heal"
        if targetAlly.currentHealth > 0 {
            if weapon is Scepter {
                targetAlly.currentHealth += (weapon as! Scepter).magic
            }
            else {
                targetAlly.currentHealth += (weapon as! UltimateScepter).magic
            }
        }
        if targetAlly.currentHealth > targetAlly.maxHealth {
            targetAlly.currentHealth = targetAlly.maxHealth
        }
    }
}
