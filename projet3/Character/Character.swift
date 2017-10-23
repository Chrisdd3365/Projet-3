//
//  Character.swift
//  projet3
//
//  Created by Christophe DURAND on 23/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Character {
    
    var nameCharacter: String
    var classe: String
    var hp: Int
    var mp: Int
    var atk: Int
    var def: Int
    var mag: Int
    
    init(nameCharacter: String, classe: String, hp: Int, mp: Int, atk: Int, def: Int, mag: Int) {
        self.nameCharacter = nameCharacter
        self.classe = classe
        self.hp = hp
        self.mp = mp
        self.atk = atk
        self.def = def
        self.mag = mag
    }
    
    func showCharacter() {
        print("Character's name: \(nameCharacter)"
            + "\nClasse: \(classe)"
            + "\nHP: \(hp)"
            + "\nMP: \(mp)"
            + "\nATK: \(atk)"
            + "\nDEF: \(def)"
            + "\nMAG: \(mag)"
            + "")
    }
}
