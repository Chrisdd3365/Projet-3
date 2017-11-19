//
//  Giant.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Giant: Character {
    
    init() {
        super.init(characterName: "", classeName: "Giant", maxHealth: 120, currentHealth: 120, weapon: Shield())
    }
}
