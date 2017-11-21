//
//  Warrior.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Warrior: Character {
    
    init(name: String) {
        super.init(characterName: name, characterClasse: "Warrior", currentHealth: 100, weapon: Sword())
    }
}
