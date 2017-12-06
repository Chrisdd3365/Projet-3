//
//  Mage.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Mage: Character { // A sub-class which inherits from "Character"
    
    init(name: String, myTeam: Team) {
        super.init(characterName: name, characterClasse: "Mage", currentHealth: 70, weapon: Scepter())
    }
    
    override func attack(targetEnnemy: Character) { // An override method "attack" to avoid the Mage to attack because he can only heal his team
        print("I can't attack.")
        self.heal(targetAlly: targetEnnemy)
    }
    
    func heal(targetAlly: Character) { // A method named "heal" for the sub-class "Mage"
        if targetAlly.currentHealth > 0 {
            targetAlly.currentHealth += weapon.magic // If the ally's target is alive, the mage can heal him
        }
        if targetAlly.currentHealth > targetAlly.maxHealth {
            // If the ally's target current health is more than his max health, his current health will stay at the same amount as his max health. To avoid overheal.
            targetAlly.currentHealth = targetAlly.maxHealth
        }
    }
}
