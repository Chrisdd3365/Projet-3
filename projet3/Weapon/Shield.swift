//
//  Shield.swift
//  projet3
//
//  Created by Christophe DURAND on 19/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Shield: Weapon { // A sub-class which inherits from "Weapon" and associated with sub-class "Giant"
    
    init() {
        super.init(damage: 3, magic: 0)
    }
}
