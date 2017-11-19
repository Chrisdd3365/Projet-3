//
//  Dwarf.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Dwarf: Character {

    init() {
        super.init(characterName: "", classeName: "Dwarf", maxHealth: 80, currentHealth: 80, weapon: Axe())
    }
}
