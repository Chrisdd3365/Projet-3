//
//  Mage.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Mage: Character {
    
    init() {
        super.init(characterName: "", classeName: "Mage", maxHealth: 70, currentHealth: 70, weapon: Scepter())
    }
}
