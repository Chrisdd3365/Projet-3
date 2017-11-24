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
        super.init(characterName: name, characterClasse: "Mage", currentHealth: 70, weapon: Scepter(), myTeam: myTeam)
    }
    
    override func attack(targetEnnemy: Character) { // A mage can't attack in this game
        print("I can't attack.")
        self.heal(targetAlly: targetEnnemy)
    }
    
    func heal(targetAlly: Character) { // But a mage can heal in this game, thanks to this method named "heal"
        if targetAlly.currentHealth > 0 {
            let healNeeded = targetAlly.maxHealth - targetAlly.currentHealth
            if healNeeded > (weapon as! Scepter).magic {
                targetAlly.currentHealth += (weapon as! Scepter).magic
                targetAlly.myTeam.life += (weapon as! Scepter).magic
            }
            else {
                targetAlly.currentHealth += healNeeded
                targetAlly.myTeam.life += healNeeded
            }
        }
    }
}
