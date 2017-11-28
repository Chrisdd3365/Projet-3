//
//  Sword.swift
//  projet3
//
//  Created by Christophe DURAND on 19/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Sword: Weapon { // A sub-class which inherits from "Weapon" and associated with sub-class "Warrior"
    
    init() {
        super.init(damage: 10, magic: 0)
    }
}
