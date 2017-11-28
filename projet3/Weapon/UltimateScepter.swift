//
//  UltimateScepter.swift
//  projet3
//
//  Created by Christophe DURAND on 24/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class UltimateScepter: Weapon { // A sub-class which inherits from "Weapon" and associated with sub-class "Mage". Created for the method "loot" in class "Game"
    
    init() {
        super.init(damage: 0, magic: 30)
    }
}
