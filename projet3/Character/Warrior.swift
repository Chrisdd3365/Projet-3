//
//  Warrior.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Warrior: Character {
    
    init() {
        super.init(characterName: "", classeName: "Warrior", maxHealth: 100, currentHealth: 100, weapon: Sword())
    }
}
