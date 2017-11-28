//
//  UltimateWeapon.swift
//  projet3
//
//  Created by Christophe DURAND on 24/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class UltimateWeapon: Weapon { // A sub-class which inherits from "Weapon" and associated with sub-class "Warrior", "Dwarf" and "Giant". Created for the method "loot" in class "Game"
    
    init() {
        super.init(damage: 30, magic: 0)
    }
}
