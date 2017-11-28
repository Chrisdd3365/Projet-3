//
//  Weapon.swift
//  projet3
//
//  Created by Christophe DURAND on 19/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Weapon { // To init parameters like "magic" for the mage and "damage" for the other 3 types of character
    
    var damage: Int
    var magic: Int
    
    init(damage: Int, magic: Int) {
        self.damage = damage
        self.magic = magic
    }
}
