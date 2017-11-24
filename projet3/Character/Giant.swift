//
//  Giant.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Giant: Character { // A super class named "Giant" to set things especially for this type of character 
    init(name: String, myTeam: Team) {
        super.init(characterName: name, characterClasse: "Giant", currentHealth: 120, weapon: Shield(), myTeam: myTeam)
    }
}
